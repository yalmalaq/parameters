#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>

#define TERM_TOKEN -1
#define MAX_THREADS 10
#define FUNC1 1
#define FUNC2 2
#define FUNC3 3
#define FUNC4 4
#define FUNC5 5
#define FUNC6 6
#define FUNC7 7
#define FUNC8 8
#define FUNC9 9
#define FUNC10 10

#define MAX_QUEUE_SIZE 100000000  // Prevents queue from growing infinitely

int group = 1;

typedef struct {
    int thread_id;
    int stages[10];
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

queue_t queue1, queue2, queue3, queue4, queue5, queue6, queue7, queue8, queue9, queue10, queue11;
pthread_mutex_t queue_mutex[11];
int Arr_size;

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

void write_element_to_queue(queue_t *q, int value, int stage_id) {
    pthread_mutex_lock(&queue_mutex[q->index]);

    if (q->count == q->size && q->size < MAX_QUEUE_SIZE) {
        int new_size = q->size * 2;
        if (new_size > MAX_QUEUE_SIZE) new_size = MAX_QUEUE_SIZE;

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

// new memory intensive workload
//void memory_intensive() {
//    int *array = (int *)malloc(100000000 * sizeof(int));
//    int sum = 0;
//    for (int i = 0; i < 10000000; i++) {
//        int index = rand() % 10000000;
//        sum += array[index];
//    }
//    printf("%d\n", sum);
//    free(array);
//}



// Stage functions
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
    memory_intensive();
    write_element_to_queue(&queue4, input, 3);
    printf("Thread %d for Stage 3, input= %d\n", thread_id, input);
}

void stage4(int thread_id) {
    int input = get_element_from_queue(&queue4);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue5, input, 4);
    printf("Thread %d for Stage 4, input= %d\n", thread_id, input);
}

void stage5(int thread_id) {
    int input = get_element_from_queue(&queue5);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue6, input, 5);
    printf("Thread %d for Stage 5, input= %d\n", thread_id, input);
}

void stage6(int thread_id) {
    int input = get_element_from_queue(&queue6);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue7, input, 6);
    printf("Thread %d for Stage 6, input= %d\n", thread_id, input);
}

void stage7(int thread_id) {
    int input = get_element_from_queue(&queue7);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue8, input, 7);
    printf("Thread %d for Stage 7, input= %d\n", thread_id, input);
}

void stage8(int thread_id) {
    int input = get_element_from_queue(&queue8);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue9, input, 8);
    printf("Thread %d for Stage 8, input= %d\n", thread_id, input);
}

void stage9(int thread_id) {
    int input = get_element_from_queue(&queue9);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue10, input, 9);
    printf("Thread %d for Stage 9, input= %d\n", thread_id, input);
}

void stage10(int thread_id) {
    int input = get_element_from_queue(&queue10);
    if (input == TERM_TOKEN) return;
    memory_intensive();
    write_element_to_queue(&queue11, input, 10);
    printf("Thread %d for Stage 10, input= %d\n", thread_id, input);
}


void* thread_function(void* arg) {
    thread_config_t* config = (thread_config_t*)arg;

    while (1) {
        int input_queue_empty = 0;

        for (int j = 0; j < config->stage_count; j++) {
            input_queue_empty = empty_queue(j == 0 ? &queue1 : j == 1 ? &queue2 : j == 2 ? &queue3 : j == 3 ? &queue4 : j == 4 ? &queue5 : j == 5 ? &queue6 : j == 6 ? &queue7 : j == 7 ? &queue8 : j == 8 ? &queue9 : &queue10);

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
                case FUNC4:
                    stage4(config->thread_id);
                    break;
                case FUNC5:
                    stage5(config->thread_id);
                    break;
                case FUNC6:
                    stage6(config->thread_id);
                    break;
                case FUNC7:
                    stage7(config->thread_id);
                    break;
                case FUNC8:
                    stage8(config->thread_id);
                    break;
                case FUNC9:
                    stage9(config->thread_id);
                    break;
                case FUNC10:
                    stage10(config->thread_id);
                    break;
//                    
//                case FUNC1_AND_FUNC2:
//                    stage1_and_stage2(config->thread_id);
//                    break;
//                case FUNC2_AND_FUNC3:
//                    stage2_and_stage3(config->thread_id);
//                    break;
//                case MERGED_FUNC:
//                    merged_stages(config->thread_id);
//                    break;
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

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s ./app array_size\n", argv[0]);
        return 1;
    }

    Arr_size = atoi(argv[1]);

    pthread_t threads[MAX_THREADS];
    init_queue(&queue1, 0, Arr_size);
    init_queue(&queue2, 1, Arr_size);
    init_queue(&queue3, 2, Arr_size);
    init_queue(&queue4, 3, Arr_size);
    init_queue(&queue5, 4, Arr_size);
    init_queue(&queue6, 5, Arr_size);
    init_queue(&queue7, 6, Arr_size);
    init_queue(&queue8, 7, Arr_size);
    init_queue(&queue9, 8, Arr_size);
    init_queue(&queue10, 9, Arr_size);
    init_queue(&queue11, 10, Arr_size);
    

    queue1_values(&queue1);
    
    for (int i = 0; i < 11; i++) {
        pthread_mutex_init(&queue_mutex[i], NULL);
    }
    

    thread_config_t thread_configs[MAX_THREADS];
    // Configure threads based on group
    if (group == 1) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1 }, 1 };
        thread_configs[1] = (thread_config_t){ 1, { FUNC2 }, 1 };
        thread_configs[2] = (thread_config_t){ 2, { FUNC3 }, 1 };
        thread_configs[3] = (thread_config_t){ 3, { FUNC4 }, 1 };
        thread_configs[4] = (thread_config_t){ 4, { FUNC5 }, 1 };
        thread_configs[5] = (thread_config_t){ 5, { FUNC6 }, 1 };
        thread_configs[6] = (thread_config_t){ 6, { FUNC7 }, 1 };
        thread_configs[7] = (thread_config_t){ 7, { FUNC8 }, 1 };
        thread_configs[8] = (thread_config_t){ 8, { FUNC9 }, 1 };
        thread_configs[9] = (thread_config_t){ 9, { FUNC10 }, 1 };
    } else if (group == 2) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1, FUNC2 }, 2 };

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
        free_queue(&queue5);
        free_queue(&queue6);
        free_queue(&queue7);
        free_queue(&queue8);
        free_queue(&queue9);
        free_queue(&queue10);
        free_queue(&queue11);

        printf("\nNumber of threads: %d\n", MAX_THREADS);
        printf("Array size: %d\n", Arr_size);
        printf("Queue 2 size: %d\n", queue2.size);
        printf("Queue 3 size: %d\n", queue3.size);
        printf("Queue 4 size: %d\n", queue4.size);
        printf("Queue 5 size: %d\n", queue5.size);
        printf("Queue 6 size: %d\n", queue6.size);
        printf("Queue 7 size: %d\n", queue7.size);
        printf("Queue 8 size: %d\n", queue8.size);
        printf("Queue 9 size: %d\n", queue9.size);
        printf("Queue 10 size: %d\n", queue10.size);
        printf("Queue 11 size: %d\n", queue11.size);
        
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
