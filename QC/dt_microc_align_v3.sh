# $1 is micor-c sample_R1.fastq.gz, $2 is micro-c sample_R2.fastq.gz, $3 the prefix of all output files,
# $4 is the reference.fasta file and $5 is the chromosome size file 
bwa mem -5SP -T0 -t 40 $4 $1 $2| \
pairtools parse --min-mapq 40 --walks-policy 5unique \
--max-inter-align-gap 30 --nproc-in 16 --nproc-out 16 --chroms-path $5 | \
pairtools sort --tmpdir=/data/kun/3_LC/micro-C/dt_QC/tmp --nproc 30|pairtools dedup --nproc-in 16 \
--nproc-out 16 --mark-dups --output-stats "$3".txt |pairtools split --nproc-in 16 \
--nproc-out 16 --output-pairs "$3"_mapped.pairs --output-sam -|samtools view -bS -@40 | \
samtools sort -@40 -o "$3"_mapped.PT.bam;samtools index "$3"_mapped.PT.bam
