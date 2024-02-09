library(corHMM)
#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=2
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE 
