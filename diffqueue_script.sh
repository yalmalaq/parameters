#!/bin/bash
mkdir -p output

ARR_SIZE=10

## Run1 loop
##for run1 in {1..5}; do
##    echo "Run1 #$run1"
##    OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
##    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
##    sleep 5
##done
#
## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE2="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE2"
#                sleep 5
#            done
#        done
#    done
#done
#
#
################# 100M Group1 ######
#
##for run1 in {1..5}; do
##    echo "Run1 #$run1"
##    OUTPUT_FILE3="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
##    sudo python3 INA219_energy_freq.py ./without_queue_size_100M $ARR_SIZE >> "$OUTPUT_FILE3"
##    sleep 5
##done
#
## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE1"
#                sleep 5
#            done
#        done
#    done
#done

#################
################# 10M Group1 ######
#
##for run1 in {1..5}; do
##    echo "Run1 #$run1"
##    OUTPUT_FILE5="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
##    sudo python3 INA219_energy_freq.py ./without_queue_size_10M $ARR_SIZE >> "$OUTPUT_FILE5"
##    sleep 5
##done
#
## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE6="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE6"
#                sleep 5
#            done
#        done
#    done
#done
#
#################
#
#
#
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
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            #for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE8="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE8"
                sleep 5
            done
        done
    done
done
#
#
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
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE10="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE10"
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
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE12="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE12"
                sleep 5
            done
        done
    done
done

################
#
#
#



# Run1 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
#    sleep 5
#done

################# 1B
# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
                # Skip combinations that have already been tested
                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
                    continue
                fi

                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE1="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE1"
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
# Compact testing loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
                # Skip combinations that have already been tested
                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
                    continue
                fi

                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE2="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE2"
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
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
                # Skip combinations that have already been tested
                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
                    continue
                fi

                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE3="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_10M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE3"
                sleep 5
            done
        done
    done
don

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
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000; do
#                # Skip combinations that have already been tested
#                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
#                    continue
#                fi
#
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE4="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_1B.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE4"
#                sleep 5
#            done
#        done
#    done
#done



################ 100M Group2 ######

#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE9="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M_g2 $ARR_SIZE >> "$OUTPUT_FILE9"
#    sleep 5
#done

## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000; do
#                # Skip combinations that have already been tested
#                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
#                    continue
#                fi
#
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE5="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_100M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE5"
#                sleep 5
#            done
#        done
#    done
#done


################
################# 10M Group2 ######
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE11="output/output_BALANCED_3th_g1_12_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M_g2 $ARR_SIZE >> "$OUTPUT_FILE11"
#    sleep 5
#done

## Run2 loop
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000; do
#        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000; do
#                # Skip combinations that have already been tested
#                if [[ $QUEUE_SIZE1 -lt 10000 && $QUEUE_SIZE2 -lt 10000 && $QUEUE_SIZE3 -lt 10000 ]]; then
#                    continue
#                fi
#
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE6="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_10M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE6"
#                sleep 5
#            done
#        done
#    done
#done

################






################# 500M Group1 ######
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
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE7="output/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE7"
                sleep 5
            done
        done
    done
done

#################
#

################## 500M Group2 ######
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE11="output/output_BALANCED_3th_g1_12_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_g2 $ARR_SIZE >> "$OUTPUT_FILE11"
#    sleep 5
#done

# Run2 loop
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 10 50 100 300 500 800 900 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000 10000 100000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE8="output/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE8"
                sleep 5
            done
        done
    done
done

################

#re doing same queue size of 10000 100000



################ 1 B ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE9="balanced_output_samesize/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE9"
        sleep 5
    done
done

################ 500 =M ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE10="balanced_output_samesize/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE10"
        sleep 5
    done
done

################ 100M ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE11="balanced_output_samesize/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_100M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_100M $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE11"
        sleep 5
    done
done


################ 1 B g2 ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE12="balanced_output_samesize/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_1B_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE12"
        sleep 5
    done
done

################ 500M g2 ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE13="balanced_output_samesize/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_500M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_500M_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE13"
        sleep 5
    done
done

################ 100M g2 ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE14="balanced_output_samesize/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_100M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_100M_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE14"
        sleep 5
    done
done

################ 10M g2 ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in 10000 100000 1000000; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE15="balanced_output_samesize/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_10M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE15"
        sleep 5
    done
done

################ 10M g2 ################
for run2 in {1..5}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE in {1..1000}; do
        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
        OUTPUT_FILE16="balanced_output_samesize/output_BALANCED_3th_g2_12_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_10M.txt"
        sudo python3 INA219_energy_freq.py ./with_queue_size_10M_g2 $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE16"
        sleep 5
    done
done
