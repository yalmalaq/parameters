#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>

#define TERM_TOKEN -1
#define MAX_THREADS 3
#define FUNC1 1
#define FUNC2 2
#define FUNC3 4



#define FUNC1_AND_FUNC2 7
#define FUNC2_AND_FUNC3 8
#define MERGED_FUNC 9

#define MAX_QUEUE_SIZE 100000000  // Prevents queue from growing infinitely



int group = 1;

typedef struct {
    int thread_id;
    int stages[3];
    int stage_count;
} thread_config_t;

typedef struct {
    int *elements;
    int read_pos;
    int write_pos;
    int count;
    int size;
    pthread_cond_t not_full;
    pthread_cond_t not_empty;
    int index;
} queue_t;

queue_t queue1, queue2, queue3, queue4;
pthread_mutex_t queue_mutex[4];
int Arr_size;
int full_count[4];

void init_queue(queue_t *q, int index, int size) {
    q->elements = (int *)malloc(size * sizeof(int));
    q->read_pos = 0;
    q->write_pos = 0;
    q->count = 0;
    q->size = (index == 0) ? size : 10;
    pthread_cond_init(&q->not_full, NULL);
    pthread_cond_init(&q->not_empty, NULL);
    q->index = index;
}

void free_queue(queue_t *q) {
    free(q->elements);
    pthread_cond_destroy(&q->not_full);
    pthread_cond_destroy(&q->not_empty);
}

int empty_queue(queue_t *q) {
    return q->count == 0;
}

int full_queue(queue_t *q) {
    return q->count == q->size;
}

int get_element_from_queue(queue_t *q) {
    pthread_mutex_lock(&queue_mutex[q->index]);

    while (q->count == 0) {
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
       ts.tv_sec += 1;

        if (pthread_cond_timedwait(&q->not_empty, &queue_mutex[q->index], &ts) == ETIMEDOUT) {
            printf("Queue %d is empty. Returning TERM_TOKEN...\n", q->index + 1);
            pthread_mutex_unlock(&queue_mutex[q->index]);
            return TERM_TOKEN;
        }
    }

    int value = q->elements[q->read_pos];
    q->read_pos = (q->read_pos + 1) % q->size;
    q->count--;

    pthread_cond_signal(&q->not_full);
    pthread_mutex_unlock(&queue_mutex[q->index]);

    return value;
}

//void write_element_to_queue(queue_t *q, int value) {
//    pthread_mutex_lock(&queue_mutex[q->index]);
//
//    while (q->count == q->size) {
//        struct timespec ts;
//        clock_gettime(CLOCK_REALTIME, &ts);
//        ts.tv_sec += 1;
//
//        if (pthread_cond_timedwait(&q->not_full, &queue_mutex[q->index], &ts) == ETIMEDOUT) {
//            printf("Queue %d is full. Backing off...\n", q->index + 1);
//            pthread_mutex_unlock(&queue_mutex[q->index]);
//            return;
//        }
//    }
//
//    q->elements[q->write_pos] = value;
//    q->write_pos = (q->write_pos + 1) % q->size;
//    q->count++;
//
//    pthread_cond_signal(&q->not_empty);
//    pthread_mutex_unlock(&queue_mutex[q->index]);
//}
void write_element_to_queue(queue_t *q, int value, int stage_id) {
    pthread_mutex_lock(&queue_mutex[q->index]);

    if (q->count == q->size && q->size < MAX_QUEUE_SIZE) {
        int new_size = q->size * 2;  // Double size
        if (new_size > MAX_QUEUE_SIZE) new_size = MAX_QUEUE_SIZE;  // Cap at MAX_QUEUE_SIZE

        q->elements = (int *)realloc(q->elements, new_size * sizeof(int));
        if (!q->elements) {
            fprintf(stderr, "Error: Queue %d expansion failed\n", q->index);
            pthread_mutex_unlock(&queue_mutex[q->index]);
            return;
        }
        q->size = new_size;
        printf("Queue %d resized to %d\n", q->index + 1, q->size);
    }

    q->elements[q->write_pos] = value;
    q->write_pos = (q->write_pos + 1) % q->size;
    q->count++;

    pthread_cond_signal(&q->not_empty);
    pthread_mutex_unlock(&queue_mutex[q->index]);
}




void computation() {
    for (int i = 0; i < 100000000; i++);
}

void memory_intensive() {
    static int array[100000000];
    int sum = 0;

    for (int i = 0; i < 10000000; i++) {
        int index = rand() % 10000000;
        sum += array[index];
    }

    printf("%d\n", sum);
}


void stage1(int thread_id) {
    int input = get_element_from_queue(&queue1);
    if (input == TERM_TOKEN) return;

    memory_intensive();

    write_element_to_queue(&queue2, input, 1);
    printf("Thread %d for Stage 1, input= %d\n", thread_id, input);
}

void stage2(int thread_id) {
    int input = get_element_from_queue(&queue2);
    if (input == TERM_TOKEN) return;

    memory_intensive();

    write_element_to_queue(&queue3, input, 2);
    printf("Thread %d for Stage 2, input= %d\n", thread_id, input);
}

void stage3(int thread_id) {
    int input = get_element_from_queue(&queue3);
    if (input == TERM_TOKEN) return;

    computation();

    write_element_to_queue(&queue4, input, 3);
    printf("Thread %d for Stage 3, input= %d\n", thread_id, input);
}




void stage1_and_stage2(int thread_id) {
    int input = get_element_from_queue(&queue1);
    if (input == TERM_TOKEN) return;

    memory_intensive();
    memory_intensive();

    write_element_to_queue(&queue2, input, 1);
    printf("Thread %d for Merged Stage 1+2, input= %d\n", thread_id, input);
}

void stage2_and_stage3(int thread_id) {
    int input = get_element_from_queue(&queue2);
    if (input == TERM_TOKEN) return;

    memory_intensive();
    memory_intensive();

    write_element_to_queue(&queue3, input, 2);
    printf("Thread %d for Merged Stage 2+3, input= %d\n", thread_id, input);
}

void merged_stages(int thread_id) {
    int input = get_element_from_queue(&queue1);
    if (input == TERM_TOKEN) return;

    memory_intensive();
    memory_intensive();
    memory_intensive();

    write_element_to_queue(&queue2, input, 1);
    printf("Thread %d for Merged Stages 1+2+3, input= %d\n", thread_id, input);

    if (group != 2 && group != 3 && group != 4) {
        write_element_to_queue(&queue4, input, 3);
    }

}

///////////////////
///
///

void* thread_function(void* arg) {
    thread_config_t* config = (thread_config_t*)arg;

    while (1) {
        int input_queue_empty = 0;

        for (int j = 0; j < config->stage_count; j++) {
            input_queue_empty = empty_queue(j == 0 ? &queue1 : j == 1 ? &queue2 : &queue3);

            if (input_queue_empty) break;

            switch (config->stages[j]) {
                case FUNC1:
                    stage1(config->thread_id);
                    break;
                case FUNC2:
                    stage2(config->thread_id);
                    break;
                case FUNC3:
                    stage3(config->thread_id);
                    break;
                    
                case FUNC1_AND_FUNC2:
                    stage1_and_stage2(config->thread_id);
                    break;
                case FUNC2_AND_FUNC3:
                    stage2_and_stage3(config->thread_id);
                    break;
                case MERGED_FUNC:
                    merged_stages(config->thread_id);
                    break;
            }
        }

        if (input_queue_empty) break;
    }

    pthread_exit(NULL);
}

void queue1_values(queue_t *q) {
    for (int i = 0; i < Arr_size; i++) {
        int input = rand() % 100;
        write_element_to_queue(q, input, 1);
    }
}

//void queue1_values(queue_t *q) {
//    for (int i = 0; i < Arr_size; i++) {
//        int input = rand() % 100;
//        write_element_to_queue(q, input, 1);
//    }
//
//    // Prefill stage queues to prevent initial slow memory accesses
//    for (int i = 0; i < Arr_size / 2; i++) {  // Load into deeper queues
//        write_element_to_queue(&queue2, rand() % 100, 2);
//        write_element_to_queue(&queue3, rand() % 100, 3);
//        write_element_to_queue(&queue4, rand() % 100, 4);
//        write_element_to_queue(&queue5, rand() % 100, 5);
//    }
//}


int main(int argc, char *argv[]) {
    printf("Debug: MAX_THREADS = %d\n", MAX_THREADS);

    if (argc < 2) {
        fprintf(stderr, "Usage: %s ./app array_size\n", argv[0]);
        return 1;
    }

    Arr_size = atoi(argv[1]);
//    int queue2_size = atoi(argv[2]);
//    int queue3_size = atoi(argv[3]);
//    int queue4_size = atoi(argv[4]);
//    int queue5_size = atoi(argv[5]);
//    int queue6_size = atoi(argv[6]);

    pthread_t threads[MAX_THREADS];
    init_queue(&queue1, 0, Arr_size);
    init_queue(&queue2, 1, Arr_size);
    init_queue(&queue3, 2, Arr_size);
    init_queue(&queue4, 3, Arr_size);
    

    queue1_values(&queue1);

    for (int i = 0; i < 4; i++) {
        pthread_mutex_init(&queue_mutex[i], NULL);
    }

    thread_config_t thread_configs[MAX_THREADS];
    // Configure threads based on group
    if (group == 1) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1 }, 1 };
        thread_configs[1] = (thread_config_t){ 1, { FUNC2 }, 1 };
        thread_configs[2] = (thread_config_t){ 2, { FUNC3 }, 1 };


    } else if (group == 2) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1, FUNC2 }, 2 };

    } else if (group == 3) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1 }, 1 };

    } else if (group == 4) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1, FUNC2, FUNC3 }, 3 };

    }

    clock_t start = clock();
    for (int i = 0; i < MAX_THREADS; i++) {
        pthread_create(&threads[i], NULL, thread_function, (void *)&thread_configs[i]);
    }

    for (int i = 0; i < MAX_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    clock_t end = clock();
    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Time spent: %f seconds\n", time_spent);

    free_queue(&queue1);
    free_queue(&queue2);
    free_queue(&queue3);
    free_queue(&queue4);


    printf("\nNumber of threads: %d\n", MAX_THREADS);
    printf("Array size: %d\n", Arr_size);
    printf("Queue 2 size: %d\n", queue2.size);
    printf("Queue 3 size: %d\n", queue3.size);
    printf("Queue 4 size: %d\n", queue4.size);
    printf("group: %d\n", group);
         for (int i = 0; i < MAX_THREADS; i++) {
             printf("Thread %d assigned stages: ", i);
             for (int j = 0; j < thread_configs[i].stage_count; j++) {
                 printf("%d ", thread_configs[i].stages[j]);
             }
             printf("\n");
         }

    return 0;
}
