library(corHMM)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
tree <- read.tree("../../InputDataFiles/Phylogeny.WithoutTaxonLabels.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.73 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.181169437608662,0.173429249719107,0.143335728146869,0.141154356589526,0.132435866441102,0.0999905530321312,0.0933305290573548,0.0776749615515483,0.0725964195150794,0.0700101568363467,0.0573104426568733,0.0530454418156296,0.049527503689751,0.0457631474826485,0.0454590783039616,0.0384608527645469,0.0320805168710649,0.0182412669062614,0.016906230945735,0.0162237776141449),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.73.RData")
