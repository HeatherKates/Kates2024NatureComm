library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.100 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.756227825167489,0.179815301849487,0.125992390322955,0.12273492347029,0.117661293498696,0.106578296698154,0.08736359597695,0.0838916865135443,0.0632100566685205,0.0554418306797743,0.047292833160979,0.0393984723311098,0.0327746464981317,0.0298582017421722,0.0277457456104457,0.0200107601005584,0.0199457568299525,0.018277123151347,0.00342005179263651,0.00290296454913914),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.100.RData")
