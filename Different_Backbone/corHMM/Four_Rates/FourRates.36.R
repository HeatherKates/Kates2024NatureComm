library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.36 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.215311798450546,0.191137321098688,0.177897052085939,0.132884316607834,0.126677011228622,0.101474367264183,0.0739843019242299,0.0674834902398288,0.0602850851602852,0.0443251604214311,0.0435887027997524,0.0345117233227938,0.0268641229253262,0.0258988333400339,0.0151609007269144,0.0119029386900365,0.0111578996126625,0.00642127956747883,0.00370482723487968,0.00258089719454602),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.36.RData")
