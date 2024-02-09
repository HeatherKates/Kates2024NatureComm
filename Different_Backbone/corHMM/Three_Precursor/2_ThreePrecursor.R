library(corHMM)
Tips <- c("Sp1","Sp2","Sp3")
State <- c("Nodulating","Non-nodulating","?")
Data <- cbind(Tips,State)
RateClassMat <- getRateCatMat(3)
RateCat1 <- getStateMat4Dat(Data)$rate.mat
RateCat2 <- getStateMat4Dat(Data)$rate.mat
RateCat3 <- getStateMat4Dat(Data)$rate.mat
#Make it so that rate cat 3 is the one that can't gain nodulation, remove 1 --> 2
RateCat3[3] <- 0
StateMats <- list(RateCat1, RateCat2,RateCat3)
HR3.precursorish.FullMat <- getFullMat(StateMats, RateClassMat)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.Three.Precursor.NUM <- corHMM(tree,tipstate_matrix,3,rate.mat=HR3.precursorish.FullMat,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=CUSTOM,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.Three.Precursor.NUM.RData")
