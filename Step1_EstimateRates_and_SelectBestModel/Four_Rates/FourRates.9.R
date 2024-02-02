library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.9 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.318705069701605,0.174871009996002,0.164876279179153,0.160710471313265,0.152746258295121,0.137085873629422,0.122284515477241,0.115078674718262,0.0925439882050169,0.0654194885399193,0.063004790386185,0.041912102792412,0.0402400073129684,0.0389396708924323,0.0358038086909801,0.0303163853063448,0.0194465041934468,0.0106435200199485,0.00423481236211956,0.000588098465573659),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.9.RData")
