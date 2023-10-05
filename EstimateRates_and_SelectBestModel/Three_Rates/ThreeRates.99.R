library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=2
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
AncPres.ThreeRates.99 <- corHMM(tree,tipstate_matrix,3,rate.mat=NULL,
                     node.states="none",fixed.nodes=TRUE,p=NULL,root.p=NULL,
                     ip=c(0.272843206847522,0.194605858801844,0.155387034631314,0.12584276869473,0.122551939259739,0.108316709469528,0.06977483967825,0.0532983999233693,0.0513978198636323,0.0257714672169665,0.017552308055905,0.00603843274387083),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100) 
save.image("RData_100_Reps/AncPres.ThreeRates.99.RData")
