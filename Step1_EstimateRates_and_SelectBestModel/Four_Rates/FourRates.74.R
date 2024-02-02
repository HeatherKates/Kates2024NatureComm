library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.74 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.25922971832237,0.143575143748418,0.132453715610774,0.130269021816076,0.123850818160446,0.0998618600848031,0.0954011245588672,0.0925202206666482,0.0800975562624534,0.0784596970262838,0.078324598628552,0.0610322224907577,0.0548946834169328,0.0485028713475913,0.0441544843837619,0.0436809662729502,0.015170042986108,0.00459700077432094,0.00426009109270092,0.00388731812126935),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.74.RData")
