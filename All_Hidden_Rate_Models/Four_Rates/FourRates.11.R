library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.11 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.257608571822259,0.229184496948931,0.156749195179102,0.128531728680701,0.126687402140183,0.123624680559607,0.114314744244785,0.0995510845837172,0.0817069166723403,0.0705997836734069,0.0686250080820173,0.0615299887489527,0.0518724426997691,0.0429633664432913,0.0326641884174859,0.0314591875765473,0.0300663503186361,0.0131566963778731,0.0096981217131269,0.00812618120730247),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.11.RData")
