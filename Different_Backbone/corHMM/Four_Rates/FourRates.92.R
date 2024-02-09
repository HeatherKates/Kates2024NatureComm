library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.92 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.378962815345681,0.331869001669769,0.298730226306278,0.173356874278727,0.152808692670407,0.150700775525513,0.142718243470712,0.13748035383922,0.082977540507437,0.0687272603623569,0.0676984467078,0.0459467515815049,0.0414419404696673,0.02807940505445,0.0262587034140947,0.0202551835682243,0.0172845997381955,0.0166966466233134,0.00792342578060925,0.00441393973305821),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.92.RData")
