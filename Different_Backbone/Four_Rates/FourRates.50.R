library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.50 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.679804341099183,0.393973772765553,0.196264402746203,0.182019727482441,0.1712005897356,0.170091497330906,0.158489618069472,0.14248281313268,0.130918306014956,0.111686631846697,0.108135255794497,0.107746829367698,0.100652097809516,0.0927880259188724,0.073662596098603,0.0308534025349272,0.0160119347620502,0.00894305338151753,0.00566263762302697,0.00179173937067389),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.50.RData")
