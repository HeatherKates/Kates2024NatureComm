library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.27 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.248683911026783,0.243276588625713,0.227318691496756,0.136921962625803,0.127506777919353,0.102900518238182,0.101990771196307,0.0495696424506605,0.0470203673932701,0.0405487823765725,0.0318594831041992,0.0298872399143875,0.0212792474836167,0.0184732385138731,0.0118608153374017,0.0114526290912181,0.00769354481492601,0.00313465724237336,0.00194190740585327,0.00151304838473311),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.27.RData")
