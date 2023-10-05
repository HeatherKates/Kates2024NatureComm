library(corHMM)
tipstate_matrix <- read.csv("../Nitfix.statedata.v7.csv",header=TRUE)
tree <- read.tree("../Nitfix.tree.v7.tree")
#fixing node
#label.vector=rep(NA,Ntip(tree)+Nnode(tree))
#label.vector[35246]=2
#tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
FourRates.97 <- corHMM(tree,tipstate_matrix,4,rate.mat=NULL,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.396778098286545,0.344742407632952,0.213352763826463,0.187938757791164,0.144534894504355,0.123994702189685,0.088933536464695,0.0825005449312639,0.0667044125497341,0.065875860909,0.0626662942115217,0.0616962213534862,0.0493947956072298,0.045945042790845,0.0290995144285262,0.0186025729868561,0.0136395909357816,0.0125473109985657,0.00976307513192296,0.00269462722353637),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/FourRates.97.RData")
