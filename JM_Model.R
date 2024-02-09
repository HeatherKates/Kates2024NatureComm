library(corHMM)
library(ggtree)

#I think Jean-Michel's "a better precursor model" is just the 2 rate precursor model

#Let's load it
load("v7.Backbone_astral003/corHMM/Two_Precursor/RData_100_Reps/AncAbs.TwoPrecursor.90.RData")
load("JMmodel.bestML.joint.RData")
corHMM_fit=AncPres.TwoPrecursor.90
p = sapply(1:max(corHMM_fit$index.mat, na.rm = TRUE), function(x) na.omit(c(corHMM_fit$solution))[na.omit(c(corHMM_fit$index.mat) == x)][1])
print(paste(as.character(p), collapse=","))


#fixing node
label.vector=rep(NA,Ntip(tree)+Nnode(tree))
label.vector[35246]=1
tree$node.label=label.vector[-c(1:Ntip(tree))]
#set fixed.nodes=TRUE
AncAbs.bestML.joint <- corHMM(tree,tipstate_matrix,2,rate.mat=HR3.precursorish.FullMat,
                               node.states="joint",fixed.nodes=TRUE,p=p,root.p=NULL,
                               ip=NULL,nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                               lower.bound = 1e-9,upper.bound = 100)
save.image("JMmodel.bestML.joint.RData")

#Loading and formatting data
#################Species tree##################
##LOAD DATA##
load("JMmodel.bestML.joint.RData")
load("v7.Backbone_astral003/corHMM/v7.joint.bestML.v2.edit.v2.RData")
sp.taxtree=read.tree("v7.Backbone_astral003/corHMM/Nitfix.taxtree.v7.tree")
#Node states
sp.joint.node.states <- as.data.frame(AncAbs.bestML.joint$states)
colnames(sp.joint.node.states) <- "states"
#Make the row name a column called node and make it numeric
sp.joint.node.states<- cbind(node=rownames(sp.joint.node.states),sp.joint.node.states,row.names=NULL)
sp.joint.node.states$node <- as.numeric(sp.joint.node.states$node)
#Add number of tips to the node.state data because of how ggplot codes the tips
sp.joint.node.states$node <- sp.joint.node.states[, 1] + length(AncAbs.bestML.joint$phy$tip.label)
#Tip states
sp.joint.tip.states <- as.data.frame(AncAbs.bestML.joint$tip.states)
colnames(sp.joint.tip.states) <- "states"
#Make the row name a column called node and make it numeric
sp.joint.tip.states<- cbind(node=rownames(sp.joint.tip.states),sp.joint.tip.states,row.names=NULL)
sp.joint.tip.states$node <- as.numeric(sp.joint.tip.states$node)
#Combine the node and tip state dataframes
sp.joint.all.states <- rbind(sp.joint.node.states,sp.joint.tip.states)
sp.joint.all.states$states <- as.character(sp.joint.all.states$states)

two.col=c("gray64","blue","gray64","blue")
gain.rates=c("red","blue","gray","blue")
p.lin <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.2) %<+% sp.joint.all.states + aes(color=states)+scale_color_manual(values=gain.rates)
p.lin
AncAbs.bestML.joint$AICc
AncAbs.bestML.joint$solution       
save.image("JM.Model.RData")
AncAbs.bestML.joint$AICc #413.3312 hmm
423.95

##Custom matrix for a three state trait
#forbid transitions from 0->2
#forbid transitions from 2->1
