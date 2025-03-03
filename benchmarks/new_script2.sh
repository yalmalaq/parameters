#!/bin/bash
#mkdir -p output_samesize
mkdir -p balanced
mkdir -p unbalanced
mkdir -p default_three
mkdir -p default_three_unbalanced
mkdir -p balanced_1_200

ARR_SIZE=10






############## diff queue size ########

############ 1B g1 ##########

## Run2 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE1="default_three/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
#    sleep 5
#done
#        echo " with_diff_queue_size_1B_ 5 runs finished"
#
############# 500M g1 ##########
#
## Run2 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE2="default_three/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M $ARR_SIZE >> "$OUTPUT_FILE2"
#    sleep 5
#done
#
#echo " with_diff_queue_size_500M 5 runs finished"
#
#
############# 100M g1 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE3="default_three/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M $ARR_SIZE >> "$OUTPUT_FILE3"
#    sleep 5
#done
#
#echo " with_diff_queue_size_100M 5 runs finished"
#
#
############# 10M g1 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE4="default_three/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M $ARR_SIZE >> "$OUTPUT_FILE4"
#    sleep 5
#done
#echo " with_diff_queue_size_10M 5 runs finished"
#
#
############# 1B g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE5="default_three/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_g2 $ARR_SIZE >> "$OUTPUT_FILE5"
#    sleep 5
#done
#echo " with_diff_queue_size_1B_g2 5 runs finished"
#
#
############# 500M g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE6="default_three/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_g2 $ARR_SIZE >> "$OUTPUT_FILE6"
#    sleep 5
#done
#echo " with_diff_queue_size_500_g2 5 runs finished"
#
#
############# 100M g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE7="default_three/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M_g2 $ARR_SIZE >> "$OUTPUT_FILE7"
#    sleep 5
#done
#echo " with_diff_queue_size_100M_g2 5 runs finished"
#
#
############# 10M g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE8="default_three/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M_g2 $ARR_SIZE >> "$OUTPUT_FILE8"
#    sleep 5
#done
#echo " with_diff_queue_size_10M_g2 5 runs finished"
#
#
#
########## g3
#
############# 1B g3 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE9="default_three/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_g3 $ARR_SIZE >> "$OUTPUT_FILE9"
#    sleep 5
#done
#echo " with_diff_queue_size_1b_g3 5 runs finished"
#
#
############# 500M g3 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE10="default_three/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_g3 $ARR_SIZE >> "$OUTPUT_FILE10"
#    sleep 5
#done
#echo " with_diff_queue_size_500M_g3 5 runs finished"
#
#
############# 100M g3 ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE11="default_three/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_100M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_100M_g3 $ARR_SIZE >> "$OUTPUT_FILE11"
#    sleep 5
#done
#echo " with_diff_queue_size_100M_g3 5 runs finished"
#
#
############# 10M g3 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE12="default_three/output_BALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_10M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_10M_g3 $ARR_SIZE >> "$OUTPUT_FILE12"
#    sleep 5
#done
#echo " with_diff_queue_size_10M_g3 5 runs finished"
#
########### unbalaced #######
#


############## diff queue size ########

############# 1B_500M_500M g1 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE13="default_three_unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_1B_500M_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_500M $ARR_SIZE >> "$OUTPUT_FILE13"
#    sleep 5
#done
#    echo " without_queue_size_1B_500M_500M 5 runs finished"
#
############# 500M_1B_500M g1 ##########
#
## Run2 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE14="default_three_unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_500M_1B_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_500M $ARR_SIZE >> "$OUTPUT_FILE14"
#    sleep 5
#done
#    echo " without_queue_size_500M_1B_500M 5 runs finished"
#
#
############# 500M_500M_1B g1 ##########
#
## Run2 loop
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE15="default_three_unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_500M_500M_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_500M_1B $ARR_SIZE >> "$OUTPUT_FILE15"
#    sleep 5
#done
#echo " without_queue_size_500M_500M_1B 5 runs finished"


############# 500M_1B g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE16="default_three_unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_500M_500M_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_g2 $ARR_SIZE >> "$OUTPUT_FILE16"
#    sleep 5
#done
#    echo " without_queue_size_500M_1B_g2 5 runs finished"
#
#
############# 1B_500M g2 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE17="default_three_unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_1B_1B_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_g2 $ARR_SIZE >> "$OUTPUT_FILE17"
#    sleep 5
#done
#    echo " without_queue_size_1B_500M_g2 5 runs finished"
#
############# 500M_1B g3 ##########
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE18="default_three_unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_500M_1B_1B.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_g3 $ARR_SIZE >> "$OUTPUT_FILE18"
#    sleep 5
#done
#    echo " without_queue_size_500M_1B_g3 5 runs finished"
#
#
############# 1B_500M g3 ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE19="default_three_unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_1B_500M_500M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_g3 $ARR_SIZE >> "$OUTPUT_FILE19"
#    sleep 5
#done
#    echo " without_queue_size_1B_500M_g3 5 runs finished"



##################################################
##################################################
#
#
#
#################### Five stage mix workloads + defaults
#
#
#mkdir -p unbalanced_five
#mkdir -p default_five
#
############# c_c_m_m_m 5 ##########
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE20="unbalanced_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_c_c_m_m_m.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_c_c_m_m_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE20"
#        sleep 5
#    done
#    echo " with_queue_size_c_c_m_m_m 5 runs finished"
#done
#
#############_m_m_c_c_c ##########
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE21="unbalanced_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_m_c_c_c.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_m_m_c_c_c $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE21"
#        sleep 5
#    done
#    echo " with_queue_size_m_m_c_c_c 5 runs finished"
#done
#
#
############# _m_c_m_c_m##########
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE22="unbalanced_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_c_m_c_m.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_m_c_m_c_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE22"
#        sleep 5
#    done
#    echo " with_queue_size_m_c_m_c_m 5 runs finished"
#done
#
############# _m_m_c_m_m ##########
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE23="unbalanced_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_m_m_c_m_m.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_m_m_c_m_m $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE>> "$OUTPUT_FILE23"
#        sleep 5
#    done
#    echo " with_queue_size_m_m_c_m_m 5 runs finished"
#done
#
#
#
############# _c_c_m_c_c ##########
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in 1 10 100 1000 10000 100000 1000000; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE24="unbalanced_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_c_c_m_c_c.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_c_c_m_c_c $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE24"
#        sleep 5
#    done
#    echo " with_queue_size_c_c_m_c_c 5 runs finished"
#done
#
#
#
#
#
############### wihtout queue size ########
#
############# c_c_m_m_m ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE25="default_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_default_run${run1}_c_c_m_m_m.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_c_c_m_m_m $ARR_SIZE >> "$OUTPUT_FILE25"
#    sleep 5
#done
#    echo " without_queue_size_c_c_m_m_m 5 runs finished"
#
#
############# _m_m_c_c_c ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE26="default_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_default_run${run1}_m_m_c_c_c.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_m_m_c_c_c $ARR_SIZE >> "$OUTPUT_FILE26"
#    sleep 5
#done
#    echo " without_queue_size_m_m_c_c_c 5 runs finished"
#
#
############# without_queue_size_m_c_m_c_m ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE27="default_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_default_run${run1}_m_c_m_c_m.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_m_c_m_c_m $ARR_SIZE >> "$OUTPUT_FILE27"
#    sleep 5
#done
#    echo " without_queue_size_m_c_m_c_m 5 runs finished"
#
#
############# m_m_c_m_m ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE28="default_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_default_run${run1}_m_m_c_m_m.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_m_m_c_m_m $ARR_SIZE >> "$OUTPUT_FILE28"
#    sleep 5
#done
#    echo " without_queue_size_m_m_c_m_m 5 runs finished"
#
#
############# c_c_m_c_c ##########
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE29="default_five/output_UNBALANCED_5th_g1_11111_arraysize${ARR_SIZE}_default_run${run1}_c_c_m_c_c.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_c_c_m_c_c $ARR_SIZE >> "$OUTPUT_FILE29"
#    sleep 5
#done
#    echo " without_queue_size_c_c_m_c_c 5 runs finished"
#
#
#
#
#
#
#
###################################################
######################## Three balanced 1B 1-200+1-200default #########################
#
#for run2 in {1..5}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE in {1..200}; do
#        echo "Run2 #$run2, Queue Size: $QUEUE_SIZE"
#        OUTPUT_FILE36="balanced_1_200/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuessizes_${QUEUE_SIZE}_run${run2}_1B.txt"
#        sudo python3 INA219_energy_freq.py ./with_queue_size_1B $ARR_SIZE $QUEUE_SIZE $QUEUE_SIZE $QUEUE_SIZE >> "$OUTPUT_FILE36"
#        sleep 5
#    done
#    echo " with_queue_size_1B 1-200 runs finished"
#done
#
#
#
#
###################################################
######################## Three unbalced 200_300_400 #########################
############## unbalanced g1 #############
#
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE30="default_three/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_default_run${run1}_200M_300M_400M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_200M_300M_400M $ARR_SIZE >> "$OUTPUT_FILE30"
#    sleep 5
#done
#    echo " _200M_300M_400M 5 runs finished"
#    
#
#for run2 in {1..3}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
#        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 1 10 100 1000 10000 100000 1000000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE31="unbalanced/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_${QUEUE_SIZE3}_run${run2}_200M_300M_400M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_200M_300M_400M $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE3 >> "$OUTPUT_FILE31"
#                sleep 5
#            done
#        done
#    done
#done
#        echo " with_queue_size_200M_300M_400M 5 runs diff queue size finished"
#####################
#
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE32="default_three_unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_default_run${run1}_200M_300M_400M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_200M_300M_400M_g2 $ARR_SIZE >> "$OUTPUT_FILE32"
#    sleep 5
#done
#    echo " without_queue_size_200M_300M_400M_g2 5 runs finished"
#
#
#for run2 in {1..3}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
#        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
##            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE33="unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_200M_300M_400M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_200M_300M_400M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE33"
#                sleep 5
#            done
#        done
#    done
#            echo " with_queue_size_200M_300M_400M_g2 5 runs finished"
#######
#
#for run1 in {1..5}; do
#    echo "Run1 #$run1"
#    OUTPUT_FILE34="default_three_unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_default_run${run1}_200M_300M_400M.txt"
#    sudo python3 INA219_energy_freq.py ./without_queue_size_200M_300M_400M_g3 $ARR_SIZE >> "$OUTPUT_FILE34"
#    sleep 5
#done
#    echo " without_queue_size_200M_300M_400M_g3 5 runs finished"
#
#
#for run2 in {1..3}; do
#    echo "Run2 #$run2"
#    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
#        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
##            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
#                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
#                OUTPUT_FILE35="unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_200M_300M_400M.txt"
#                sudo python3 INA219_energy_freq.py ./with_queue_size_200M_300M_400M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE35"
#                sleep 5
#            done
#        done
#    done
#            echo " with_queue_size_200M_300M_400M_g3 5 runs finished"
#######
#



for run2 in {1..3}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE33="unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_500M_1B.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_500M_1B_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE33"
                sleep 5
            done
        done
    done
            echo " with_queue_size_500M_500M_1B_g3 5 runs finished"
######


for run2 in {1..3}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE35="unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_1B_500M_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_1B_500M_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE35"
                sleep 5
            done
        done
    done
            echo " with_queue_size_1B_500M_500M_g2 5 runs finished"
######




for run2 in {1..3}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE36="unbalanced/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_500M_g2 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE36"
                sleep 5
            done
        done
    done
            echo " with_queue_size_500M_1B_500M_g2 5 runs finished"
######



for run2 in {1..3}; do
    echo "Run2 #$run2"
    for QUEUE_SIZE1 in 1 10 100 1000 10000 100000 1000000; do
        for QUEUE_SIZE2 in 1 10 100 1000 10000 100000 1000000; do
#            for QUEUE_SIZE3 in 10 50 100 300 500 800 900 1000; do
                echo "Run2 #$run2, Queue Sizes: $QUEUE_SIZE1, $QUEUE_SIZE2, $QUEUE_SIZE3"
                OUTPUT_FILE37="unbalanced/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_queuesizes_${QUEUE_SIZE1}_${QUEUE_SIZE2}_run${run2}_500M_1B_500M.txt"
                sudo python3 INA219_energy_freq.py ./with_queue_size_500M_1B_500M_g3 $ARR_SIZE $QUEUE_SIZE1 $QUEUE_SIZE2 $QUEUE_SIZE2 >> "$OUTPUT_FILE37"
                sleep 5
            done
        done
    done
            echo " with_queue_size_500M_1B_500M_g3 5 runs finished"
######
