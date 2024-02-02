library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.1 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.464664290157288,0.270242832402203,0.192864139183405,0.170104049882832,0.165377042992952,0.160844690158012,0.105401172764124,0.0978097506756795,0.092774746935339,0.0584296843502671,0.0530789766926318,0.0435400908812881,0.0374290243256837,0.0345055473587057,0.0320562505628914,0.0190461569890209,0.0180887364782393,0.00384072037413716,0.000623264582827687,6.77384901791811e-05),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.1.RData")
