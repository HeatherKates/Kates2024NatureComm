library(corHMM)

load("BestML.TwoStatesCustom.RData")
tree=ThreeStates$phy
matrix=ThreeStates$index.mat
corHMM_fit=ThreeStates
p = sapply(1:max(corHMM_fit$index.mat, na.rm = TRUE), function(x) na.omit(c(corHMM_fit$solution))[na.omit(c(corHMM_fit$index.mat) == x)][1])
p <- print(paste(as.character(p), collapse=","))
ThreeStates.bestML.joint <- corHMM(tree,tipstate_matrix,2,rate.mat=matrix,
                     node.states="joint",fixed.nodes=FALSE,
                     p=c(0.06434963439539,0.013434507633583,0.00456197253452361,NA,NA,0.0235435144569625,0.000121361017453287,0.000706218432307429,NA,NA,NA,1e-09,1e-09,0.0374016210187756),
                     root.p=NULL,
                     ip=NULL,nstarts=0,n.cores=1,get.tip.states=FALSE,
                     lewis.asc.bias=FALSE,lower.bound = 1e-9,upper.bound = 100)
save.image("ThreeStates.joint.RData")
ThreeStates$solution
