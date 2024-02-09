library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.6 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.261430786723707,0.231667139516067,0.197491589925232,0.185004717235241,0.148182466245236,0.138787395871224,0.134448151658745,0.130211990415574,0.120820769663425,0.11201284052384,0.109384241323442,0.102352694851533,0.0834287649940831,0.064451501891017,0.0461620419751853,0.0191502490080893,0.0134063902311027,0.00655968938954175,0.00519677923807762,0.00281278388544734),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.6.RData")
