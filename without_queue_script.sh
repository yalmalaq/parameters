#!/bin/bash
mkdir -p without_queue_size

ARR_SIZE=10

for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE1="without_queue_size/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B $ARR_SIZE >> "$OUTPUT_FILE1"
    sleep 5
done


##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE2="without_queue_size/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M $ARR_SIZE >> "$OUTPUT_FILE2"
    sleep 5
done




##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE3="without_queue_size/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_100M $ARR_SIZE >> "$OUTPUT_FILE3"
    sleep 5
done



##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE4="without_queue_size/output_BALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_10M $ARR_SIZE >> "$OUTPUT_FILE4"
    sleep 5
done

##############################


############### g2 balananced ###############
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE5="without_queue_size/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_g2 $ARR_SIZE >> "$OUTPUT_FILE5"
    sleep 5
done


##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE6="without_queue_size/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_g2 $ARR_SIZE >> "$OUTPUT_FILE6"
    sleep 5
done



##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE7="without_queue_size/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_100M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_100M_g2 $ARR_SIZE >> "$OUTPUT_FILE7"
    sleep 5
done



##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE8="without_queue_size/output_BALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_10M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_10M_g2 $ARR_SIZE >> "$OUTPUT_FILE8"
    sleep 5
done

##############################


############# unbalanced g1 #############

for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE9="without_queue_size/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_1B_500M_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_500M $ARR_SIZE >> "$OUTPUT_FILE9"
    sleep 5
done
    echo " without_queue_size_1B_500M_500M 5 runs finished"
##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE10="without_queue_size/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_500M_1B_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_500M $ARR_SIZE >> "$OUTPUT_FILE10"
    sleep 5
done
    echo " without_queue_size_500M_1B_500M 5 runs finished"
    
##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE11="without_queue_size/output_UNBALANCED_3th_g1_111_arraysize${ARR_SIZE}_only_run${run1}_500M_500M_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_500M_1B $ARR_SIZE >> "$OUTPUT_FILE11"
    sleep 5
done
    echo " without_queue_size_500M_500M_1B 5 runs finished"
##############################

############# unbalanced g2 #############
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE12="without_queue_size/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_500M_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_g2 $ARR_SIZE >> "$OUTPUT_FILE12"
    sleep 5
done
    echo " without_queue_size_500M_1B_g2 5 runs finished"
##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE13="without_queue_size/output_UNBALANCED_3th_g2_21_arraysize${ARR_SIZE}_only_run${run1}_1B_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_g2 $ARR_SIZE >> "$OUTPUT_FILE13"
    sleep 5
done
    echo " without_queue_size_1B_500M_g2 5 runs finished"
##############################

############# unbalanced g3 #############
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE14="without_queue_size/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_only_run${run1}_500M_1B.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_500M_1B_g3 $ARR_SIZE >> "$OUTPUT_FILE14"
    sleep 5
done
    echo " without_queue_size_500M_1B_g3 5 runs finished"
##############################
for run1 in {1..5}; do
    echo "Run1 #$run1"
    OUTPUT_FILE15="without_queue_size/output_UNBALANCED_3th_g3_12_arraysize${ARR_SIZE}_only_run${run1}_1B_500M.txt"
    sudo python3 INA219_energy_freq.py ./without_queue_size_1B_500M_g3 $ARR_SIZE >> "$OUTPUT_FILE15"
    sleep 5
done
    echo " without_queue_size_1B_500M_g3 5 runs finished"
