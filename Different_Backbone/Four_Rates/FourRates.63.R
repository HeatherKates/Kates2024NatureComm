library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.63 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.323349418474321,0.279013218713884,0.241051712060783,0.220182072120505,0.219641558627102,0.217900880460332,0.209564695022126,0.132907736204089,0.113505966884779,0.111454482838036,0.0913597705732,0.0883516744668496,0.0682367047760636,0.0648218311369419,0.0493668498788118,0.0490133256651461,0.0306459669489414,0.0167680505593169,0.0157293792348355,0.00175440139137208),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.63.RData")
