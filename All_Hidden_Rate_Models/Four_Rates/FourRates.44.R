library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.44 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.256150114709947,0.204454834750834,0.201925986251774,0.187591165685288,0.172447678007341,0.144986930838058,0.105973156257988,0.0451574865262955,0.0414771093986928,0.0401476016268134,0.0381358519662172,0.035694202920422,0.030737802805379,0.0281965033151209,0.0274744664784521,0.0266295732464641,0.0184970389585942,0.0182666111271828,0.0132637728005648,0.00922202738001943),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.44.RData")
