#!/bin/bash
#SBATCH --time=20:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=24000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#for the output file
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)

#my working directory
cd /scratch/carolynv

#load stacks modual and its dependancies
module load StdEnv/2020 stacks/2.60


process_radtags -i gzfastq -P -1 /scratch/carolynv/raw/NS.1834.004.D710---B501.Vander_4_R1.fastq.gz -2 /scratch/carolynv/raw/NS.1834.004.D710---B501.Vander_4_R2.fastq.gz -b /scratch/carolynv/info/Vander_4_Barcode.txt -o /scratch/carolynv/cleaned/ -c -q -r --inline_null --renz_1 pstI --renz_2 mspI
