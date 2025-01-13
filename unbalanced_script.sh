#!/bin/bash
mkdir -p output_samesize
mkdir -p output_diffsize

ARR_SIZE=10


###### same queue size ######

############ 1B_500M_500M g1 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE1="output_samesize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B_500M_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_500M $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE1"
        sleep 5
    done
done
    echo " with_queue_size_1B_500M_500M 5 runs finished"


############ 500M_1B_500M g1 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE2="output_samesize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M_1B_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_500M $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE2"
        sleep 5
    done
done
    echo " with_queue_size_500M_1B_500M 5 runs finished"



############ 500M_500M_1B g1 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE3="output_samesize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M_500M_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M_500M_1B $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE3"
        sleep 5
    done
done
    echo " with_queue_size_500M_500M_1B 5 runs finished"


############ 500M_1B g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE4="output_samesize/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE4"
        sleep 5
    done
done
    echo " with_queue_size_500M_1B_g2 5 runs finished"


############ 1B_500M g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE5="output_samesize/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE5"
        sleep 5
    done
done
    echo " with_queue_size_1B_500M_g2 5 runs finished"




############ 500M_1B g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE6="output_samesize/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g3 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE6"
        sleep 5
    done
done
    echo " with_queue_size_500M_1B_g3 5 runs finished"


############ 1B_500M g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE7="output_samesize/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g3 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE7"
        sleep 5
    done
done
    echo " with_queue_size_100M_g2 5 runs finished"




############## diff queue size ########

############ 1B_500M_500M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE9="output_diffsize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B_500M_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE9"
                sleep 5
            done
        done
    done
done
        echo " with_queue_size_1B_500M_500M 5 runs diff queue size finished"

############ 500M_1B_500M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE10="output_diffsize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE10"
                sleep 5
            done
        done
    done
        echo " with_queue_size_500M_1B_500M 5 runs finished"
done


############ 500M_500M_1B g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE11="output_diffsize/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_500M_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE11"
                sleep 5
            done
        done
    done
done
echo " with_queue_size_500M_500M_1B 5 runs finished"


############# 10M g1 ##########
#
## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
#        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE12="output_diffsize/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE12"
#                sleep 5
#            done
#        done
#    done
#        echo " with_diff_queue_size_10M 5 runs finished"
#done



############ 500M_1B g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE13="output_diffsize/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE13"
                sleep 5
            done
        done
    done
            echo " with_queue_size_500M_1B_g2 5 runs finished"
            

############ 1B_500M g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE14="output_diffsize/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE14"
                sleep 5
            done
        done
    done
            echo " with_queue_size_1B_500M_g2 5 runs finished"



############ 500M_1B g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE15="output_diffsize/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE15"
                sleep 5
            done
        done
    done
            echo " with_queue_size_500M_1B_g3 5 runs finished"


############ 1B_500M g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE16="output_diffsize/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE16"
                sleep 5
            done
        done
    done
            echo " with_queue_size_1B_500M_g3 5 runs finished"

