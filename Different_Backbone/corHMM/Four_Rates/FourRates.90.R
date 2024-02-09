library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.90 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.282112323818075,0.181020118846538,0.163062678887811,0.119920494030685,0.115999838426234,0.115034792847456,0.0960593052166415,0.0931937864939583,0.0807176035786879,0.0722503905292796,0.0656759852077843,0.0487870266661048,0.0486197982914746,0.0434895218815655,0.0368931771703142,0.0302536142058671,0.0301972914952785,0.0154664538335055,0.00683929799124599,0.0061129869427532),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.90.RData")
