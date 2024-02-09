library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.51 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.317311372591143,0.272537748689268,0.244923474227826,0.159824055926054,0.156859024978223,0.142307559854171,0.141433123884411,0.123383677001567,0.108881153907151,0.10772264431742,0.100707408222826,0.0672752431128174,0.0540826001670212,0.0489403307437897,0.0457087201531977,0.0444872181396931,0.0251601870637387,0.0242911149870186,0.00262141627281972,0.0024405680193679),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.51.RData")
