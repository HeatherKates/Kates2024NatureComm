library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.99 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.556810513303491,0.246026444725733,0.245544647911397,0.243490822041843,0.222281712352703,0.222139716322038,0.215077296000771,0.189810557096245,0.136847070227833,0.08551120909017,0.059395088115707,0.0541973506100476,0.0318169628858258,0.0228997008875012,0.0196918034460396,0.0175287827383727,0.0163233479950577,0.0142678586766124,0.00501495440624232,0.00101256328634918),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.99.RData")
