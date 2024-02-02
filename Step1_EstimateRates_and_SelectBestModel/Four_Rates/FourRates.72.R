library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.72 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.3728125532879,0.176379136514122,0.159846205431307,0.095130057908119,0.090912700440259,0.0872770946544822,0.0858716797742997,0.0686952990014106,0.0614777070935816,0.047816263884306,0.0458734968677163,0.035319214174524,0.0288331039715558,0.0270261339377612,0.0186894085723907,0.0112140151672065,0.0106307003117005,0.00863496337481779,0.00345095125958323,0.00190127827227116),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.72.RData")
