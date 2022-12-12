#!/bin/bash
#SBATCH --time=30:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=514000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --propagate=STACK


#load stacks modual and its dependancies
module load StdEnv/2020 stacks/2.60

src=/scratch/carolynv

tsv2bam -P $src/stacks/ -M $src/info/pop_map.txt --pe-reads-dir $src/cleaned -t 32