library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.82 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.209087250927899,0.173112355101187,0.155595028205755,0.123265351816536,0.118839327055485,0.097236132524432,0.0911869087214482,0.0806355506139708,0.0789033680307062,0.0533175083808601,0.0518095943145454,0.0416361362673342,0.0292198735289276,0.0260704682211746,0.024266788660274,0.0161127270199358,0.0102943999102846,0.00627675685100257,0.00375654891569319,0.00046345140078518),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.82.RData")
