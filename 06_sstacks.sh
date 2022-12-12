#!/bin/bash
#SBATCH --time=80:00:00
#SBATCH --account=def-kmj477
#SBATCH --mem=24000M
#SBATCH --mail-user=vandervc@myumanitoba.ca
#SBATCH --mail-type=ALL

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --propagate=STACK

#load stacks modual and its dependancies
module load StdEnv/2020 stacks/2.60

src=/scratch/carolynv

sstacks -P $src/stacks/ -M $src/info/pop_map.txt -p 48