#!/bin/bash
mkdir -p output
# Set the desired array size (you can change this value)
ARRAY_SIZE=10  # For example, set it to 10
QUEUE_SIZE=10


######################## 1 threads #######################
#### group4

for run1 in {1..5}; do
    OUTPUT_FILE1="output/1th_g4_1_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/1th_g4_1 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE1"
sleep 2
done

######################## 2 threads #######################
#### group2

for run1 in {1..5}; do
    OUTPUT_FILE2="output/2th_g2_11_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/2th_g2_11 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE2"
sleep 2
done

#### group3
for run1 in {1..5}; do
    OUTPUT_FILE3="output/2th_g3_11_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/2th_g3_11 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE3"
sleep 2
done

#### group4

for run1 in {1..5}; do
    OUTPUT_FILE4="output/2th_g4_2_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/2th_g4_2 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE4"
sleep 2
done


######################## 3 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE5="output/3th_g1_111_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g1_111 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE5"
sleep 2
done

#### group2


for run1 in {1..5}; do
    OUTPUT_FILE6="output/3th_g2_12_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g2_12 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE6"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE7="output/3th_g2_21_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g2_21 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE7"
sleep 2
done


#### group3

for run1 in {1..5}; do
    OUTPUT_FILE119="output/3th_g3_12_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g3_12 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE119"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE8="output/3th_g3_21_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g3_12 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE8"
sleep 2
done


#### group4

for run1 in {1..5}; do
    OUTPUT_FILE9="output/3th_g4_3_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/3th_g4_3 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE9"
sleep 2
done




######################## 4 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE10="output/4th_g1_112_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g1_112 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE10"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE11="output/4th_g1_121_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g1_121 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE11"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE12="output/4th_g1_211_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g1_211 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE12"
sleep 2
done




#### group2


for run1 in {1..5}; do
    OUTPUT_FILE13="output/4th_g2_13_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g2_13 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE13"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE14="output/4th_g2_22_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g2_22 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE14"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE15="output/4th_g2_31_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g2_31 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE15"
sleep 2
done



#### group3

for run1 in {1..5}; do
    OUTPUT_FILE16="output/4th_g3_13_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g3_13 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE16"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE17="output/4th_g3_22_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g3_22 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE17"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE18="output/4th_g3_31_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g3_31 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE18"
sleep 2
done


#### group4

for run1 in {1..5}; do
    OUTPUT_FILE19="output/4th_g4_4_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/4th_g4_4 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE19"
sleep 2
done



######################## 5 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE20="output/5th_g1_113_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_113 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE20"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE21="output/5th_g1_122_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_122 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE21"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE22="output/5th_g1_131_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_131 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE22"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE23="output/5th_g1_212_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_212 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE23"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE24="output/5th_g1_221_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_221 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE24"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE25="output/5th_g1_311_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g1_311 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE25"
sleep 2
done






#### group2

for run1 in {1..5}; do
    OUTPUT_FILE26="output/5th_g2_14_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g2_14 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE26"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE27="output/5th_g2_23_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g2_23 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE27"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE28="output/5th_g2_32_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g2_32 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE28"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE29="output/5th_g2_41_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g2_41 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE29"
sleep 2
done



#### group3
for run1 in {1..5}; do
    OUTPUT_FILE30="output/5th_g3_14_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g3_14 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE30"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE31="output/5th_g3_23_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g3_23 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE31"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE32="output/5th_g3_32_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g3_32 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE32"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE33="output/5th_g3_41_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g3_41 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE33"
sleep 2
done


#### group4
for run1 in {1..5}; do
    OUTPUT_FILE120="output/5th_g4_5_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/5th_g4_5 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE120"
sleep 2
done


######################## 6 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE34="output/6th_g1_114_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_114 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE34"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE35="output/6th_g1_123_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_123 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE35"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE36="output/6th_g1_132_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_132 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE36"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE37="output/6th_g1_141_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_141 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE37"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE38="output/6th_g1_213_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_213 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE38"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE39="output/6th_g1_222_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_222 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE39"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE40="output/6th_g1_231_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_231 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE40"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE41="output/6th_g1_312_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_312 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE41"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE42="output/6th_g1_321_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_321 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE42"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE43="output/6th_g1_411_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g1_411 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE43"
sleep 2
done




#### group2

for run1 in {1..5}; do
    OUTPUT_FILE44="output/6th_g2_15_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g2_15 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE44"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE45="output/6th_g2_24_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g2_24 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE45"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE46="output/6th_g2_33_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g2_33 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE46"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE47="output/6th_g2_42_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g2_42 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE47"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE48="output/6th_g2_51_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g2_51 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE48"
sleep 2
done



#### group3
for run1 in {1..5}; do
    OUTPUT_FILE49="output/6th_g3_15_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g3_15 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE49"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE50="output/6th_g3_24_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g3_24 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE50"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE51="output/6th_g3_33_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g3_33 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE51"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE52="output/6th_g3_42_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g3_42 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE52"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE53="output/6th_g3_51_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g3_51 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE53"
sleep 2
done



#### group4

for run1 in {1..5}; do
    OUTPUT_FILE54="output/6th_g4_6_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/6th_g4_6 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE54"
sleep 2
done




######################## 7 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE55="output/7th_g1_115_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_115 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE55"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE56="output/7th_g1_124_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_124 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE56"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE57="output/7th_g1_133_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_133 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE57"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE58="output/7th_g1_142_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_142 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE58"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE59="output/7th_g1_151_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_151 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE59"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE60="output/7th_g1_214_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_214 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE60"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE61="output/7th_g1_223_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_223 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE61"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE62="output/7th_g1_232_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_232 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE62"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE63="output/7th_g1_241_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_241 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE63"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE64="output/7th_g1_313_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_313 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE64"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE65="output/7th_g1_322_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_322 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE65"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE66="output/7th_g1_331_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_331 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE66"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE67="output/7th_g1_412_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_412 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE67"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE68="output/7th_g1_421_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_421 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE68"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE69="output/7th_g1_511_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g1_511 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE69"
sleep 2
done



#### group2


for run1 in {1..5}; do
    OUTPUT_FILE70="output/7th_g2_16_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_16 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE70"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE71="output/7th_g2_25_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_25 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE71"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE72="output/7th_g2_34_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_34 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE72"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE73="output/7th_g2_43_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_43 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE73"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE74="output/7th_g2_52_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_52 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE74"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE75="output/7th_g2_61_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g2_61 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE75"
sleep 2
done





#### group3


for run1 in {1..5}; do
    OUTPUT_FILE76="output/7th_g3_16_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_16 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE76"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE77="output/7th_g3_25_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_25 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE77"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE78="output/7th_g3_34_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_34 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE78"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE79="output/7th_g3_43_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_43 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE79"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE80="output/7th_g3_52_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_52 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE80"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE81="output/7th_g3_61_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g3_61 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE81"
sleep 2
done

#### group4

for run1 in {1..5}; do
    OUTPUT_FILE82="output/7th_g4_7_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/7th_g4_7 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE82"
sleep 2
done





######################## 8 threads #######################

#### group1

for run1 in {1..5}; do
    OUTPUT_FILE83="output/8th_g1_116_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_116 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE83"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE84="output/8th_g1_125_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_125 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE84"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE85="output/8th_g1_134_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_134 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE85"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE86="output/8th_g1_143_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_143 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE86"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE87="output/8th_g1_152_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_152 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE87"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE88="output/8th_g1_161_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_161 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE88"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE89="output/8th_g1_215_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_215 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE89"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE90="output/8th_g1_224_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_224 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE90"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE91="output/8th_g1_233_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_233 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE91"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE92="output/8th_g1_242_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_242 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE92"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE93="output/8th_g1_251_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_251 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE93"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE94="output/8th_g1_314_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_314 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE94"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE95="output/8th_g1_323_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_323 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE95"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE96="output/8th_g1_332_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_332 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE96"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE97="output/8th_g1_341_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_341 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE97"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE98="output/8th_g1_413_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_413 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE98"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE99="output/8th_g1_422_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_422 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE99"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE100="output/8th_g1_431_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_431 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE100"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE101="output/8th_g1_512_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_512 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE101"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE102="output/8th_g1_521_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_521 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE102"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE103="output/8th_g1_611_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g1_611 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE103"
sleep 2
done




#### group2

for run1 in {1..5}; do
    OUTPUT_FILE104="output/8th_g2_17_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_17 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE104"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE105="output/8th_g2_26_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_26 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE105"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE106="output/8th_g2_35_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_35 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE106"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE107="output/8th_g2_44_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_44 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE107"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE108="output/8th_g2_53_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_53 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE108"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE109="output/8th_g2_62_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_62 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE109"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE110="output/8th_g2_71_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g2_71 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE110"
sleep 2
done



#### group3



for run1 in {1..5}; do
    OUTPUT_FILE111="output/8th_g3_17_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_17 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE111"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE112="output/8th_g3_26_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_26 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE112"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE113="output/8th_g3_35_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_35 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE113"
sleep 2
done



for run1 in {1..5}; do
    OUTPUT_FILE114="output/8th_g3_44_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_44 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE114"
sleep 2
done


for run1 in {1..5}; do
    OUTPUT_FILE115="output/8th_g3_53_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_53 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE115"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE116="output/8th_g3_62_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_62 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE116"
sleep 2
done

for run1 in {1..5}; do
    OUTPUT_FILE117="output/8th_g3_71_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g3_71 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE117"
sleep 2
done




#### group4


for run1 in {1..5}; do
    OUTPUT_FILE118="output/8th_g4_8_arraysize_${ARRAY_SIZE}_queue_size_${QUEUE_SIZE}_run${run1}.txt"
sudo python3 INA219_energy_freq.py ./options/8th_g4_8 "$ARRAY_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" "$QUEUE_SIZE" >> "$OUTPUT_FILE118"
sleep 2
done

