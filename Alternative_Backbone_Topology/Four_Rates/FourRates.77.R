library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.77 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.340890751017218,0.256028845068769,0.240457393775199,0.169649976683649,0.16730419191623,0.116338710317175,0.104008338130535,0.0824487409512413,0.0722651523365506,0.063411968247965,0.0631275140214711,0.0628100372385234,0.0582253348082304,0.0405360943172127,0.0380466385278851,0.0367589390864867,0.03565359035748,0.0169339325278997,0.010617326568453,0.00983948595821858),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.77.RData")
