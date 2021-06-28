# Quality control
Tested on the shallow sequencing data.

## Pre-requirement
Make sure conda/miniconda is installed in the linux system

## Quick start
1. Download respiratory
```
git clone https://github.com/KunFang93/micro-c.git
```
2. Create a conda environment: dt-microc with dt_microc.yml file 
```
conda create -n dt-microc -f dt_microc.yml
```
3. activate dt-microc environment
```
conda activate dt-microc
```
4. run dt_microc_align_v2.sh file
```
sh dt_microc_align_v2.sh Sample_R1.fastq.gz Sample_R2.fastq.gz Sample_name
```
5. run get_qc.py file in the Micro-C folder to get the summarized QC results
```
python Path to Micro-C/get_qc.py Sample.txt
```
