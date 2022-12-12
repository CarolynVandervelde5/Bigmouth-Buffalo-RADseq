#!/bin/bash
#SBATCH --time=20:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=24000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --propagate=STACK

#load stacks modual and its dependancies
module load StdEnv/2020
module load nixpkgs/16.09
module load intel/2018.3
module load vcftools/0.1.16

src=/scratch/carolynv/r75pop_R60pop_p5pop


vcftools --vcf $src/populations_snps.vcf --snps $src/singletons_allpopulations.txt --recode --recode-INFO-all --out singletons_r75R60p5_allpopulations
