library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.43 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.349816658140576,0.24378828460953,0.21308595279513,0.212994707176898,0.199113025694134,0.16402763108814,0.154346182950728,0.107492781519414,0.107056522551448,0.0801568222190154,0.0681087505538017,0.0633451547008008,0.0541982535923594,0.0537945631425828,0.0454782790038735,0.0230650816044976,0.0195986517390822,0.0150528122205287,0.0147823764011264,0.00391741590574384),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.43.RData")
