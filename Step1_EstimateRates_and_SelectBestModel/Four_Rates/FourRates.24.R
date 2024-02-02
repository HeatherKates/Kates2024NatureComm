library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.24 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.426296188284583,0.322761540098076,0.274903486842725,0.231626367707467,0.156349731787088,0.0974191056522441,0.0961274292278004,0.0937969797248853,0.0760642565526093,0.0572607924696058,0.055715741622624,0.0506972963456064,0.0262693721801043,0.0201388568617404,0.0173335947096348,0.0147688102908432,0.0132221543230907,0.0114941558266179,0.00413899263367057,0.000185822054049028),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.24.RData")
