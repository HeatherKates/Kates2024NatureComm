library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.69 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.342277438921814,0.140619678165467,0.139198412178996,0.134181369836898,0.0954038619953108,0.0883126837454106,0.0666771274991333,0.0623284823742777,0.0589060684666038,0.0315701027400792,0.0311635595280677,0.0308104762083679,0.0220489117782563,0.0207441707607359,0.0180860333610326,0.0179328937823023,0.0111250305082649,0.00956217558123171,0.00533581138702089,0.00324514040238875),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.69.RData")
