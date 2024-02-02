library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.68 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.39619506949321,0.263985992769215,0.217118304621004,0.209652079840741,0.181307094702867,0.122709365464271,0.113947509690644,0.0971137472386372,0.091982382417157,0.0806271061259222,0.0512170936446637,0.0427917616907507,0.0415097388684006,0.0382747096156816,0.0325553514063358,0.0301775872241706,0.016122424877798,0.00810316735878587,0.00802352174542791,0.000202617421746254),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.68.RData")
