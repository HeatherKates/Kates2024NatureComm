library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.45 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.31709355933774,0.274061784321878,0.204780442631784,0.178734377390685,0.14529851035647,0.119130888204546,0.109051411687852,0.100622508111866,0.0981023035901499,0.0695161872501385,0.0685363654047251,0.0630468066781759,0.0608845037408173,0.0580092985183001,0.0480474916752428,0.0393276848830283,0.0369134983513504,0.0368778034199717,0.0146551812533289,0.00719147706404328),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.45.RData")
