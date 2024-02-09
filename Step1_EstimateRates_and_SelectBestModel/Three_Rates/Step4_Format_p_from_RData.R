load("RData_100_Reps/v6.ThreeRates.39")
corHMM_fit=v6.ThreeRates.39
p = sapply(1:max(corHMM_fit$index.mat, na.rm = TRUE), function(x) na.omit(c(corHMM_fit$solution))[na.omit(c(corHMM_fit$index.mat) == x)][1])
print(paste(as.character(p), collapse=","))
