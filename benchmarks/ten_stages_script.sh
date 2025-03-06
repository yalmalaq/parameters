#!/bin/bash
mkdir -p with_queue_size
mkdir -p without_queue_size

ARR_SIZE=10


###### ten stages balanced Memory-intensive ######

############ small  ##########

# for run2 in {1..5}; do
#     echo "Run2 #$run2"
#     for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#         echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#         OUTPUT_FILE1="with_queue_size/output_BALANCED_10th_g1_1111111111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_small.txt"
#         sudo python3 INA219_energy_freq.py ./with_queue_size_small $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE1"
#         sleep 5
#     done
#     echo " with_queue_size_small 5 runs finished"
# done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE1="with_queue_size/output_BALANCED_10th_g2_211111111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_small.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_small_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE1"
        sleep 5
    done
    echo " with_queue_size_small_g2 5 runs finished"
done


for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE2="with_queue_size/output_BALANCED_10th_g3_111111112_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_small.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_small_g3 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE2"
        sleep 5
    done
    echo " with_queue_size_small_g3 5 runs finished"
done



############ med  ##########

# for run2 in {1..5}; do
#     echo "Run2 #$run2"
#     for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#         echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#         OUTPUT_FILE2="with_queue_size/output_BALANCED_10th_g1_1111111111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_med.txt"
#         sudo python3 INA219_energy_freq.py ./with_queue_size_med $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE2"
#         sleep 5
#     done
#     echo " with_queue_size_med 5 runs finished"
# done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE3="with_queue_size/output_BALANCED_10th_g2_211111111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_med.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_med_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE3"
        sleep 5
    done
    echo " with_queue_size_med_g2 5 runs finished"
done


for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE4="with_queue_size/output_BALANCED_10th_g3_111111112_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_med.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_med_g3 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE4"
        sleep 5
    done
    echo " with_queue_size_med_g3 5 runs finished"
done




# ############## wihtout queue size ########

# ############ small ##########


# for run1 in {1..5}; do
#     echo "Run1 #$run1"
#     OUTPUT_FILE4="without_queue_size/output_BALANCED_10th_g1_1111111111_arraysize${ARR_SIZE}_only_run${run1}_small.txt"
#     sudo python3 INA219_energy_freq.py ./without_queue_size_small $ARR_SIZE >> "$OUTPUT_FILE4"
#     sleep 5
# done
#     echo " without_queue_size_small 5 runs finished"
    
    
# ############ med ##########


# for run1 in {1..5}; do
#     echo "Run1 #$run1"
#     OUTPUT_FILE5="without_queue_size/output_BALANCED_10th_g1_1111111111_arraysize${ARR_SIZE}_only_run${run1}_med.txt"
#     sudo python3 INA219_energy_freq.py ./without_queue_size_med $ARR_SIZE >> "$OUTPUT_FILE5"
#     sleep 5
# done
#     echo " without_queue_size_med 5 runs finished"

# ############ large ##########


# for run1 in {1..5}; do
#     echo "Run1 #$run1"
#     OUTPUT_FILE6="without_queue_size/output_BALANCED_10th_g1_1111111111_arraysize${ARR_SIZE}_only_run${run1}_large.txt"
#     sudo python3 INA219_energy_freq.py ./without_queue_size_large $ARR_SIZE >> "$OUTPUT_FILE6"
#     sleep 5
# done
#     echo " without_queue_size_large 5 runs finished"
