library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.31 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.189208615749123,0.133792692046137,0.133601994435759,0.124996666792305,0.123688556249709,0.0950374868656409,0.086790929301244,0.0852120242351398,0.0831125072161567,0.0734478912389876,0.0374016217346566,0.0337178790010512,0.0324722492889557,0.0297234393730598,0.020816732570529,0.00938728945329785,0.00382634856133709,0.00299196634587322,0.00234106127172709,3.72065034813382e-05),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.31.RData")
