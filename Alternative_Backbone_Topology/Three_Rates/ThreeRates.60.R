library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.ThreeRates.60 <- corHMM(tree,tipstate_matrix,3,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.286318694643063,0.161735828925194,0.101009042649986,0.0933512418488872,0.04549499909436,0.0450154702644795,0.0267282633359081,0.0255451192418814,0.0163488698657602,0.0160973239690065,0.014991619781807,0.00769197223708034),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100) 
save.image("RData_100_Reps/DiffBB.ThreeRates.60.RData")
