library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.48 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.587408243086109,0.402004363180554,0.271181807095621,0.260486995974991,0.257506879220221,0.25124279874048,0.245151179457519,0.229217500040743,0.10025169073092,0.0998884540009213,0.0992561819261304,0.0979539195417598,0.0875017228206792,0.0684052416589111,0.061364721506834,0.0546811995096505,0.0382020326046132,0.0266494969371706,0.0254832932259887,0.0173412278490392),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.48.RData")
