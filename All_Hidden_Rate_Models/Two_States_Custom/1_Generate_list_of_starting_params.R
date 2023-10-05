require(corHMM)
require(parallel)
library(tidyr)

Tips <- c("Sp1","Sp2","Sp3","Sp4")
State <- c("Rhizobial","Actinorhizal","Non-nodulating","?")
Data <- cbind(Tips,State)
RateClassMat <- getRateCatMat(2)
RateCat1 <- getStateMat4Dat(Data)$rate.mat
RateCat2 <- getStateMat4Dat(Data)$rate.mat

#Make it a precursor model by removing gains of state 1 or state 2 in one rate cat (RateCat2)
RateCat2[4] <- 0
RateCat2[7] <- 0
#Now rate category 1 state 1 is the non-precursor from which neither 
#actinorhizal nor rhizobial nodulation can be gained
RateCat2
#Make it so that in both rate categories:
#only actinorhizal (state 2) can become rhizobial (state 3)
#1) state 3 can't become state 2
#2) state 1 can't become state 3
#For Ratecat1
RateCat1
#1 can't -> 3
RateCat1[7] <- 0
#3 can't -> 2
RateCat1[6] <- 0
RateCat1
#Same for RateCat2
RateCat2[6] <- 0
RateCat2[7] <- 0
RateCat2

StateMats <- list(RateCat1, RateCat2)
index.mat <- getFullMat(StateMats, RateClassMat)
index.mat

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
