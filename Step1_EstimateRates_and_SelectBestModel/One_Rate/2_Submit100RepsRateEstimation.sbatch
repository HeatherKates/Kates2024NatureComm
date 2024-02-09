#!/bin/bash
#SBATCH --job-name=OneRates
#SBATCH --nodes=1
#SBATCH --ntasks=1   
#SBATCH --cpus-per-task=1
#SBATCH --mem=3gb
#SBATCH --qos=soltis-b
#SBATCH --account=soltis
#SBATCH -t 16:00:00
#SBATCH --output=logs/Species.corHMM_%A_%a.out
#SBATCH --error=logs/Species.corHMM_%A_%a.err
#SBATCH --array=1-100 #Number of R Scripts

#This SLURM submission script creates and runs 100 replicates of rate estimation for a given model,
#In this case the model with one rate. This is done so that the best fitting rates(s) and its AIC value 
#Can be reported and compared across other models tested. 
#The best model (and its estimated rates for lowest AIC value)is used for ancestral state reconstruction

#module load R
#for using cutom p
module load R/4.0 
echo starting_ip $SLURM_ARRAY_TASK_ID

#Create a temporary R script from the template
sed "s/NUM/$SLURM_ARRAY_TASK_ID/g" 2_OneRate.R > 2_OneRate.${SLURM_ARRAY_TASK_ID}.R

#Get a set of ip values from the list of 100 random ips
ip=$(head -n $SLURM_ARRAY_TASK_ID randomiplist.n100.out.csv|tail -1)

#Edit the temporary R script with the custom starting ip values
sed -i "s/CUSTOM/$ip/g" 2_OneRate.${SLURM_ARRAY_TASK_ID}.R 

#Submit the custom R script
Rscript 2_OneRate.${SLURM_ARRAY_TASK_ID}.R --no-save

#Remove the custom R script after it's run
rm 2_OneRate.${SLURM_ARRAY_TASK_ID}.R
  
