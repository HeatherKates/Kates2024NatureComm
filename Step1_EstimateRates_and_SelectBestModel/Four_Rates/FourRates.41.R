library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.41 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.231249030480597,0.193911345108392,0.139027433182601,0.12771313804713,0.118476494490625,0.0805542999836517,0.0742659278171969,0.0604083473328501,0.0418230616021901,0.0413247094489634,0.0386368662822139,0.0359003754798323,0.0326470509637147,0.0270426326896995,0.0264924252405763,0.0163535411123927,0.0128393500577658,0.0119504677893574,0.00369675806723535,0.00234935758635402),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.41.RData")
