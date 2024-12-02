#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <math.h>
#include <time.h>

#define TERM_TOKEN -1
#define MAX_THREADS 3
#define FUNC1 1
#define FUNC2 2
#define FUNC3 3

typedef struct {
    int thread_id;
    int stages[3];
    int stage_count;
} thread_config_t;

typedef struct {
    int *elements;
    int read_pos;
    int write_pos;
} queue_t;

queue_t queue1, queue2, queue3, queue4;
pthread_mutex_t queue_mutex[4];
int Arr_size;
int full_count[4];

void init_queue(queue_t *q) {
    q->elements = (int *)malloc(Arr_size * sizeof(int));
    q->read_pos = -1;
    q->write_pos = -1;
}

void free_queue(queue_t *q) {
    free(q->elements);
}

int empty_queue(queue_t *q) {
    return q->read_pos == -1;
}

int full_queue(queue_t *q) {
    return q->write_pos == Arr_size - 1;
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
    if (full_queue(q)) {
        full_count[0]++;
        return;
    }
    if (q->read_pos == -1) q->read_pos = 0;
    q->write_pos++;
    q->elements[q->write_pos] = value;
}

int fibonacci_iterative(int n) {
    if (n <= 1) return n;
    int a = 0, b = 1, c;
    for (int i = 2; i <= n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return b;
}

unsigned long long factorial_iterative(int n) {
    if (n > 20) {
        printf("Warning: Factorial input %d is too large, limiting to 20!\n", n);
        n = 20;
    }
    if (n == 0) return 1;
    unsigned long long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

void heavy_computation(int n) {
    volatile int sum = 0;
    for (int i = 0; i < n * 10000; i++) {
        sum += i;
    }
}

void perform_stage(int stage, int thread_id) {
    int input;
    switch (stage) {
        case FUNC1:
            pthread_mutex_lock(&queue_mutex[0]);
            input = get_element_from_queue(&queue1);
            pthread_mutex_unlock(&queue_mutex[0]);
            if (input == TERM_TOKEN) return;

            int fib_result = fibonacci_iterative(input % 40);
            unsigned long long fact_result = factorial_iterative(input % 15);
            heavy_computation(fib_result);
            pthread_mutex_lock(&queue_mutex[1]);
            write_element_to_queue(&queue2, fib_result);
            pthread_mutex_unlock(&queue_mutex[1]);
            printf("Thread %d performing Stage 1, input= %d, fib_result= %d\n", thread_id, input, fib_result);
            break;

        case FUNC2:
            pthread_mutex_lock(&queue_mutex[1]);
            input = get_element_from_queue(&queue2);
            pthread_mutex_unlock(&queue_mutex[1]);
            if (input == TERM_TOKEN) return;

            int fib_stage2 = fibonacci_iterative(input % 40);
            heavy_computation(fib_stage2);
            pthread_mutex_lock(&queue_mutex[2]);
            write_element_to_queue(&queue3, fib_stage2);
            pthread_mutex_unlock(&queue_mutex[2]);
            printf("Thread %d performing Stage 2, input= %d, fib_result= %d\n", thread_id, input, fib_stage2);
            break;

        case FUNC3:
            pthread_mutex_lock(&queue_mutex[2]);
            input = get_element_from_queue(&queue3);
            pthread_mutex_unlock(&queue_mutex[2]);
            if (input == TERM_TOKEN) return;

            unsigned long long fact_stage3 = factorial_iterative(input);
            pthread_mutex_lock(&queue_mutex[3]);
            write_element_to_queue(&queue4, fact_stage3);
            pthread_mutex_unlock(&queue_mutex[3]);
            printf("Thread %d performing Stage 3, input= %d, fact_result= %llu\n", thread_id, input, fact_stage3);
            break;

        default:
            printf("Invalid stage %d\n", stage);
    }
}

void* thread_function(void* arg) {
    thread_config_t* config = (thread_config_t*)arg;

    while (1) {
        int input_queue_empty = 0;

        for (int j = 0; j < config->stage_count; j++) {
            pthread_mutex_lock(&queue_mutex[j]);
            input_queue_empty = empty_queue(j == 0 ? &queue1 : j == 1 ? &queue2 : &queue3);
            pthread_mutex_unlock(&queue_mutex[j]);
            
            if (input_queue_empty) break;

            perform_stage(config->stages[j], config->thread_id);
        }

        if (input_queue_empty) break;
    }
    
    pthread_exit(NULL);
}

void queue1_values(queue_t *q) {
    for (int i = 0; i < Arr_size; i++) {
        int input = rand() % 100;
        write_element_to_queue(q, input);
    }
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <array_size>\n", argv[0]);
        return 1;
    }

    Arr_size = atoi(argv[1]);
    pthread_t threads[MAX_THREADS];
    init_queue(&queue1);
    init_queue(&queue2);
    init_queue(&queue3);
    init_queue(&queue4);

    queue1_values(&queue1);


    for (int i = 0; i < 4; i++) {
        pthread_mutex_init(&queue_mutex[i], NULL);
        full_count[i] = 0;
    }
    
    // Here is the configs of thread assignments (grouping:
    thread_config_t thread_configs[MAX_THREADS];
    thread_configs[0] = (thread_config_t){ 0, { FUNC1 }, 1 };
    thread_configs[1] = (thread_config_t){ 1, { FUNC2 }, 1 };
    thread_configs[2] = (thread_config_t){ 2, { FUNC3 }, 1 };


    clock_t start = clock();
    for (int i = 0; i < MAX_THREADS; i++) {
        pthread_create(&threads[i], NULL, thread_function, (void *)&thread_configs[i]);
    }

    for (int i = 0; i < MAX_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    clock_t end = clock();
    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;
pthread_mutex_lock(&queue_mutex[3]);
    while (!empty_queue(&queue4)) {
        unsigned long long value = get_element_from_queue(&queue4);
        if (value != TERM_TOKEN) {
            printf("Final result from Queue 4: %llu\n", value);
        }
    }
    pthread_mutex_unlock(&queue_mutex[3]);

    for (int i = 0; i < 4; i++) {
        pthread_mutex_destroy(&queue_mutex[i]);
    }

    free_queue(&queue1);
    free_queue(&queue2);
    free_queue(&queue3);
    free_queue(&queue4);
printf("\nNumber of threads: %d\n", MAX_THREADS);
printf("Array size: %d\n", Arr_size);
    printf("Thread assignments:\n");

      for (int i = 0; i < MAX_THREADS; i++) {
          printf("Thread %d assigned stages: ", i);
          for (int j = 0; j < thread_configs[i].stage_count; j++) {
              printf("%d ", thread_configs[i].stages[j]);
          }
          printf("\n");
      }
    return 0;
}

    
    
    
    
    
    

    



    
    
    
    
  
