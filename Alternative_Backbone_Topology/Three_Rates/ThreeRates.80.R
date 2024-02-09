library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.ThreeRates.80 <- corHMM(tree,tipstate_matrix,3,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.448818479825683,0.418163098742194,0.221704422111127,0.0982270128148867,0.0964003729591978,0.0681944523006678,0.0492340866039311,0.0492071970655632,0.0465866855811328,0.0331772780045867,0.0167109240312129,0.00433699828653578),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100) 
save.image("RData_100_Reps/DiffBB.ThreeRates.80.RData")
