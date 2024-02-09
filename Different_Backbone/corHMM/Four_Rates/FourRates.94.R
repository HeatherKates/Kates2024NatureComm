library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.94 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.214208863828726,0.209471782098029,0.199324840112569,0.153805670692565,0.100472990698637,0.0991448151837003,0.077094955645026,0.0664462646003813,0.0488396254368126,0.0478988470043987,0.0440904450137168,0.0412111049517989,0.0355354519216534,0.0333636168390513,0.0252054973505437,0.0184671627357602,0.00663357167504728,0.00660474858276749,0.00359846222353605,0.000100285606458783),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.94.RData")
