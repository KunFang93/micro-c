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
3. run dt_microc_align_v3.sh file
```
sh dt_microc_align_v3.sh Sample_R1.fastq.gz Sample_R2.fastq.gz Sample_name reference.fa micro-c/QC/hg19.chrom.sizes.txt
```

__reference.fa__ could be downloaded from https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/analysisSet/ with following command

```
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/analysisSet/hg19.p13.plusMT.no_alt_analysis_set.fa.gz
bwa index hg19.p13.plusMT.no_alt_analysis_set.fa.gz
```

FYI the reason for choosing this version of fasta file could be found in https://lh3.github.io/2017/11/13/which-human-reference-genome-to-use
and __hg19.chrom.sizes.txt__ should be found in the folder.  

For practice purpose, the __Sample_R1.fastq.gz__ and __Sample_R2.fastq.gz__ can be found in https://micro-c.readthedocs.io/en/latest/data_sets.html  

4. run get_qc.py file in the Micro-C folder to get the summarized QC results
```
python Path to micro-c/QC/get_qc.py Sample.txt > Sample.stats.txt
```
5. Visualize the summarized results in Sample.stats.txt
