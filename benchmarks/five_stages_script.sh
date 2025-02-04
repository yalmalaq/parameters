#!/bin/bash
mkdir -p with_queue_size
mkdir -p without_queue_size

ARR_SIZE=10


###### five stages Unbalanced CPU- Memory- intensive ######

############ c_c_m_m_m 5 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE1="with_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_c_c_m_m_m.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_c_c_m_m_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE1"
        sleep 5
    done
    echo " with_queue_size_c_c_m_m_m 5 runs finished"
done



############_m_m_c_c_c ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE2="with_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_m_c_c_c.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_m_m_c_c_c $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE2"
        sleep 5
    done
    echo " with_queue_size_m_m_c_c_c 5 runs finished"
done


############ _m_c_m_c_m##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE3="with_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_c_m_c_m.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_m_c_m_c_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE3"
        sleep 5
    done
    echo " with_queue_size_m_c_m_c_m 5 runs finished"
done

############ _m_m_c_m_m ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE4="with_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_m_c_m_m.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_m_m_c_m_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE4"
        sleep 5
    done
    echo " with_queue_size_m_m_c_m_m 5 runs finished"
done



############ _c_c_m_c_c ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE5="with_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_c_c_m_c_c.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_c_c_m_c_c $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE5"
        sleep 5
    done
    echo " with_queue_size_c_c_m_c_c 5 runs finished"
done





############## wihtout queue size ########

############ c_c_m_m_m ##########


for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE6="without_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_only_run${run1}_c_c_m_m_m.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_c_c_m_m_m $ARR_SIZE >> "$OUTPUT_FILE6"
    sleep 5
done
    echo " without_queue_size_c_c_m_m_m 5 runs finished"


############ _m_m_c_c_c ##########


for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE7="without_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_only_run${run1}_m_m_c_c_c.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_m_m_c_c_c $ARR_SIZE >> "$OUTPUT_FILE7"
    sleep 5
done
    echo " without_queue_size_m_m_c_c_c 5 runs finished"


############ without_queue_size_m_c_m_c_m ##########


for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE8="without_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_only_run${run1}_m_c_m_c_m.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_m_c_m_c_m $ARR_SIZE >> "$OUTPUT_FILE8"
    sleep 5
done
    echo " without_queue_size_m_c_m_c_m 5 runs finished"


############ m_m_c_m_m ##########


for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE9="without_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_only_run${run1}_m_m_c_m_m.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_m_m_c_m_m $ARR_SIZE >> "$OUTPUT_FILE9"
    sleep 5
done
    echo " without_queue_size_m_m_c_m_m 5 runs finished"


############ c_c_m_c_c ##########


for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE10="without_queue_size/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_only_run${run1}_c_c_m_c_c.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_c_c_m_c_c $ARR_SIZE >> "$OUTPUT_FILE10"
    sleep 5
done
    echo " without_queue_size_c_c_m_c_c 5 runs finished"





