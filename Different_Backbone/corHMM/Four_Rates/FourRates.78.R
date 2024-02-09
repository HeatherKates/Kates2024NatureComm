library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.78 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.58726141300417,0.404378776790059,0.395868170485738,0.184043200126721,0.168800347662511,0.129833580549331,0.106901786099644,0.0987214312846673,0.0948048235806537,0.0880632816002479,0.0798052679705334,0.0552446356974542,0.0439978211652488,0.0400433123111725,0.036214232110064,0.0316441389732063,0.0099427027287577,0.00756871928460896,0.00454223421402276,0.0027941441629082),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.78.RData")
