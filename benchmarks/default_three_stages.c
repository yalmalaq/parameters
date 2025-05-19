#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define FORCE_CPU_BINDING
#ifdef FORCE_CPU_BINDING
void bind_thread_to_core(int core_id) {
    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(core_id, &cpuset);
    
    pthread_t current_thread = pthread_self();
    int result = pthread_setaffinity_np(current_thread, sizeof(cpu_set_t), &cpuset);
    if (result != 0)
        fprintf(stderr, "Error binding thread %lu to core %d: %d\n",
                (unsigned long)current_thread, core_id, result);
    else
        printf("Thread %lu bound to core %d\n", (unsigned long)current_thread, core_id);
}
#define MAYBE_BIND(core) bind_thread_to_core(core)
#else
#define MAYBE_BIND(core)
#endif


#define NUM_TASKS 10
#define TERMINATION_TASK -1


#define STAGE1_THREADS 1
#define STAGE2_THREADS 3
#define STAGE3_THREADS 4


typedef struct node {
    int data;
    struct node *next;
} node_t;

typedef struct {
    node_t *head;
    node_t *tail;
    pthread_mutex_t mutex;
    pthread_cond_t not_empty;
} queue_t;

queue_t* init_queue() {
    queue_t *q = malloc(sizeof(queue_t));
    if (!q) {
        perror("malloc queue_t");
        exit(EXIT_FAILURE);
    }
    q->head = q->tail = NULL;
    pthread_mutex_init(&q->mutex, NULL);
    pthread_cond_init(&q->not_empty, NULL);
    return q;
}

void write_queue(queue_t *q, int value) {
    node_t *new_node = malloc(sizeof(node_t));
    if (!new_node) {
        perror("malloc node_t");
        exit(EXIT_FAILURE);
    }
    new_node->data = value;
    new_node->next = NULL;
    
    pthread_mutex_lock(&q->mutex);
    if (q->tail)
        q->tail->next = new_node;
    else
        q->head = new_node;
    q->tail = new_node;
    pthread_cond_signal(&q->not_empty);
    pthread_mutex_unlock(&q->mutex);
}

int read_queue(queue_t *q) {
    pthread_mutex_lock(&q->mutex);
    while (q->head == NULL) {
        pthread_cond_wait(&q->not_empty, &q->mutex);
    }
    node_t *node = q->head;
    int value = node->data;
    q->head = node->next;
    if (q->head == NULL)
        q->tail = NULL;
    free(node);
    pthread_mutex_unlock(&q->mutex);
    return value;
}

void memory_workload() {
    const size_t ARRAY_SIZE = 100000000;
    int *array = malloc(ARRAY_SIZE * sizeof(int));
    if (!array) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }
    for (size_t i = 0; i < ARRAY_SIZE; i++)
        array[i] = i;
    volatile int accessed_values = 0;
    size_t stride = 64;
    for (size_t i = 0; i < ARRAY_SIZE; i += stride)
        accessed_values += array[i];
    printf("Memory workload accessed_values: %d\n", accessed_values);
    fflush(stdout);
    free(array);
}

void cpu_workload() {
    double sum = 1.0;
    for (int i = 1; i <= 50000000; i++) {
        sum *= (i % 10 + 1.1) / 1.05;
        sum += (sum / (i % 5 + 1.2)) * 1.03;
        sum = sum - (sum / 1.07);
    }
    volatile double result = sum;
}

//  for Intensive Mathematical Computations. //
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

//  for Intensive Mathematical Computations. //
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


typedef struct {
    queue_t *in_q;
    queue_t *out_q;
    const char *stage_name;
    int bind_core;
    int stage_thread_index;
} thread_param_t;

void *stage1(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK) {
            int tokens_to_forward = (STAGE2_THREADS / STAGE1_THREADS) +
                ((param->stage_thread_index < (STAGE2_THREADS % STAGE1_THREADS)) ? 1 : 0);
            for (int i = 0; i < tokens_to_forward; i++) {
                write_queue(param->out_q, TERMINATION_TASK);
            }
            break;
        }
        cpu_workload();
        write_queue(param->out_q, task);
        printf("%s (Thread %d bound to core %d) processed task %d\n",
               param->stage_name, param->stage_thread_index, param->bind_core, task);
        fflush(stdout);
    }
    
    return NULL;
}

void *stage2(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK) {
            int tokens_to_forward = (STAGE3_THREADS / STAGE2_THREADS) +
                ((param->stage_thread_index < (STAGE3_THREADS % STAGE2_THREADS)) ? 1 : 0);
            for (int i = 0; i < tokens_to_forward; i++) {
                write_queue(param->out_q, TERMINATION_TASK);
            }
            break;
        }
        cpu_workload();
        write_queue(param->out_q, task);
        printf("%s (Thread %d bound to core %d) processed task %d\n",
               param->stage_name, param->stage_thread_index, param->bind_core, task);
        fflush(stdout);
    }
    
    return NULL;
}

void *stage3(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        printf("%s (Thread %d bound to core %d) processed task %d\n",
               param->stage_name, param->stage_thread_index, param->bind_core, task);
        fflush(stdout);
    }
    
    return NULL;
}

int main(void) {

    queue_t *queue1 = init_queue();
    queue_t *queue2 = init_queue();
    queue_t *queue3 = init_queue();

    pthread_t stage1_threads[STAGE1_THREADS];
    thread_param_t stage1_params[STAGE1_THREADS];
    for (int i = 0; i < STAGE1_THREADS; i++) {
        stage1_params[i].in_q = queue1;
        stage1_params[i].out_q = queue2;
        stage1_params[i].stage_name = "Stage 1";
        stage1_params[i].bind_core = i;  // e.g. cores 0,1,...
        stage1_params[i].stage_thread_index = i;
        if (pthread_create(&stage1_threads[i], NULL, stage1, &stage1_params[i]) != 0) {
            perror("pthread_create stage1");
            exit(EXIT_FAILURE);
        }
    }
    
    pthread_t stage2_threads[STAGE2_THREADS];
    thread_param_t stage2_params[STAGE2_THREADS];
    for (int i = 0; i < STAGE2_THREADS; i++) {
        stage2_params[i].in_q = queue2;
        stage2_params[i].out_q = queue3;
        stage2_params[i].stage_name = "Stage 2";
        stage2_params[i].bind_core = STAGE1_THREADS + i;
        stage2_params[i].stage_thread_index = i;
        if (pthread_create(&stage2_threads[i], NULL, stage2, &stage2_params[i]) != 0) {
            perror("pthread_create stage2");
            exit(EXIT_FAILURE);
        }
    }
    
    pthread_t stage3_threads[STAGE3_THREADS];
    thread_param_t stage3_params[STAGE3_THREADS];
    for (int i = 0; i < STAGE3_THREADS; i++) {
        stage3_params[i].in_q = queue3;
        stage3_params[i].out_q = NULL;
        stage3_params[i].stage_name = "Stage 3";
        stage3_params[i].bind_core = STAGE1_THREADS + STAGE2_THREADS + i;
        stage3_params[i].stage_thread_index = i;
        if (pthread_create(&stage3_threads[i], NULL, stage3, &stage3_params[i]) != 0) {
            perror("pthread_create stage3");
            exit(EXIT_FAILURE);
        }
    }
    
    for (int t = 0; t < NUM_TASKS; t++) {
        write_queue(queue1, t);
    }
    
    for (int i = 0; i < STAGE1_THREADS; i++) {
        write_queue(queue1, TERMINATION_TASK);
    }

    for (int i = 0; i < STAGE1_THREADS; i++) {
        pthread_join(stage1_threads[i], NULL);
    }
    for (int i = 0; i < STAGE2_THREADS; i++) {
        pthread_join(stage2_threads[i], NULL);
    }
    for (int i = 0; i < STAGE3_THREADS; i++) {
        pthread_join(stage3_threads[i], NULL);
    }
    
    printf("Pipeline processing complete.\n");
    return 0;
}
