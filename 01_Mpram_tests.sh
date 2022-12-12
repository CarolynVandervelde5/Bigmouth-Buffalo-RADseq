#!/bin/bash
#SBATCH --time=20:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=24000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#load stacks modual and its dependancies
module load StdEnv/2020 stacks/2.60

# Pick 18 representative samples.

top=$(readlink -f $(dirname $0)/..)
cd $top

if [[ "$N_CPU" ]] ;then
	# Environment variable N_CPU is defined
 	ncpu=$N_CPU
else
	ncpu=1
fi

cd /scratch/carolynv/
for M in 1 2 3 4 5 6 7 8 9 ;do
	echo "Running Stacks for M=$M..."

	out_dir=stacks.M$M
	log_file=$out_dir/denovo_map.oe
	denovo_map.pl --samples /scratch/carolynv/cleaned --popmap /scratch/carolynv/info/testers_pop.txt -o $out_dir -M $M -n $M -m 3 -T $ncpu &> $log_file
done

# Examine the results


