#!/bin/bash
#SBATCH --time=05:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=24000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#load stacks modual and its dependancies
module load StdEnv/2020 stacks/2.60

# Extract the SNPs-per-locus distributions (they are reported in the log of populations).
# ----------
echo "Tallying the numbers..."
full_table=n_snps_per_locus.tsv
header='#par_set\tM\tn\tm\tn_snps\tn_loci'
for M in 1 2 3 4 5 6 7 8 9 ;do
	n=$M
	m=3

	# Extract the numbers for this parameter combination.
	log_file=/scratch/carolynv/test.denovo/results/M${M}/populations.log
	sed -n '/^#n_snps\tn_loci/,/^[^0-9]/ p' $log_file | grep -E '^[0-9]' > $log_file.snps_per_loc

	# Cat the content of this file, prefixing each line with information on this
	# parameter combination.
	line_prefix="M$M-n$n-m$m\t$M\t$n\t$m\t"
	cat $log_file.snps_per_loc | sed -r "s/^/$line_prefix/"

done | sed "1i $header" > $full_table
