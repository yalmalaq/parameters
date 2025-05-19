#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sched.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>

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

#define MAX_THREADS 9
int global_tid = 0;
int global_cpu_mapping[MAX_THREADS] = {0};

#define NUM_TASKS 10
#define TERMINATION_TASK -1

#define GROUP_1 1
#define GROUP_2 2
#define GROUP_3 3
#define GROUP_4 4


#define STAGE1_THREADS 1
#define STAGE2_THREADS 1
#define STAGE3_THREADS 1

#define GROUP2_STAGE12_THREADS 2
#define GROUP2_STAGE3_THREADS 1

#define GROUP3_STAGE1_THREADS 1
#define GROUP3_STAGE23_THREADS 2

#define GROUP4_THREADS 3

int queue1_size = 4;
int queue2_size = 4;
int queue3_size = 4;


typedef struct {
    int *elements;
    int read_pos, write_pos, count, size;
    int index;
    pthread_cond_t not_full, not_empty;
} queue_t;

pthread_mutex_t queue_mutex[4];

queue_t* init_queue(int size, int idx) {
    queue_t *q = malloc(sizeof(queue_t));
    q->elements = malloc(size * sizeof(int));
    q->read_pos = q->write_pos = q->count = 0;
    q->size = size;
    q->index = idx;
    pthread_cond_init(&q->not_full, NULL);
    pthread_cond_init(&q->not_empty, NULL);
    return q;
}

void free_queue(queue_t *q) {
    free(q->elements);
    pthread_cond_destroy(&q->not_full);
    pthread_cond_destroy(&q->not_empty);
}
void write_queue(queue_t *q, int value) {
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

int read_queue(queue_t *q) {
    pthread_mutex_lock(&queue_mutex[q->index]);
    while (q->count == 0) {
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
        ts.tv_sec += 5;
        if (pthread_cond_timedwait(&q->not_empty, &queue_mutex[q->index], &ts) == ETIMEDOUT) {
            printf("Queue %d is empty. Returning TERM_TOKEN...\n", q->index + 1);
            pthread_mutex_unlock(&queue_mutex[q->index]);
            return TERMINATION_TASK;
        }
    }
    int value = q->elements[q->read_pos];
    q->read_pos = (q->read_pos + 1) % q->size;
    q->count--;
    pthread_cond_signal(&q->not_full);
    pthread_mutex_unlock(&queue_mutex[q->index]);
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
    int index;
    queue_t *in_q;
    queue_t *out_q;
    const char *stage_name;
    int bind_core;
    int stage3_variant;
} thread_param_t;

void *stage1(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        computation();
        if (param->out_q)
            write_queue(param->out_q, task);
        printf("Stage 1 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}

void *stage2(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        if (param->out_q)
            write_queue(param->out_q, task);
        printf("Stage 2 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}

void *stage3(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        printf("Stage 3 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}

void *stage1_and_stage2(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        cpu_workload();
        if (param->out_q)
            write_queue(param->out_q, task);
        printf("Stage 1+2 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}

void *stage2_and_stage3(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        cpu_workload();
        printf("Stage 2+3 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}

void *merged_all_stages(void *arg) {
    thread_param_t *param = (thread_param_t *)arg;
    MAYBE_BIND(param->bind_core);
    int idx = param->index;
    while (1) {
        int task = read_queue(param->in_q);
        if (task == TERMINATION_TASK)
            break;
        cpu_workload();
        cpu_workload();
        cpu_workload();
        printf("Stage 1+2+3 - Global Thread %d processed input %d\n", idx, task);
        fflush(stdout);
    }
    return NULL;
}
int main(int argc, char *argv[]) {
    int pipeline_group = GROUP_1;
    if (argc >= 2) {
        pipeline_group = atoi(argv[1]);
    }
    if (pipeline_group == GROUP_1 && argc >= 5) {
        queue1_size = atoi(argv[2]);
        queue2_size = atoi(argv[3]);
        queue3_size = atoi(argv[4]);
    } else if (pipeline_group == GROUP_2 && argc >= 4) {
        queue1_size = atoi(argv[2]);
        queue3_size = atoi(argv[3]);
    } else if (pipeline_group == GROUP_3 && argc >= 3) {
        queue1_size = atoi(argv[2]);
        queue2_size = atoi(argv[3]);
    } else if (pipeline_group == GROUP_4 && argc >= 3) {
        queue1_size = atoi(argv[2]);
    }

    if (pipeline_group == GROUP_1) {
        printf("Running pipeline group: 1 (Separate Stage1, Stage2, Stage3)\n");
        queue_t *queue1 = init_queue(queue1_size, 0);
        queue_t *queue2 = init_queue(queue2_size, 1);
        queue_t *queue3 = init_queue(queue3_size, 2);
        for (int i = 0; i < 3; i++) {
            pthread_mutex_init(&queue_mutex[i], NULL);
        }
        pthread_t s1_threads[STAGE1_THREADS];
        pthread_t s2_threads[STAGE2_THREADS];
        pthread_t s3_threads[STAGE3_THREADS];
        thread_param_t stage1_params[STAGE1_THREADS];
        thread_param_t stage2_params[STAGE2_THREADS];
        thread_param_t stage3_params[STAGE3_THREADS];
        for (int i = 0; i < STAGE1_THREADS; i++) {
            stage1_params[i].index = global_tid;
            stage1_params[i].in_q = queue1;
            stage1_params[i].out_q = queue2;
            stage1_params[i].stage_name = "Group1 - Stage 1";
            stage1_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = stage1_params[i].bind_core;
            global_tid++;
            pthread_create(&s1_threads[i], NULL, stage1, &stage1_params[i]);
        }
        for (int i = 0; i < STAGE2_THREADS; i++) {
            stage2_params[i].index = global_tid;
            stage2_params[i].in_q = queue2;
            stage2_params[i].out_q = queue3;
            stage2_params[i].stage_name = "Group1 - Stage 2";
            stage2_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = stage2_params[i].bind_core;
            global_tid++;
            pthread_create(&s2_threads[i], NULL, stage2, &stage2_params[i]);
        }
        for (int i = 0; i < STAGE3_THREADS; i++) {
            stage3_params[i].index = global_tid;
            stage3_params[i].in_q = queue3;
            stage3_params[i].out_q = NULL;
            stage3_params[i].stage_name = "Group1 - Stage 3";
            stage3_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            stage3_params[i].stage3_variant = 0;
            global_cpu_mapping[global_tid] = stage3_params[i].bind_core;
            global_tid++;
            pthread_create(&s3_threads[i], NULL, stage3, &stage3_params[i]);
        }
        int t = 0;
        while (t < NUM_TASKS) {
            pthread_mutex_lock(&queue_mutex[queue1->index]);
            int free_slots = queue1->size - queue1->count;
            pthread_mutex_unlock(&queue_mutex[queue1->index]);
            if (free_slots > 0) {
                int batch_size = (free_slots < (NUM_TASKS - t)) ? free_slots : (NUM_TASKS - t);
                for (int j = 0; j < batch_size; j++, t++) {
                    write_queue(queue1, t);
                }
            } else {
                sched_yield();
            }
        }
        for (int j = 0; j < STAGE1_THREADS; j++) {
            write_queue(queue1, TERMINATION_TASK);
        }
        for (int j = 0; j < STAGE1_THREADS; j++) {
            pthread_join(s1_threads[j], NULL);
        }
        for (int j = 0; j < STAGE2_THREADS; j++) {
            write_queue(queue2, TERMINATION_TASK);
        }
        for (int j = 0; j < STAGE2_THREADS; j++) {
            pthread_join(s2_threads[j], NULL);
        }
        for (int j = 0; j < STAGE3_THREADS; j++) {
            write_queue(queue3, TERMINATION_TASK);
        }
        for (int j = 0; j < STAGE3_THREADS; j++) {
            pthread_join(s3_threads[j], NULL);
        }
        for (int i = 0; i < 3; i++) {
            pthread_mutex_destroy(&queue_mutex[i]);
        }
        free_queue(queue1);
        free_queue(queue2);
        free_queue(queue3);
        printf("\n=== Debugging Summary ===\n");
        printf("Group: 1\n");
        printf("Total threads: %d\n", global_tid);
        printf("Stage 1 threads: %d\n", STAGE1_THREADS);
        printf("Stage 2 threads: %d\n", STAGE2_THREADS);
        printf("Stage 3 threads: %d\n", STAGE3_THREADS);
        printf("Queue 1 Size: %d\n", queue1_size);
        printf("Queue 2 Size: %d\n", queue2_size);
        printf("Queue 3 Size: %d\n", queue3_size);
    }
    else if (pipeline_group == GROUP_2) {
        printf("Running pipeline group: 2 (Merged Stage1+2, Separate Stage3)\n");
        queue_t *queue1 = init_queue(queue1_size, 0);
        queue_t *queue3 = init_queue(queue3_size, 1);
        for (int i = 0; i < 2; i++) {
            pthread_mutex_init(&queue_mutex[i], NULL);
        }
        pthread_t st12_threads[GROUP2_STAGE12_THREADS];
        pthread_t s3_threads[GROUP2_STAGE3_THREADS];
        thread_param_t group2_st12_params[GROUP2_STAGE12_THREADS];
        thread_param_t group2_s3_params[GROUP2_STAGE3_THREADS];
        for (int i = 0; i < GROUP2_STAGE12_THREADS; i++) {
            group2_st12_params[i].index = global_tid;
            group2_st12_params[i].in_q = queue1;
            group2_st12_params[i].out_q = queue3;
            group2_st12_params[i].stage_name = "Group2 - Merged Stage1+2";
            group2_st12_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = group2_st12_params[i].bind_core;
            global_tid++;
            pthread_create(&st12_threads[i], NULL, stage1_and_stage2, &group2_st12_params[i]);
        }
        for (int i = 0; i < GROUP2_STAGE3_THREADS; i++) {
            group2_s3_params[i].index = global_tid;
            group2_s3_params[i].in_q = queue3;
            group2_s3_params[i].out_q = NULL;
            group2_s3_params[i].stage_name = "Group2 - Stage 3";
            group2_s3_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            group2_s3_params[i].stage3_variant = 1;
            global_cpu_mapping[global_tid] = group2_s3_params[i].bind_core;
            global_tid++;
            pthread_create(&s3_threads[i], NULL, stage3, &group2_s3_params[i]);
        }
        int t = 0;
        while (t < NUM_TASKS) {
            pthread_mutex_lock(&queue_mutex[queue1->index]);
            int free_slots = queue1->size - queue1->count;
            pthread_mutex_unlock(&queue_mutex[queue1->index]);
            if (free_slots > 0) {
                int batch_size = (free_slots < (NUM_TASKS - t)) ? free_slots : (NUM_TASKS - t);
                for (int j = 0; j < batch_size; j++, t++) {
                    write_queue(queue1, t);
                }
            } else {
                sched_yield();
            }
        }
        for (int j = 0; j < GROUP2_STAGE12_THREADS; j++) {
            write_queue(queue1, TERMINATION_TASK);
        }
        for (int j = 0; j < GROUP2_STAGE12_THREADS; j++) {
            pthread_join(st12_threads[j], NULL);
        }
        for (int j = 0; j < GROUP2_STAGE3_THREADS; j++) {
            write_queue(queue3, TERMINATION_TASK);
        }
        for (int j = 0; j < GROUP2_STAGE3_THREADS; j++) {
            pthread_join(s3_threads[j], NULL);
        }
        for (int i = 0; i < 2; i++) {
            pthread_mutex_destroy(&queue_mutex[i]);
        }
        free_queue(queue1);
        free_queue(queue3);
        
        printf("\n=== Debugging Summary ===\n");
        printf("Group: 2\n");
        printf("Total threads: %d\n", global_tid);
        printf("Merged Stage1+2 threads: %d\n", GROUP2_STAGE12_THREADS);
        printf("Stage 3 threads: %d\n", GROUP2_STAGE3_THREADS);
        printf("Queue 1 Size: %d\n", queue1_size);
        printf("Queue 3 Size: %d\n", queue3_size);
    }
    else if (pipeline_group == GROUP_3) {
        printf("Running pipeline group: 3 (Separate Stage1, Merged Stage2+3)\n");
        queue_t *queue1 = init_queue(queue1_size, 0);
        queue_t *queue2 = init_queue(queue2_size, 1);
        for (int i = 0; i < 2; i++) {
            pthread_mutex_init(&queue_mutex[i], NULL);
        }
        pthread_t s1_threads[GROUP3_STAGE1_THREADS];
        pthread_t st23_threads[GROUP3_STAGE23_THREADS];
        thread_param_t group3_s1_params[GROUP3_STAGE1_THREADS];
        thread_param_t group3_st23_params[GROUP3_STAGE23_THREADS];
        for (int i = 0; i < GROUP3_STAGE1_THREADS; i++) {
            group3_s1_params[i].index = global_tid;
            group3_s1_params[i].in_q = queue1;
            group3_s1_params[i].out_q = queue2;
            group3_s1_params[i].stage_name = "Group3 - Stage 1";
            group3_s1_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = group3_s1_params[i].bind_core;
            global_tid++;
            pthread_create(&s1_threads[i], NULL, stage1, &group3_s1_params[i]);
        }
        for (int i = 0; i < GROUP3_STAGE23_THREADS; i++) {
            group3_st23_params[i].index = global_tid;
            group3_st23_params[i].in_q = queue2;
            group3_st23_params[i].out_q = NULL;
            group3_st23_params[i].stage_name = "Group3 - Merged Stage2+3";
            group3_st23_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = group3_st23_params[i].bind_core;
            global_tid++;
            pthread_create(&st23_threads[i], NULL, stage2_and_stage3, &group3_st23_params[i]);
        }
        int t = 0;
        while (t < NUM_TASKS) {
            pthread_mutex_lock(&queue_mutex[queue1->index]);
            int free_slots = queue1->size - queue1->count;
            pthread_mutex_unlock(&queue_mutex[queue1->index]);
            if (free_slots > 0) {
                int batch_size = (free_slots < (NUM_TASKS - t)) ? free_slots : (NUM_TASKS - t);
                for (int j = 0; j < batch_size; j++, t++) {
                    write_queue(queue1, t);
                }
            } else {
                sched_yield();
            }
        }
        for (int j = 0; j < GROUP3_STAGE1_THREADS; j++) {
            write_queue(queue1, TERMINATION_TASK);
        }
        for (int j = 0; j < GROUP3_STAGE1_THREADS; j++) {
            pthread_join(s1_threads[j], NULL);
        }
        for (int j = 0; j < GROUP3_STAGE23_THREADS; j++) {
            write_queue(queue2, TERMINATION_TASK);
        }
        for (int j = 0; j < GROUP3_STAGE23_THREADS; j++) {
            pthread_join(st23_threads[j], NULL);
        }
        for (int i = 0; i < 2; i++) {
            pthread_mutex_destroy(&queue_mutex[i]);
        }
        free_queue(queue1);
        free_queue(queue2);
        
        printf("\n=== Debugging Summary ===\n");
        printf("Group: 3\n");
        printf("Total threads: %d\n", global_tid);
        printf("Stage 1 threads: %d\n", GROUP3_STAGE1_THREADS);
        printf("Merged Stage2+3 threads: %d\n", GROUP3_STAGE23_THREADS);
        printf("Queue 1 Size: %d\n", queue1_size);
        printf("Queue 2 Size: %d\n", queue2_size);
    }
    else if (pipeline_group == GROUP_4) {
        printf("Running pipeline group: 4 (Merged All-Stages)\n");

        queue_t *queue1 = init_queue(queue1_size, 0);
        pthread_mutex_init(&queue_mutex[0], NULL);
        pthread_t merged_threads[GROUP4_THREADS];
        thread_param_t group4_params[GROUP4_THREADS];

        for (int i = 0; i < GROUP4_THREADS; i++) {
            group4_params[i].index = global_tid;
            group4_params[i].in_q = queue1;
            group4_params[i].out_q = NULL;
            group4_params[i].stage_name = "Group4 - Merged All-Stages";
            group4_params[i].bind_core = (global_tid < 8) ? global_tid : global_tid % 8;
            global_cpu_mapping[global_tid] = group4_params[i].bind_core;
            global_tid++;
            pthread_create(&merged_threads[i], NULL, merged_all_stages, &group4_params[i]);
        }
        int t = 0;
        while (t < NUM_TASKS) {
            pthread_mutex_lock(&queue_mutex[queue1->index]);
            int free_slots = queue1->size - queue1->count;
            pthread_mutex_unlock(&queue_mutex[queue1->index]);
            if (free_slots > 0) {
                int batch_size = (free_slots < (NUM_TASKS - t)) ? free_slots : (NUM_TASKS - t);
                for (int j = 0; j < batch_size; j++, t++) {
                    write_queue(queue1, t);
                }
            } else {
                sched_yield();
            }
        }
        for (int j = 0; j < GROUP4_THREADS; j++) {
            write_queue(queue1, TERMINATION_TASK);
        }
        for (int j = 0; j < GROUP4_THREADS; j++) {
            pthread_join(merged_threads[j], NULL);
        }
        pthread_mutex_destroy(&queue_mutex[0]);
        free_queue(queue1);
        
        printf("\n=== Debugging Summary ===\n");
        printf("Group: 4\n");
        printf("Total threads: %d\n", global_tid);
        printf("Merged All-Stages threads: %d\n", GROUP4_THREADS);
        printf("Queue 1 Size: %d\n", queue1_size);
    }
    else {
        fprintf(stderr, "Invalid pipeline group specified.\n");
        exit(EXIT_FAILURE);
    }
    
    printf("CPU Mapping (Thread -> Core):\n");
    for (int i = 0; i < global_tid; i++) {
        printf("  Thread %d -> Core %d\n", i, global_cpu_mapping[i]);
    }
    printf("==========================\n\n");
    
    return 0;
}
