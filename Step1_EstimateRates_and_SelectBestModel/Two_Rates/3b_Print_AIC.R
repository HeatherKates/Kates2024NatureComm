#Load ten .RData files that each include a corhmm object
files=list.files(path="RData_100_Reps",pattern="*RData")
for (i in 1:length(files)){load(paste("RData_100_Reps",files[i],sep="/"))}
#Make a list of the corhmm objects
corhmms=mget(ls(pattern="v6*"))
#loop over the corhmm objects to 
new=as.data.frame(lapply(corhmms, `[[`, 2))
new=t(new)
new=cbind(rownames(new), data.frame(new, row.names=NULL))
colnames(new)=c("Run","AICc")
new <- new[order(new$AICc),]
write.table(new,"AIC.txt",quote=FALSE)
