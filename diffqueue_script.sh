#!/bin/bash
mkdir -p output

ARR_SIZE=10

# Run1 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE2="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE2"
                sleep 5
            done
        done
    done
done


################ 100M Group1 ######

#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE3="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M $ARR_SIZE >> "$OUTPUT_FILE3"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE4="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE4"
                sleep 5
            done
        done
    done
done

################
################ 10M Group1 ######

#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE5="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M $ARR_SIZE >> "$OUTPUT_FILE5"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE6="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE6"
                sleep 5
            done
        done
    done
done

################



################ 1B Group2 ######
# Run1 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE7="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_g2 $ARR_SIZE >> "$OUTPUT_FILE7"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE8="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE8"
                sleep 5
            done
        done
    done
done


################ 100M Group2 ######

#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE9="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M_g2 $ARR_SIZE >> "$OUTPUT_FILE9"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE10="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE10"
                sleep 5
            done
        done
    done
done

################
################# 10M Group2 ######
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE11="output/output_BALANCED_3th_g1_12_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M_g2 $ARR_SIZE >> "$OUTPUT_FILE11"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE12="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE12"
                sleep 5
            done
        done
    done
done

################



