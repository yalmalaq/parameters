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
#define FUNC3 4
#define FUNC4 5
#define FUNC5 6
#define FUNC6 7
#define FUNC7 8
#define FUNC8 9
#define FUNC9 10
#define FUNC10 11



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
int full_count[4];

void init_queue(queue_t *q, int index, int size) {
    q->elements = (int *)malloc(size * sizeof(int));
    q->read_pos = 0;
    q->write_pos = 0;
    q->count = 0;
    q->size = size;
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

    while (q->count == q->size) {
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
        ts.tv_sec += 1;

        if (pthread_cond_timedwait(&q->not_full, &queue_mutex[q->index], &ts) == ETIMEDOUT) {
            printf("Queue %d is full. Backing off...\n", q->index + 1);
            pthread_mutex_unlock(&queue_mutex[q->index]);
            return;
        }
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





///////////////////
///
///

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

    if (argc < 12) {
        fprintf(stderr, "Usage: %s ./app queue1_size queue2_size queue3_size queue4_size queue5_size queue6_size queue7_size queue8_size queue9_size queue10_size queue11_size\n", argv[0]);
        return 1;
    }

    Arr_size = atoi(argv[1]);
    int queue2_size = atoi(argv[2]);
    int queue3_size = atoi(argv[3]);
    int queue4_size = atoi(argv[4]);
    int queue5_size = atoi(argv[5]);
    int queue6_size = atoi(argv[6]);
    int queue7_size = atoi(argv[7]);
    int queue8_size = atoi(argv[8]);
    int queue9_size = atoi(argv[9]);
    int queue10_size = atoi(argv[10]);
    int queue11_size = atoi(argv[11]);

    pthread_t threads[MAX_THREADS];
    init_queue(&queue1, 0, Arr_size);
    init_queue(&queue2, 1, queue2_size);
    init_queue(&queue3, 2, queue3_size);
    init_queue(&queue4, 3, queue4_size);
    init_queue(&queue5, 4, queue5_size);
    init_queue(&queue6, 5, queue6_size);
    init_queue(&queue7, 6, queue7_size);
    init_queue(&queue8, 7, queue8_size);
    init_queue(&queue9, 8, queue9_size);
    init_queue(&queue10, 9, queue10_size);
    init_queue(&queue11, 10, queue11_size);
    

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
