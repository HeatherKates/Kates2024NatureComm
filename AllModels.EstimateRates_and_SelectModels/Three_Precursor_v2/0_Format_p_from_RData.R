load("v7.ThreePrecursor.bestML.RData")
corHMM_fit=v6.Three.Precursor.74
p = sapply(1:max(corHMM_fit$index.mat, na.rm = TRUE), function(x) na.omit(c(corHMM_fit$solution))[na.omit(c(corHMM_fit$index.mat) == x)][1])
print(paste(as.character(p), collapse=","))
