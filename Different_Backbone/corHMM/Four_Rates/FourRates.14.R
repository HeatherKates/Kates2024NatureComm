library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.14 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.303328607959633,0.299928578165244,0.260006896207545,0.188965365654769,0.132877963870288,0.127674547392399,0.104061515345694,0.082599500189991,0.0819849231238377,0.0605145149864256,0.0586398301180452,0.0561893713194877,0.0534535881088568,0.0382361797150224,0.0340299786068499,0.027216385724023,0.0257090228630151,0.0116662949704427,0.0110646788496524,0.00889240155355541),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.14.RData")
