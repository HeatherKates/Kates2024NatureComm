library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.71 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.355710703672326,0.317012933624868,0.248444991732452,0.199434412634912,0.183564349331373,0.153490403175355,0.147788888392201,0.110567259877445,0.0983795662368548,0.0977219568058204,0.076228430769862,0.0540350697934628,0.0527454162482172,0.0301355152856559,0.0285865259822458,0.0210268165450543,0.0132310699421208,0.0131613045930862,0.00596215254627168,0.00338387397127067),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.71.RData")
