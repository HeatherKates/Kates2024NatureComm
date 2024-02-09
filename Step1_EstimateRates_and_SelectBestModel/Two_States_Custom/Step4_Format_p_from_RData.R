load("RData_100_Reps/Species.3HRC.Precursor.12.RData")
corHMM_fit=Species.3HRC.Precursor.12
p = sapply(1:max(corHMM_fit$index.mat, na.rm = TRUE), function(x) na.omit(c(corHMM_fit$solution))[na.omit(c(corHMM_fit$index.mat) == x)][1])
print(paste(as.character(p), collapse=","))
