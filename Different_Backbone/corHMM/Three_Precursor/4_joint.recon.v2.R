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
v7.joint.bestML <- corHMM(tree,tipstate_matrix,3,rate.mat=HR3.precursorish.FullMat,
                     node.states="joint",fixed.nodes=FALSE,p=c(0.000843060715659641,1e-09,1e-09,0.0138577217768231,1.34716261918962,0.0178858825853442,0.0262575485884516,1e-09,0.00225818344125625,1e-09,0.0349159593397866),root.p=NULL,
                     ip=NULL,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("v7.joint.bestML.v2.RData")
