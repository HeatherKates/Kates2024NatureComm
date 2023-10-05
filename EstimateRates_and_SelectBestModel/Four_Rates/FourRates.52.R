library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.52 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.411932807208455,0.335964021069889,0.25687876845381,0.253091826836083,0.216415682981226,0.214514722168419,0.20524812041873,0.160414783275666,0.143743045805934,0.128014655407043,0.112715707808257,0.066029943106696,0.0363585226237774,0.0362488239072263,0.0320587598253042,0.0284346036147326,0.0279404372908175,0.0218572639458149,0.0124531479552388,0.00726788900792599),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.52.RData")
