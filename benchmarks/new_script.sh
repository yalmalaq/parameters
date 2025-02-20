#!/bin/bash
#mkdir -p output_samesize
mkdir -p balanced
mkdir -p unbalanced

ARR_SIZE=10







############## diff queue size ########

############ 1B g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE9="balanced/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE9"
                sleep 5
            done
        done
    done
        echo " with_diff_queue_size_1B_ 5 runs finished"
done

############ 500M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE10="balanced/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE10"
                sleep 5
            done
        done
    done
        echo " with_diff_queue_size_500M 5 runs finished"
done


############ 100M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE11="balanced/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE11"
                sleep 5
            done
        done
    done
        echo " with_diff_queue_size_100M 5 runs finished"
done


############ 10M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE12="balanced/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE12"
                sleep 5
            done
        done
    done
        echo " with_diff_queue_size_10M 5 runs finished"
done



############ 1B g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE13="balanced/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE13"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_1B_g2 5 runs finished"


############ 500M g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE14="balanced/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE14"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_500_g2 5 runs finished"


############ 100M g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE15="balanced/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE15"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_100M_g2 5 runs finished"


############ 10M g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE16="balanced/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE16"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_10M_g2 5 runs finished"



######### g3

############ 1B g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE17="balanced/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE17"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_1B_g3 5 runs finished"


############ 500M g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE18="balanced/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE18"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_500_g2 5 runs finished"


############ 100M g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE19="balanced/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE119"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_100M_g3 5 runs finished"


############ 10M g3 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE20="balanced/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE20"
                sleep 5
            done
        done
    done
            echo " with_diff_queue_size_10M_g3 5 runs finished"


########## unbalaced #######



############## diff queue size ########

############ 1B_500M_500M g1 ##########

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE21="unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B_500M_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE21"
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
                OUTPUT_FILE22="unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE22"
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
                OUTPUT_FILE23="unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_500M_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE23"
                sleep 5
            done
        done
    done
done
echo " with_queue_size_500M_500M_1B 5 runs finished"




############ 500M_1B g2 ##########

for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE24="unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE24"
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
                OUTPUT_FILE25="unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE25"
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
                OUTPUT_FILE26="unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_1B_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE26"
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
                OUTPUT_FILE27="unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B_500M_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE27"
                sleep 5
            done
        done
    done
            echo " with_queue_size_1B_500M_g3 5 runs finished"

