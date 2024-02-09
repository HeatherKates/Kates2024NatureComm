library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.17 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.341501564515715,0.189336388549748,0.161023066370728,0.159161423510852,0.148421908446683,0.122591873254151,0.106749420143188,0.0977569789583695,0.0659680500626564,0.0654343191534281,0.0566326468717307,0.0532175503205508,0.049484223080799,0.0444920940058582,0.0431190077681094,0.0303433360745249,0.0249443964567035,0.0171362477820367,0.00605559512041509,0.00477836509235203),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.17.RData")
