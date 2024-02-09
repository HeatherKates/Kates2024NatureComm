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
tipstate_matrix <- read.csv("../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../InputDataFiles/AlternativeTopology.Phylogeny.NoTaxonLabels.tree")
edit.DiffBB.joint.bestML <- corHMM(tree,tipstate_matrix,3,rate.mat=HR3.precursorish.FullMat,
                     node.states="joint",fixed.nodes=FALSE,p=c(0.000804457357351217,1e-09,1e-09,0.0814636247178405,2.74257974809602,0.104767007545373,0.0236320709662464,1e-09,0.00730764831888938,1e-09,0.0234002743733769),root.p=NULL,
                     ip=NULL,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("AncestralStateReconstruction.AltBackbone.RData")
