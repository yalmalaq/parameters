#!/bin/bash
mkdir -p output

ARR_SIZE=10

for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
    sleep 5
done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in {1..1000}; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE2="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE2"
        sleep 5
    done
done
##############################




##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE3="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_100M $ARR_SIZE >> "$OUTPUT_FILE3"
    sleep 5
done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in {1..1000}; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE4="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE1}_run${run2}_100M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE1 $QUEUE_SIZE1 >> "$OUTPUT_FILE4"
        sleep 5
    done
done
##############################


##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE5="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_10M $ARR_SIZE >> "$OUTPUT_FILE5"
    sleep 5
done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE2 in {1..1000}; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE2"
        OUTPUT_FILE6="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE2}_run${run2}_10M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE2 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE6"
        sleep 5
    done
done
##############################



##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE7="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1M $ARR_SIZE >> "$OUTPUT_FILE7"
    sleep 5
done

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE3 in {1..1000}; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE3"
        OUTPUT_FILE8="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE3}_run${run2}_1M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1M $ARR_SIZE $QUEUE_SIZE3 $QUEUE_SIZE3 $QUEUE_SIZE3 >> "$OUTPUT_FILE8"
        sleep 5
    done
done
##############################
