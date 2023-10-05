library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.2 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.361194886606813,0.239069166208122,0.202925659148934,0.173086432359161,0.152664886034074,0.14552933343357,0.127795997071536,0.118205945003302,0.110829211674155,0.104651366915078,0.0626693105790764,0.0580271575134248,0.0489149191882461,0.0372404070105404,0.0322699734578161,0.028011033963412,0.0175717403180897,0.0175001176781486,0.0134010248817503,0.00454362998716533),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.2.RData")
