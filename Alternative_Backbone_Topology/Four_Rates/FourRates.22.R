library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.22 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.434667257101828,0.361467719615853,0.302385085804348,0.249550523410056,0.190752586341443,0.184508529669585,0.144393417230787,0.1149730193185,0.097753886688025,0.0898222899022413,0.0832611978012038,0.0702308517214252,0.0609254189028579,0.0548573583830148,0.0376799377147108,0.0309999396932663,0.0302611574844855,0.0217764337511437,0.0194955261424184,0.00656353700906038),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.22.RData")
