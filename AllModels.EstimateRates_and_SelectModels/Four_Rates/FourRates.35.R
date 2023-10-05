library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.35 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.329790084792261,0.32121155260313,0.215537018502567,0.198802261977437,0.190979495636168,0.187780500940027,0.179604321337285,0.162235489851775,0.149620534843745,0.1382726021069,0.131820172532917,0.129322866905005,0.12770797619176,0.112495118656428,0.0878483039284957,0.0771452917527736,0.0762661791364563,0.035962210316211,0.0163009158801287,0.000521641923114657),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.35.RData")
