library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.39 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.290847735090141,0.259684589306328,0.18218327666724,0.16408949649346,0.161097662142458,0.131204855903508,0.112092730162393,0.107466698404003,0.0904897691639972,0.088525648407064,0.088074924140693,0.080514317204127,0.0501023130491376,0.0376380926929414,0.0338381039444357,0.0257435234729201,0.0221300343982875,0.0188727694097906,0.0124811905642114,0.0052162265945823),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.39.RData")
