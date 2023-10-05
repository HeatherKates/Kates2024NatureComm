#Load ten .RData files that each include a corhmm object
files=list.files(path="RData_100_Reps/",pattern="edit*")
for (i in 1:length(files)){load(paste("RData_100_Reps",files[i],sep="/"))}
#Make a list of the corhmm objects
corhmms=mget(ls(pattern="edit*"))
#loop over the corhmm objects to 
new=as.data.frame(lapply(corhmms, `[[`, 1))
new=t(new)
new=cbind(rownames(new), data.frame(new, row.names=NULL))
colnames(new)=c("Run","likelihood")
new <- new[order(new$likelihood),]
write.table(new,"edit.ML.txt",quote=FALSE)
