library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.23 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.282392782146741,0.265333092758868,0.226138125161145,0.206675409144702,0.165549592479112,0.1498950837096,0.109433322768183,0.10657622469169,0.0984390544663084,0.0800545395759264,0.0727660332761367,0.0411349207162857,0.0409668357990607,0.0296446822118014,0.0224891063673543,0.0129472076781015,0.0090320136398077,0.00811897014619257,0.00342677501030266,0.000779012544080615),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.23.RData")
