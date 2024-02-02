library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.29 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.395271900834,0.359428908148774,0.253177737618301,0.235097000352323,0.232065247917984,0.207844207613709,0.189488151847365,0.147400398171487,0.106976683367545,0.103131991341234,0.0923034150111389,0.0785905274589767,0.0707227055872691,0.0656634749379009,0.0481098204851151,0.0302872562319229,0.0184405851909069,0.00679719350300729,0.00271511883314995,0.00162047500869314),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.29.RData")
