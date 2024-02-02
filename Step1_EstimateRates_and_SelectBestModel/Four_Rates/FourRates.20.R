library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.20 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.632540728131107,0.543943147518137,0.158828105955365,0.123502809177609,0.0822334403130126,0.0678594920784235,0.0641859727911651,0.0638841283973306,0.0524242607410997,0.0459596388041973,0.0397246415261179,0.038514302438125,0.0384760606087586,0.0345438916328116,0.0330837393825326,0.026335164019838,0.0133887342177331,0.0116622051224113,0.00837301144214147,0.00637312729098562),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.20.RData")
