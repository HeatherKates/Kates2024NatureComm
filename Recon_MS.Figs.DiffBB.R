library(corHMM)
library(phytools)
library(ggtree)
library(ggtreeExtra)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(scales)
library(RateViz)
library(treeio)

#Loading and formatting data
#################Species tree##################
##LOAD DATA##
load("v7.Backbone_astral003/Different_Backbone/corHMM/edit.DiffBB.joint.bestML.RData")
sp.taxtree=read.tree("v7.Backbone_astral003/Different_Backbone/corHMM/DiffBB.v7.Nitfix.taxtree.tree")
#Node states
sp.joint.node.states <- as.data.frame(edit.DiffBB.joint.bestML$states)
colnames(sp.joint.node.states) <- "states"
#Make the row name a column called node and make it numeric
sp.joint.node.states<- cbind(node=rownames(sp.joint.node.states),sp.joint.node.states,row.names=NULL)
sp.joint.node.states$node <- as.numeric(sp.joint.node.states$node)
#Add number of tips to the node.state data because of how ggplot codes the tips
sp.joint.node.states$node <- sp.joint.node.states[, 1] + length(edit.DiffBB.joint.bestML$phy$tip.label)
#Tip states
sp.joint.tip.states <- as.data.frame(edit.DiffBB.joint.bestML$tip.states)
colnames(sp.joint.tip.states) <- "states"
#Make the row name a column called node and make it numeric
sp.joint.tip.states<- cbind(node=rownames(sp.joint.tip.states),sp.joint.tip.states,row.names=NULL)
sp.joint.tip.states$node <- as.numeric(sp.joint.tip.states$node)
#Combine the node and tip state dataframes
sp.joint.all.states <- rbind(sp.joint.node.states,sp.joint.tip.states)
sp.joint.all.states$states <- as.character(sp.joint.all.states$states)

#MRCAs
###Create MRCA's for subsetting and labeling
sp.labels<- ggtree(sp.taxtree)
N.MRCA=MRCA(sp.labels,c("Hullettia_griffithiana","Bauhinia_tessmannii"))
Rosales.MRCA=MRCA(sp.labels,c("Cydonia_oblonga", "Hullettia_griffithiana"))
Fagales.MRCA=MRCA(sp.labels,c("Quercus_jolonensis", "Engelhardtia_unijuga"))
Cucurbitales.MRCA=MRCA(sp.labels,c("Datisca_glomerata","Corynocarpus_laevigatus"))
Caes.MRCA=MRCA(sp.labels,c("Arcoa_gonavensis", "Tachigali_densiflora"))
Pap.MRCA=MRCA(sp.labels,c("Angylocalyx_talbotii", "Cicer_tragacanthoides"))
COM.MRCA=MRCA(sp.labels,c("Oxalidaceae_Averrhoa_carambola","Malpighiaceae_Pterandra_arborea"))
MALV.MRCA=MRCA(sp.labels,c("Brassicaceae_Moriera_spinosa","Guamatelaceae_Guamatela_tuerckheimii"))
MYRT.MRCA=MRCA(sp.labels,c("Myrtaceae_Heteropyxis_natalensis","Combretaceae_Strephonema_mannii"))
GERAN.MRCA=MRCA(sp.labels,c("Geraniaceae_Hypseocharis_pimpinellifolia","Francoaceae_Viviania_ovata"))
VIT.MRCA=MRCA(sp.labels,c("Vitaceae_Leea_asiatica","Vitaceae_Tetrastigma_dubium"))
ZYG.MRCA=MRCA(sp.labels,c("Zygophyllaceae_Tribulus_cistoides","Zygophyllaceae_Guaiacum_officinale"))
#
#Get MRCA for Dialioideae
Dial.MRCA=MRCA(sp.labels,c("Mendoravia_dumaziana","Poeppigia_procera"))
#Get MRCA for Detarioideae
Det.MRCA=MRCA(sp.labels,c("FMN_P067_WC10","Brachystegia_floribunda"))
#Get MRCA for Cercidoideae
Cerc.MRCA=MRCA(sp.labels,c("Cercis_siliquastrum", "Bauhinia_tessmannii"))
#Get MRCA for Polygalaceae
Poly.MRCA=MRCA(sp.labels,c("Xanthophyllum_vitellinum", "Polygala_harleyi"))
#Get MRCA for Surianaceae
Sur.MRCA=MRCA(sp.labels,c("Recchia_mexicana","Suriana_maritima"))
#Get MRCA for Quillajaceae
Quil.MRCA=MRCA(sp.labels,c("Quillaja_brasiliensis","Quillaja_saponaria"))

##COLORS##
#To highlighting rates
##COLORS##
#To highlight rates
#v8 
gain.rates=c("gray64","blue","red","blue","darkorange1","blue")
#loss.rates=c("gray64","orange","gray64","red","gray64","blue")
#label colors
my_colors <- RColorBrewer::brewer.pal(9, "Paired")
show_col(my_colors)

#Basic trees
##Linear tree with no tip labels and skinny branches
p.lin.base=ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.2) %<+% sp.joint.all.states + aes(color=states)
p.lin.base+scale_color_manual(values=gain.rates)
p.lin.zoom <- p.lin.base+geom_tiplab(size=2)+scale_colour_manual(values=three.cols)
p.lin.zoom1 <- p.lin.base+geom_tiplab(size=0.5)+scale_colour_manual(values=three.cols)

##Circle tree with no tip labels and skinny branches
p.circ.base <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.2,layout="circular") %<+% sp.joint.all.states + aes(color=states)
p.circ.zoom <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=1,layout="circular") %<+% sp.joint.all.states + aes(color=states)+geom_tiplab(size=2)

###FIGURE:Circle tree. Rosids with non nit-fix collapsed, two colors ###
#Add color to whole tree or nitfix clade
p.circ.col=p.circ.base+scale_colour_manual(values=gain.rates)

#Collapsing Rosid clades
#Rescaling clades
Rosid.scaled=scaleClade(p.circ.col, N.MRCA, 1.25)%>% scaleClade(COM.MRCA,0.05)%>% scaleClade(MALV.MRCA,0.05)%>%
  scaleClade(MYRT.MRCA,0.1)%>% scaleClade(GERAN.MRCA,0.1)%>%
  scaleClade(ZYG.MRCA,0.1)%>% scaleClade(VIT.MRCA,0.1)
Rosid.scaled+geom_cladelabel(node=Poly.MRCA,label="",offset=0.5,barsize=2,color=my_colors[1])+
  geom_cladelabel(node=Rosales.MRCA,label="",offset=0.5,barsize=2,color=my_colors[2])+
  geom_cladelabel(node=Fagales.MRCA,label="",offset=0.5,barsize=2,color=my_colors[3])+
  geom_cladelabel(node=Cucurbitales.MRCA,label="",offset=0.5,barsize=2,color=my_colors[4])+
  geom_cladelabel(node=Caes.MRCA,label="",offset=0.5,barsize=2,color=my_colors[5])+
  geom_cladelabel(node=Pap.MRCA,label="",offset=0.5,barsize=2,color=my_colors[6])+
  geom_cladelabel(node=Cerc.MRCA,label="",offset=0.5,barsize=2,color=my_colors[7])+
  geom_cladelabel(node=Det.MRCA,label="",offset=0.5,barsize=2,color=my_colors[8])+
  geom_cladelabel(node=Dial.MRCA,label="",offset=0.5,barsize=2,color=my_colors[9])
ggsave("Figure_S21.draft.jpeg",dpi=300,height = 6.74,width = 5.14)

##Checks (not figures)###
viewClade(p.lin.zoom,Rosales.MRCA)
###FIGURES A-C Gain Rates in Fagales and Cucurbitales and Cannabaceae
##Fagales##
p.Fagales=scaleClade(p.deep.cols, Fagales.MRCA, 88)%>%scaleClade(Caes.MRCA,0.001)+geom_cladelab(Fagales.MRCA,label="Fagales",vjust=1)
p.Fagales
p.F.1=collapse(p.Fagales,Pap.MRCA)
p.F.1
ggsave("ExtendedData.Fig5.tiff")
#Label Casuarinaceae
cas.MRCA=MRCA(sp.labels,c("Allocasuarinadecaisneana",	"Gymnostomaaustralianum"))
p.F.1+geom_cladelab(cas.MRCA,label="Casuarinaceae",offset = 1.5,offset.text=1.5,barsize=0.5,fontsize = 3,color="blue")
ggsave("Example.Fagales.pdf")
###Cucurbitales##
p.Cucurbitales=scaleClade(p.deep.cols, Cucurbitales.MRCA, 80)%>%scaleClade(Caes.MRCA,0.05)+geom_cladelab(Cucurbitales.MRCA,label="Cucurbitales",vjust=1)
p.Cucurbitales
p.Cu.1=collapse(p.Cucurbitales,Pap.MRCA)
p.Cu.1
#Needs more collapsing or more scaling
#Label Datisca and Coriaria
Datisca.MRCA=MRCA(sp.labels,c("Datiscacannabina",	"Datiscaglomerata"))
Coriaria.MRCA=MRCA(sp.labels,c("Coriariamyrtifolia",	"Coriariasarmentosa"))
p.Cu.1+geom_cladelab(Datisca.MRCA,label="Datiscaceae",offset = 1.5,offset.text=1.5,barsize=0.5,fontsize = 3,color="blue",vjust=0)+
  geom_cladelab(Coriaria.MRCA,label="Coriariaceae",offset = 1.5,offset.text=1.5,barsize=0.5,fontsize = 3,color="blue")
ggsave("ExtendedData.Fig7.tiff")


#Parasponia
Cannabaceae.MRCA=MRCA(sp.labels,c("Aphananthemonoica","Cannabissativa"))
p.Cannabaceae=scaleClade(p.deep.cols, Cannabaceae.MRCA, 200)%>%scaleClade(Caes.MRCA,0.05)+geom_cladelab(Cannabaceae.MRCA,label="Cannabaceae",vjust=1)
p.Cannabaceae
p.Can=collapse(p.Cannabaceae,Pap.MRCA)
p.Can
#Label Parasponia
Parasponia.MRCA=MRCA(sp.labels,c("Parasponiarigida","Parasponiarugosa"))
p.Can+geom_cladelab(Parasponia.MRCA,label="Parasponia",offset = 1.5,offset.text=1.5,barsize=0.5,fontsize = 3,color="blue",hjust=0)
ggsave("Example.Cannabaceae.pdf")

###Identify gains



#Not edited below here
##FIGURE: Circle tree. Rosids with non nit-fix collapsed, loss gains

#Subclades
##The whole linear tree
forsubs <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.3) %<+% sp.joint.all.states + aes(color=states)+geom_tiplab(size=2)
forsubs.smalltxt <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.3) %<+% sp.joint.all.states + aes(color=states)+geom_tiplab(size=0.5)
forsubs.notax <- ggtree(v6.joint.bestML$phy,ladderize=TRUE,continuous="none",size=.3) %<+% sp.joint.all.states + aes(color=states)+geom_tiplab(size=2)
p.lin.nolabels <- ggtree(sp.taxtree,ladderize=TRUE,continuous="none",size=.2) %<+% sp.joint.all.states + aes(color=states)
temp.nodenums=forsubs+scale_colour_manual(values=joint.gain.cols)+geom_text(aes(label=node))
temp=forsubs+scale_colour_manual(values=joint.gain.cols)
losscols=forsubs+scale_colour_manual(values=joint.loss.col)
p.lossspeed=forsubs+scale_colour_manual(values=joint.loss.speed)
p.loss.nodenums=forsubs+scale_colour_manual(values=joint.loss.speed)+geom_text(aes(label=node))
p.lossspeed



##Circle trees
#Rosid gains with nitfix labeled 
main=p.lin.nolabels+scale_colour_manual(values=joint.gain.cols.v2)
main.NFC.lab=p.lin.nolabels+scale_colour_manual(values=joint.gain.cols.v2)+geom_cladelabel(node=N.MRCA,label="Nitrogen-fixing clade",offset = 1,offset.text=5, angle=0,barsize=2,fontsize = 3,color="black")
forsubs.gain=forsubs+scale_colour_manual(values=joint.gain.cols.v2)
ggsave(height = 10,width=6,filename="UZH_seminar/Fig.Rosid.circle.gainrates.tiff",dpi=300)

#Nitfix two states with subclades labeled
p.lin.gaincols=p.lin+scale_colour_manual(values=marg.gain.cols.v2)
p.gaincol=p.lin.nolabels+scale_colour_manual(values=joint.gain.cols)

Nitfix=viewClade(p.gaincol, MRCA(sp.taxtree,c("Hullettiagriffithiana","Bauhiniatessmannii")))
Nitfix.labeled=Nitfix+
  geom_cladelabel(node=Rosales.MRCA, label="Rosales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[1])+
  geom_cladelabel(node=Cucurbitales.MRCA, label="Cucurbitales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[2])+
  geom_cladelabel(node=Fagales.MRCA, label="Fagales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[3])+
  geom_cladelabel(node=Pap.MRCA, label="Papilionioideae",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[4])+
  geom_cladelabel(node=Caes.MRCA, label="Caesalpinioideae",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[5])
Nitfix.labeled
ggsave(height = 6,width=6,filename="DraftFig.Nitfix.Precursor.cladeslabeled.pdf",dpi=300)

#Papilionioideae
#Collapse core papilionids to view first-branching losses
joint.Pap=viewClade(p.lin.zoom1, MRCA(sp.taxtree,c("Angylocalyx_talbotii", "Cicer_tragacanthoides")))
joint.Pap.scaled.2 <- scaleClade(joint.Pap, MRCA(sp.taxtree,c("Nissolia_platycalyx","Astragalus_maximowiczii")), .01) 
joint.Pap.scaled.collapsed.2 <- collapse(joint.Pap.scaled.2,MRCA(sp.taxtree,c("Nissolia_platycalyx","Astragalus_maximowiczii")),'max',fill="cyan")
joint.Pap.scaled.collapsed.2
ggsave(height = 6,width=6,filename="v4/joint.Check.Papil.pdf",dpi=300)

#Caesalpinioideae
#Collapse core mimosoids to view first-branching losses
Caes=viewClade(p.lin.zoom, MRCA(sp.taxtree,c("Arcoa_gonavensis", "Tachigali_densiflora")))
Caes.scaled <- scaleClade(Caes, MRCA(sp.taxtree,c("Acacia_reniformis","Calliandropsis_nervosus")), .01) 
Caes.scaled.collapsed <- collapse(Caes.scaled,MRCA(sp.taxtree,c("Acacia_reniformis","Calliandropsis_nervosus")),'max',fill="cyan")
#Collapse Caesalpinia
Caes.scaled2 <- scaleClade(Caes.scaled, MRCA(sp.taxtree,c("Caesalpinia_angulata","Caesalpinia_ferrea")), .01) 
Caes.scaled.collapsed2 <- collapse(Caes.scaled2,MRCA(sp.taxtree,c("Caesalpinia_angulata","Caesalpinia_ferrea")),'max',fill="cyan")

Caes.scaled.collapsed2
ggsave(height = 10,width=6,filename="joint.Check.Caesal.pdf",dpi=300)

#Fagales
Fag=viewClade(forsubs.gain,MRCA(sp.taxtree,c("Quercusjolonensis", "Engelhardtiaunijuga")))
Fag.scaled <- scaleClade(Fag, MRCA(sp.taxtree,c("Quercusjolonensis","Fagussylvatica")), .01) 
Fag.scaled.collapsed <- collapse(Fag.scaled,MRCA(sp.taxtree,c("Quercusjolonensis","Fagussylvatica")),'max',fill="cyan")
Fag.scaled.collapsed
ggsave(height = 10,width=6,filename="Fagales.pdf",dpi=300)

#Cucurbitales
Cuc=viewClade(forsubs.gain,MRCA(sp.taxtree,c("Datiscaglomerata","Corynocarpuslaevigatus")))
Cuc
ggsave(height = 10,width=6,filename="Cucurbitales.pdf",dpi=300)

#Rosales
Rosales=viewClade(forsubs.gain, MRCA(sp.taxtree, c("Cydoniaoblonga", "Hullettiagriffithiana")))
Ros.scaled <- scaleClade(Rosales, MRCA(sp.taxtree,c("Alchemillasibbaldiaefolia","Rubusgeoides")), .01) %>% scaleClade(MRCA(sp.taxtree,c("Pouroumavillosa","Ficuslasiocarpa")), .01)
Ros.collapsed=collapse(Ros.scaled,MRCA(sp.taxtree,c("Pouroumavillosa","Ficuslasiocarpa")),'max',fill="darkgreen")
Ros.collapsed2=collapse(Ros.collapsed,MRCA(sp.taxtree,c("Alchemillasibbaldiaefolia","Rubusgeoides")),'max',fill="darkgreen")
Ros.collapsed2
#Cannabaceae
Cannabaceae=viewClade(forsubs.gain,MRCA(sp.taxtree,c("Cannabissativa","Parasponiarugosa")))
Cannabaceae

#Looking at loss rates
joint.loss.cols.v2=c("gray64","red","gray64","orange","gray64","purple")
p.loss=p.lin.nolabels+scale_colour_manual(values=joint.loss.cols.v2)
Nitfix.loss=viewClade(p.loss, MRCA(sp.taxtree,c("Hullettiagriffithiana","Bauhiniatessmannii")))
Nitfix.loss.labeled=Nitfix.loss+
  geom_cladelabel(node=Rosales.MRCA, label="Rosales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[1])+
  geom_cladelabel(node=Cucurbitales.MRCA, label="Cucurbitales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[2])+
  geom_cladelabel(node=Fagales.MRCA, label="Fagales",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[3])+
  geom_cladelabel(node=Pap.MRCA, label="Papilionioideae",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[4])+
  geom_cladelabel(node=Caes.MRCA, label="Caesalpinioideae",offset = 0.1,offset.text=0.5, angle=0,barsize=0.5,fontsize = 3,color=col.2[5])
Nitfix.loss.labeled
#Look at mimosoids
viewClade(p.loss, MRCA(sp.taxtree,c("Acaciareniformis","Calliandropsisnervosus")))
#Caesalpinioideae
#Collapse core mimosoids to view first-branching losses
#tips
p.loss.tips=p.loss+geom_tiplab(size=0.5)
Caes.fb=viewClade(p.loss.tips, MRCA(sp.taxtree,c("Arcoagonavensis", "Tachigalidensiflora")))
Caes.fb.scaled <- scaleClade(Caes.fb, MRCA(sp.taxtree,c("Acaciareniformis","Calliandropsisnervosus")), .01) 
Caes.fb.scaled.collapsed <- collapse(Caes.fb.scaled,MRCA(sp.taxtree,c("Acaciareniformis","Calliandropsisnervosus")),'max',fill="cyan")
Caes.fb.scaled.collapsed
#Collapse Caesalpinia
Caes.fb.scaled2 <- scaleClade(Caes.fb.scaled, MRCA(sp.taxtree,c("Caesalpiniaangulata","Caesalpiniaferrea")), .01) 
Caes.fb.scaled.collapsed2 <- collapse(Caes.fb.scaled2,MRCA(sp.taxtree,c("Caesalpiniaangulata","Caesalpiniaferrea")),'max',fill="cyan")
Caes.fb.scaled.collapsed2
ggsave(height = 10,width=6,filename="Check.fast.loss.pdf",dpi=300)
#Checks
p.loss.bigtips=p.loss+geom_tiplab(size=2)
viewClade(p.loss.bigtips, MRCA(sp.taxtree,c("Arcoagonavensis", "Poeppigiaprocera")))
ggsave(height = 10,width=6,filename="Check.1.pdf",dpi=300)


##FIGURE 2: Transition network
minned.solution=v7.joint.bestML$solution
#For the slower rate category, find and use the lowest number that will show up in the network.
minned.solution[c(5,12,17,24)]=0.5
svg(width=5, height=5)
RateViz::PlotTransitionNetwork(minned.solution)
dev.off()
