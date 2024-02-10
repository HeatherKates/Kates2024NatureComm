library(corHMM)
library(phangorn)
# assumption of input object names
tree=read.tree("../corHMM/Nitfix.tree.v7.tree")
tipstate_matrix=read.csv("../corHMM/Nitfix.statedata.v6.csv",header=TRUE)
#load("CompareAncestors.RData")

best_model <- corHMM(tree, tipstate_matrix, rate.cat=1, root.p=c(1,0)) # in case it has to be run

# find the focal ancestral node, the one that's the MRCA of all "Present" tips
nodtips <- unique(match(tipstate_matrix[which(tipstate_matrix$states=="Present"),]$tip, tree$tip.label))
nodtips <- nodtips[!is.na(nodtips)]
focal_node <- phangorn::mrca.phylo(tree, nodtips)
focal_row <- which(tree$edge[,2]==focal_node)

# now get an even distribution of possible rates that includes the MLE for the gain and loss rates
logrates <- log(corHMM:::MatrixToPars(best_model))
raw_params <- seq(from=min(logrates), to=max(logrates), length.out=5)
diffvals <- c(1,2)*median(diff(raw_params))
raw_params <- unique(sort(c(raw_params, diffvals+max(raw_params), -diffvals+min(raw_params))))
parameters <- expand.grid(loss=exp(raw_params), gain=exp(raw_params))
colnames(parameters) <- names(corHMM:::MatrixToPars(best_model))

# place to store outputs
corHMM_recons <- list()
summary_df <- parameters
summary_df$logLik <- NA
summary_df$proportion_1_at_focal <- NA
summary_df$proportion_2_at_focal <- NA

# a loop that could be done in parallel more intelligently
for (i in sequence(nrow(parameters))) {
  summary_df$logLik[i] <- try(corHMM:::compute_neglnlikelihood(unlist(parameters[i,]), best_model))
  corHMM_recons[[i]] <- try(corHMM::ancRECON(phy=tree, data=tipstate_matrix, p=unname(unlist(parameters[i,])), rate.mat=best_model$index.mat, method="marginal", rate.cat=1, root.p=c(1,0), get.likelihood=FALSE))
  try({
    summary_df$proportion_1_at_focal[i] <- corHMM_recons[[i]]$lik.anc.states[focal_row,1]
    summary_df$proportion_2_at_focal[i] <- corHMM_recons[[i]]$lik.anc.states[focal_row,2]
  })
  print(summary_df[i,])
}

summary_df$Recon <- "Non-nodulating"
summary_df$Recon[summary_df$proportion_1_at_focal<summary_df$proportion_2_at_focal] <- "Nodulating"
#summary_df$Recon[summary_df$proportion_1_at_focal<(1e9)*summary_df$proportion_2_at_focal] <- "Nodulating" # extreme just to see how would look if we had different results


library(ggplot2)
plot=ggplot(summary_df, aes(`(2,R1) -> (1,R1)`, `(1,R1) -> (2,R1)`, z=logLik)) + geom_contour_filled() + geom_point(shape=21, size=5, aes(x=summary_df[which.max(summary_df$logLik),]$`(2,R1) -> (1,R1)`, y=summary_df[which.max(summary_df$logLik),]$`(1,R1) -> (2,R1)`)) + geom_point(aes(colour = factor(Recon))) + geom_abline(intercept = 0, slope=1)
save.image("CompareAncestors.RData")
