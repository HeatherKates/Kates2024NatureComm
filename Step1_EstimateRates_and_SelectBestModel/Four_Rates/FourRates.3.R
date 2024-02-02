library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.3 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.37775261455909,0.321932784493265,0.278423214053236,0.148537888742032,0.13583680782047,0.131620695530893,0.125497887931289,0.103317694587173,0.0995172187643957,0.0864533708388818,0.0650418357923627,0.0600006996188313,0.0547826420515776,0.0507080756593496,0.0361199023667723,0.0286171589470896,0.0212863485328853,0.0152820858279173,0.0120493007823825,0.00192443982371099),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.3.RData")
