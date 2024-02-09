library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.96 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.185974509405999,0.124286721828849,0.112689656294407,0.110238601635666,0.0742090558651584,0.0709320770534587,0.0661404201760888,0.0593547210097313,0.0579678218346089,0.0493838829919696,0.0463937694206834,0.0357262753410121,0.0349431879818439,0.0344673985149711,0.0328834856394678,0.0322242898400873,0.0271753261433694,0.0181900431125486,0.0138486660552444,0.0128638393673149),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.96.RData")
