library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.42 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.334012874199038,0.224893772794162,0.190471967673841,0.15543944090601,0.107227435238184,0.0912905383813095,0.0713108374695194,0.0699712964339805,0.0688706625252962,0.0614713732153177,0.0601761829573661,0.0480065006762743,0.017960333985514,0.0176784559611868,0.0113001363853668,0.0103430798864074,0.0100711658596992,0.00691174081982358,0.00409472789615393,0.00304964444150023),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.42.RData")
