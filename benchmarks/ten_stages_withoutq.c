#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <math.h>
#include <time.h>

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


typedef struct {
    int thread_id;
    int stages[10];
    int stage_count;
} thread_config_t;

typedef struct {
    int *elements;
    int read_pos;
    int write_pos;
    int size;
} queue_t;

queue_t queue1, queue2, queue3, queue4, queue5, queue6, queue7, queue8, queue9, queue10, queue11;
pthread_mutex_t queue_mutex[11];
int Arr_size;
int full_count[11];
int group = 1;

void init_queue(queue_t *q, int size) {
    q->elements = (int *)malloc(size * sizeof(int));
    q->read_pos = -1;
    q->write_pos = -1;
    q->size = size;
}

void free_queue(queue_t *q) {
    free(q->elements);
}

int empty_queue(queue_t *q) {
    return q->read_pos == -1;
}

int get_element_from_queue(queue_t *q) {
    if (empty_queue(q)) {
        return TERM_TOKEN;
    }
    int value = q->elements[q->read_pos];
    if (q->read_pos >= q->write_pos) {
        q->read_pos = -1;
        q->write_pos = -1;
    } else {
        q->read_pos++;
    }
    return value;
}

void write_element_to_queue(queue_t *q, int value) {
    if (q->write_pos == q->size - 1) {
        full_count[0]++;
        return;
    }
    if (q->read_pos == -1) q->read_pos = 0;
    q->write_pos++;
    q->elements[q->write_pos] = value;
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
    pthread_mutex_lock(&queue_mutex[0]);
    int input = get_element_from_queue(&queue1);
    pthread_mutex_unlock(&queue_mutex[0]);
    if (input == TERM_TOKEN) return;
    computation();
    pthread_mutex_lock(&queue_mutex[1]);
    write_element_to_queue(&queue2, input);
    pthread_mutex_unlock(&queue_mutex[1]);
    printf("Thread %d for Stage 1, input= %d\n", thread_id, input);
}

void stage2(int thread_id) {
    pthread_mutex_lock(&queue_mutex[1]);
    int input = get_element_from_queue(&queue2);
    pthread_mutex_unlock(&queue_mutex[1]);
    if (input == TERM_TOKEN) return;
    computation();
    pthread_mutex_lock(&queue_mutex[2]);
    write_element_to_queue(&queue3, input);
    pthread_mutex_unlock(&queue_mutex[2]);
    printf("Thread %d for Stage 2, input= %d\n", thread_id, input);
}

void stage3(int thread_id) {
    pthread_mutex_lock(&queue_mutex[2]);
    int input = get_element_from_queue(&queue3);
    pthread_mutex_unlock(&queue_mutex[2]);
    if (input == TERM_TOKEN) return;
    computation();
    pthread_mutex_lock(&queue_mutex[3]);
    write_element_to_queue(&queue4, input);
    pthread_mutex_unlock(&queue_mutex[3]);
    printf("Thread %d for Stage 3, input= %d\n", thread_id, input);
}

void stage4(int thread_id) {
    pthread_mutex_lock(&queue_mutex[3]);
    int input = get_element_from_queue(&queue4);
    pthread_mutex_unlock(&queue_mutex[3]);
    if (input == TERM_TOKEN) return;
    computation();
    pthread_mutex_lock(&queue_mutex[4]);
    write_element_to_queue(&queue5, input);
    pthread_mutex_unlock(&queue_mutex[4]);
    printf("Thread %d for Stage 4, input= %d\n", thread_id, input);
}

void stage5(int thread_id) {
    pthread_mutex_lock(&queue_mutex[4]);
    int input = get_element_from_queue(&queue5);
    pthread_mutex_unlock(&queue_mutex[4]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 5, input= %d\n", thread_id, input);
}

void stage6(int thread_id) {
    pthread_mutex_lock(&queue_mutex[5]);
    int input = get_element_from_queue(&queue6);
    pthread_mutex_unlock(&queue_mutex[5]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 6, input= %d\n", thread_id, input);
}

void stage7(int thread_id) {
    pthread_mutex_lock(&queue_mutex[6]);
    int input = get_element_from_queue(&queue7);
    pthread_mutex_unlock(&queue_mutex[6]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 7, input= %d\n", thread_id, input);
}

void stage8(int thread_id) {
    pthread_mutex_lock(&queue_mutex[7]);
    int input = get_element_from_queue(&queue8);
    pthread_mutex_unlock(&queue_mutex[7]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 8, input= %d\n", thread_id, input);
}

void stage9(int thread_id) {
    pthread_mutex_lock(&queue_mutex[8]);
    int input = get_element_from_queue(&queue9);
    pthread_mutex_unlock(&queue_mutex[8]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 9, input= %d\n", thread_id, input);
}

void stage10(int thread_id) {
    pthread_mutex_lock(&queue_mutex[9]);
    int input = get_element_from_queue(&queue10);
    pthread_mutex_unlock(&queue_mutex[9]);
    if (input == TERM_TOKEN) return;
    computation();
    printf("Thread %d for Stage 10, input= %d\n", thread_id, input);
}


void queue1_values(queue_t *q) {
    for (int i = 0; i < Arr_size; i++) {
        int input = rand() % 100;
        write_element_to_queue(q, input);
    }
}

void* thread_function(void* arg) {
    thread_config_t* config = (thread_config_t*)arg;
    while (1) {
        int input_queue_empty = 0;
        for (int j = 0; j < config->stage_count; j++) {
            input_queue_empty = empty_queue(j == 0 ? &queue1 :
                                            j == 1 ? &queue2 :
                                            j == 2 ? &queue3 :
                                            j == 3 ? &queue4 :
                                            j == 4 ? &queue5 :
                                            j == 5 ? &queue6 :
                                            j == 6 ? &queue7 :
                                            j == 7 ? &queue8 :
                                            j == 8 ? &queue9 :
                                                     &queue10);

            if (input_queue_empty) break;
            switch (config->stages[j]) {
                case FUNC1: stage1(config->thread_id); break;
                case FUNC2: stage2(config->thread_id); break;
                case FUNC3: stage3(config->thread_id); break;
                case FUNC4: stage4(config->thread_id); break;
                case FUNC5: stage5(config->thread_id); break;
                case FUNC6: stage6(config->thread_id); break;
                case FUNC7: stage7(config->thread_id); break;
                case FUNC8: stage8(config->thread_id); break;
                case FUNC9: stage9(config->thread_id); break;
                case FUNC10: stage10(config->thread_id); break;

            }
        }
        if (input_queue_empty) break;
    }
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <array_size>\n", argv[0]);
        return 1;
    }
    Arr_size = atoi(argv[1]);
    pthread_t threads[MAX_THREADS];
    init_queue(&queue1, Arr_size);
    init_queue(&queue2, Arr_size);
    init_queue(&queue3, Arr_size);
    init_queue(&queue4, Arr_size);
    init_queue(&queue5, Arr_size);
    init_queue(&queue6, Arr_size);
    init_queue(&queue7, Arr_size);
    init_queue(&queue8, Arr_size);
    init_queue(&queue9, Arr_size);
    init_queue(&queue10, Arr_size);
    init_queue(&queue11, Arr_size);
    
    queue1_values(&queue1);
    for (int i = 0; i < 11; i++) {
        pthread_mutex_init(&queue_mutex[i], NULL);
        full_count[i] = 0;
    }
    thread_config_t thread_configs[MAX_THREADS];
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
        
//        thread_configs[3] = (thread_config_t){ 3, { FUNC4 }, 1 };
//        thread_configs[4] = (thread_config_t){ 4, { FUNC5 }, 1 };
    } else if (group == 2) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1, FUNC2 }, 2 };
        thread_configs[1] = (thread_config_t){ 1, { FUNC3 }, 1 };
        thread_configs[2] = (thread_config_t){ 2, { FUNC3 }, 1 };
    } else if (group == 3) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1 }, 1 };
        thread_configs[1] = (thread_config_t){ 1, { FUNC1 }, 1 };
        thread_configs[2] = (thread_config_t){ 2, { FUNC2, FUNC3 }, 2 };
    } else if (group == 4) {
        thread_configs[0] = (thread_config_t){ 0, { FUNC1, FUNC2, FUNC3 }, 3 };
        thread_configs[1] = (thread_config_t){ 1, { FUNC1, FUNC2, FUNC3 }, 3 };
        thread_configs[2] = (thread_config_t){ 2, { FUNC1, FUNC2, FUNC3 }, 3 };
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
    for (int i = 0; i < 6; i++) {
        pthread_mutex_destroy(&queue_mutex[i]);
    }
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
