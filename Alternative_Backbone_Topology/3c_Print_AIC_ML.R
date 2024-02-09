#Load .RData files that each include a corhmm object
files=list.files(path="One_Rate/RData_100_Reps",pattern="*RData")
for (i in 1:length(files)){load(paste("One_Rate/RData_100_Reps",files[i],sep="/"))}
#Make a list of the corhmm objects
corhmms=mget(ls(pattern="One*"))

#loop over the corhmm objects to get AIC
new=as.data.frame(lapply(corhmms, `[[`, 2))
new=t(new)
new=cbind(rownames(new), data.frame(new, row.names=NULL))
colnames(new)=c("Run","AICc")
new <- new[order(new$AICc),]

#loop over the corhmm objects to get ML
ML=as.data.frame(lapply(corhmms, `[[`, 1))
ML=t(ML)
ML=cbind(rownames(ML), data.frame(ML, row.names=NULL))
colnames(ML)=c("Run","likelihood")

#Merge both
ML.AIC=merge(ML,new,by="Run")
#sort by ML value
ML.AIC <- ML.AIC[order(ML.AIC$likelihood),]
#write
write.table(ML.AIC,"ML.AIC.txt",quote=FALSE)
