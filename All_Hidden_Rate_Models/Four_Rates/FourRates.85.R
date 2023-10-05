library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.85 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.397930286929767,0.342656095309143,0.163018175417503,0.150968941851499,0.124186743977935,0.120955916024269,0.114228028706731,0.083929517488451,0.0793083867760693,0.0664808778092265,0.0544322276022285,0.0515861910767853,0.0449328166432679,0.0379518399015069,0.0332183013204485,0.0308716577943414,0.025170913536019,0.0208776184070924,0.00966135412454605,0.00808358076028526),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.85.RData")
