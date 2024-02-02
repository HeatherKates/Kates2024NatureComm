require(corHMM)
require(parallel)
library(tidyr)

Tips <- c("Sp1","Sp2","Sp3")
State <- c("Nodulating","Non-nodulating","?")
Data <- cbind(Tips,State)
RateClassMat <- getRateCatMat(4)
RateCat1 <- getStateMat4Dat(Data)$rate.mat
RateCat2 <- getStateMat4Dat(Data)$rate.mat
RateCat3 <- getStateMat4Dat(Data)$rate.mat
RateCat4 <- getStateMat4Dat(Data)$rate.mat
StateMats <- list(RateCat1, RateCat2,RateCat3,RateCat4)
#Make it so that rate cat 4 is the one that can't gain nodulation, remove 1 --> 2
RateCat4[3] <- 0
StateMats <- list(RateCat1, RateCat2,RateCat3,RateCat4)
index.mat <- getFullMat(StateMats, RateClassMat)


# function for generating random parameters
generateStarts <- function(n_parameters, mean_rate){
  starts<-sort(rexp(n_parameters, 1/mean_rate), decreasing = TRUE)
  return(starts)
}

# for 10 random restarts
n_starts <- 100
n_parameters <- max(index.mat, na.rm = TRUE) # the number of parameters my model uses
mean_rate <- 0.1
random_ip_list <- as.data.frame(lapply(1:n_starts, function(x) generateStarts(n_parameters, mean_rate)))
colnames(random_ip_list)=c(1:100)
test=t(random_ip_list)
write.csv(test,"randomiplist.n100.csv",quote=FALSE,row.names = FALSE)
#Bash post processing
#remove first row
#sed 's/^/c(/g' randomiplist.n100.csv|sed 's/$/)/g' > randomiplist.n100.out.csv
