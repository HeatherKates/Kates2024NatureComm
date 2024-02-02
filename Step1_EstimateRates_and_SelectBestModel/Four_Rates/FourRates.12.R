library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.12 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.165271538757503,0.142809118566139,0.139018370575252,0.1325891838367,0.12880477476445,0.127373080137641,0.100503753307731,0.0886084883431804,0.0878926472696376,0.081632638997854,0.0446769794914871,0.0388068847823888,0.0357160861603916,0.0325309042818844,0.0190549500286579,0.0184270810335875,0.0174367454368621,0.0158638228196651,0.00685515737250756,0.00437740324883662),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.12.RData")
