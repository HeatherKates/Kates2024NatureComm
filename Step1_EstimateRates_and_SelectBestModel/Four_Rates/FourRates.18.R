library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.18 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.278159273926913,0.218562216857884,0.177044318980517,0.17031105364764,0.166000260031762,0.156267920500579,0.152933591804237,0.150617916382172,0.0908556968863023,0.0890256954315019,0.0830160101833654,0.0760680605152028,0.0690047034528107,0.0668069595471025,0.0552762766834348,0.0411325044332742,0.0345506128389388,0.0178251011297107,0.0118574383373564,0.0029588776640594),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.18.RData")
