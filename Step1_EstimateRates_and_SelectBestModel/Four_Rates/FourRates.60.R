library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.60 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.210987743536446,0.137627981598945,0.125148152090133,0.123751040171356,0.114607477649571,0.105486479583652,0.0783851108967555,0.0496716458816081,0.0492687546648085,0.0391250546090305,0.0349603013826191,0.0348195942118764,0.0307609676849097,0.0294833854418434,0.0259916565122843,0.0100841992727352,0.00814335058563083,0.00275639211616973,0.00274896876804145,0.00214905687607825),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.60.RData")
