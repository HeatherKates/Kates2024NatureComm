library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.64 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.190256412132623,0.184931250280681,0.156674879084375,0.141864398299696,0.133246766771646,0.122866003024848,0.0988937226771664,0.0804797715991569,0.0683571063913405,0.068316334951669,0.0634460910689086,0.0598088482394815,0.0409002495081552,0.0360104556643714,0.0321230017114431,0.0266887912992388,0.020379955181852,0.020071513987683,0.00215351465572631,0.000596562559120928),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.64.RData")
