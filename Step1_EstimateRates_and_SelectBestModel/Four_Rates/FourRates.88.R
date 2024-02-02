library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.88 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.384365378625031,0.369947517219033,0.190220878637376,0.160244285120609,0.158420470348539,0.135894279643418,0.102059649019958,0.0865383270672643,0.0780946966716591,0.0777905911765485,0.0442053210921586,0.0400396946351975,0.0321871154008429,0.0287934379186481,0.0272348771546918,0.0214938523909074,0.0200728901091495,0.00861758291721344,0.0077858280390501,0.00643708418590835),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.88.RData")
