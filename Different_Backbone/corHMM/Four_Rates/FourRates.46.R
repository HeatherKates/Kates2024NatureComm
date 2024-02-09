library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.46 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.324828439088341,0.309362717468941,0.241939526597474,0.212648431757901,0.13636831882921,0.125890592760862,0.111463808077843,0.108035889077456,0.101264752629669,0.0793072878348933,0.0774344567167473,0.0531173025257885,0.0488323428668082,0.0479785786941648,0.0432801063172519,0.0324963035061955,0.0141111469361931,0.00648071612391797,0.00560698442610529,0.000290349573903255),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.46.RData")
