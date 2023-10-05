library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.89 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.337407094968443,0.227891249010775,0.221270802045677,0.2006170572629,0.178322537234964,0.174807398757877,0.168880679077449,0.134663476697625,0.127429358470709,0.125224911510469,0.118812405779482,0.0965073574292374,0.0709507873239827,0.065297817857936,0.0386406285688281,0.0239043807145208,0.0211720489896834,0.0178400055268289,0.00990663575500731,0.00606200112961233),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.89.RData")
