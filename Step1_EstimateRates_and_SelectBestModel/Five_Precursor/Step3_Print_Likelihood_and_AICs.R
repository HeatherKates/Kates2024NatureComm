library(dplyr)
#This script is run from within the model's directory
#setwd("./Github/EstimateRates_and_SelectBestModel/Model")
#Set the model being tested
Model = "Three_Precursor"
#Load .RData files that each include a corhmm object for a random restart
files=list.files(path="RData_100_Reps/")
for (i in 1:length(files)){load(paste("RData_100_Reps",files[i],sep="/"))}
# Get names of all objects of class "corhmm"
corhmm_names <- ls()[sapply(ls(), function(x) inherits(get(x), "corhmm"))]
# Use mget to retrieve all these objects into a list
corhmm_list <- mget(corhmm_names)

#loop over the corhmm objects to get likelihoods for each of 100 random restarts
Likelihoods=as.data.frame(lapply(corhmm_list, `[[`, 1))
Likelihoods=t(Likelihoods)
Likelihoods=cbind(rownames(Likelihoods), data.frame(Likelihoods, row.names=NULL))
colnames(Likelihoods)=c("Run","likelihood")

#loop over the corhmm objects to get AIC value for each of 100 random restarts
AICs=as.data.frame(lapply(corhmm_list, `[[`, 2))
AICs=t(AICs)
AICs=cbind(rownames(AICs), data.frame(AICs, row.names=NULL))
colnames(AICs)=c("Run","AIC")


#Combine ML and AICs
ML_and_AIC <- merge(Likelihoods,AICs,by="Run")
ML_and_AIC <- ML_and_AIC %>% arrange(desc(likelihood))
write.csv(ML_and_AIC,file=paste0(Model,".100Restarts.MLandAIC.csv"))
