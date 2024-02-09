library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../DiffBB.v7.Nitfix.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=#label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=FALSE
DiffBB.FourRates.38 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.209728664333437,0.174621659508886,0.166225530618835,0.152164335724571,0.126390652633728,0.114650052685044,0.100717571812632,0.0914000648963166,0.0909429964567435,0.0872806685003352,0.0822721894579995,0.0623156571295112,0.0535321306437254,0.0522449234500527,0.0495567485690117,0.0395812375005335,0.0338294405024499,0.0152363450266421,0.0149538754485548,0.0147861022967845),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/DiffBB.FourRates.38.RData")
