# Quality control
Tested on the shallow sequencing data. Potentially applied for both hg19/hg38 but only hg19 sizes file provided. 

## Pre-requirement
Make sure conda/miniconda is installed in the linux system.  
The instruction of installing miniconda can be found in https://conda.io/projects/conda/en/latest/user-guide/install/index.html#regular-installation
In the server, run the following command
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --no-check-certificate
bash Miniconda3-latest-Linux-x86_64.sh
```

## Quick start
1. Download respiratory
```
git clone https://github.com/KunFang93/micro-c.git
```
2. Create and activate a conda environment: dt-microc with __dt_microc.yml__ file 
```
conda create -n dt-microc python=3.7
conda activate dt-microc
conda install bwa deeptools samtools pairtools preseq pandas tabulate
```
3. run dt_microc_align_v3.sh file on the sample data
```
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/analysisSet/hg19.p13.plusMT.no_alt_analysis_set.fa.gz --no-check-certificate
bwa index hg19.p13.plusMT.no_alt_analysis_set.fa.gz
wget https://s3.amazonaws.com/dovetail.pub/HiC/fastqs/MicroC_2M_R1.fastq --no-check-certificate
wget https://s3.amazonaws.com/dovetail.pub/HiC/fastqs/MicroC_2M_R2.fastq --no-check-certificate
sh dt_microc_align_v3.sh MicroC_2M_R1.fastq MicroC_2M_R2.fastq MicroC-test hg19.p13.plusMT.no_alt_analysis_set.fa.gz micro-c/QC/hg19.chrom.sizes.txt
```

FYI the reason for choosing this version of fasta file could be found in https://lh3.github.io/2017/11/13/which-human-reference-genome-to-use  

4. run get_qc.py file in the Micro-C folder to get the summarized QC results
```
python micro-c/QC/get_qc.py -p MicroC-test.txt > MicroC-test.stats.txt
```
5. Visualize the summarized results in MicroC-test.stats.txt
