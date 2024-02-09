library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.ThreeRates.94 <- corHMM(tree,tipstate_matrix,3,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.402373736144459,0.162605909063461,0.159852115242722,0.132595396968992,0.103693609866769,0.0940102789509011,0.0820387452478754,0.0789819926126406,0.0373302660384016,0.0353091763332486,0.0157474589999765,0.00364768574945629),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100) 
save.image("RData_100_Reps/DiffBB.ThreeRates.94.RData")
