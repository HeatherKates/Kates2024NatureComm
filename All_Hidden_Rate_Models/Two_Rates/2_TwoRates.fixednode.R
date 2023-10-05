library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=2
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
AncPres.TwoRates.NUM <- corHMM(tree,tipstate_matrix,2,rate.mat=NULL,
                     node.states="none",fixed.nodes=TRUE,p=NULL,root.p=NULL,
                     ip=CUSTOM,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/AncPres.TwoRates.NUM.RData")
