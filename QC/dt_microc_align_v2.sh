# $1 R1, $2 R2, $3 out_prefix
bwa mem -5SP -T0 -t 40 /data/kun/Align_Index/bwa_hg19/hg19.p13.plusMT.no_alt_analysis_set/hg19.p13.plusMT.no_alt_analysis_set.fa $1 $2| \
pairtools parse --min-mapq 40 --walks-policy 5unique \
--max-inter-align-gap 30 --nproc-in 16 --nproc-out 16 --chroms-path /data/kun/NucHMM_project/NucHMM_data/annotation/hg19.chrom.sizes.txt | \
pairtools sort --tmpdir=/data/kun/3_LC/micro-C/dt_QC/tmp --nproc 30|pairtools dedup --nproc-in 16 \
--nproc-out 16 --mark-dups --output-stats "$3".txt |pairtools split --nproc-in 16 \
--nproc-out 16 --output-pairs "$3"_mapped.pairs --output-sam -|samtools view -bS -@40 | \
samtools sort -@40 -o "$3"_mapped.PT.bam;samtools index "$3"_mapped.PT.bam
