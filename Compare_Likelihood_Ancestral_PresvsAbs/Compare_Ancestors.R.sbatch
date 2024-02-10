#!/bin/bash
#SBATCH --job-name=CompareAncestor
#SBATCH --nodes=1
#SBATCH --ntasks=1   
#SBATCH --cpus-per-task=1
#SBATCH --mem=3gb
#SBATCH --qos=soltis
#SBATCH --account=soltis
#SBATCH -t 16:00:00
#SBATCH --output=CompareAncestors.out
#SBATCH --error=CompareAncestors.err

module load R
Rscript Compare_Ancestors.R  
