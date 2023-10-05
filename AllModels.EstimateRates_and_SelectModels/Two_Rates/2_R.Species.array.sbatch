#!/bin/bash
#SBATCH --job-name=fixnoTwoRates
#SBATCH --nodes=1
#SBATCH --ntasks=1   
#SBATCH --cpus-per-task=1
#SBATCH --mem=3gb
#SBATCH --qos=soltis-b
#SBATCH --account=soltis
#SBATCH -t 16:00:00
#SBATCH --output=logs/Species.corHMM_%A_%a.out
#SBATCH --error=logs/Species.corHMM_%A_%a.err
#SBATCH --array=2-100 #Number of R Scripts

#module load R
#for using cutom p
module load R/4.0 
echo starting_ip $SLURM_ARRAY_TASK_ID
sed "s/NUM/$SLURM_ARRAY_TASK_ID/g" 2_TwoRates.fixednode.R > TwoRates.fixed.node.${SLURM_ARRAY_TASK_ID}.R
ip=$(head -n $SLURM_ARRAY_TASK_ID randomiplist.n100.out.csv|tail -1)
sed -i "s/CUSTOM/$ip/g" TwoRates.fixed.node.${SLURM_ARRAY_TASK_ID}.R 
Rscript TwoRates.fixed.node.${SLURM_ARRAY_TASK_ID}.R --no-save
rm TwoRates.fixed.node.${SLURM_ARRAY_TASK_ID}.R
  
