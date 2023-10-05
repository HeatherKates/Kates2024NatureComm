library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=2
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
AncPres.ThreeRates.98 <- corHMM(tree,tipstate_matrix,3,rate.mat=NULL,
                     node.states="none",fixed.nodes=TRUE,p=NULL,root.p=NULL,
                     ip=c(0.328362012637739,0.164533760159245,0.137761962502719,0.112834063820065,0.112083738293023,0.109446191504122,0.0831252388743686,0.0689317116513848,0.0572491730097681,0.0504138352999194,0.0288108409382403,0.0150928334333003),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100) 
save.image("RData_100_Reps/AncPres.ThreeRates.98.RData")
