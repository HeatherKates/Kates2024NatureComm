load("v7.Backbone_astral003/Compare_Ancestors/CompareAncestors.RData")
plot
ggplot(summary_df, aes(`(2,R1) -> (1,R1)`, `(1,R1) -> (2,R1)`, z=logLik)) + geom_contour_filled() + geom_point(shape=21, size=5, aes(x=summary_df[which.max(summary_df$logLik),]$`(2,R1) -> (1,R1)`, y=summary_df[which.max(summary_df$logLik),]$`(1,R1) -> (2,R1)`)) + geom_point(aes(colour = factor(Recon))) + geom_abline(intercept = 0, slope=1)
summary_df$logLik
plot
ggsave("Extended_Data_Fig_8.jpg",dpi=300,width=7,height=6)
