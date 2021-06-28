# Quality control
Tested on the shallow sequencing data.

## Pre-requirement
make sure conda/miniconda is installed in the linux system

## Quick start
1. download files in the folder
```
git clone
```
2. create a conda environment: dt-microc with dt_microc.yml file 
```
conda create -n dt-microc -f dt_microc.yml
```
3. activate dt-microc environment
```
conda activate dt-microc
```
4. run dt_microc_align_v2.sh file
```
sh dt_microc_align_v2.sh /data/kun/3_LC/micro-C/raw_data/shallow_seq/JIN_V_06182021/T47D_A3_S14_R1_001.fastq.gz /data/kun/3_LC/micro-C/raw_data/shallow_seq/JIN_V_06182021/T47D_A3_S14_R2_001.fastq.gz T47D_A3_S14
```
5. run get_qc.py file to get the summarized QC results
