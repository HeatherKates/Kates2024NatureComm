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
tipstate_matrix <- read.csv("TipStates.csv",header=TRUE)
tree <- read.tree("../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=2
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
AncPres.bestML.joint <- corHMM(tree,tipstate_matrix,3,rate.mat=HR3.precursorish.FullMat,
                     node.states="joint",fixed.nodes=TRUE,p=c(0.000567662444097088,1e-09,1e-09,0.0997921919038487,0.79698010287882,0.109278427625107,0.0276030407790772,1e-09,0.00837136624909948,1e-09,0.021712143383508),root.p=NULL,
                     ip=NULL,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("AncPres.bestML.joint.RData")
