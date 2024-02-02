library(corHMM)
library(stringr)
library(dplyr)
Tips <- c("Sp1","Sp2","Sp3","Sp4")
State <- c("Rhizobial","Actinorhizal","Non-nodulating","?")
Data <- cbind(Tips,State)
RateClassMat <- getRateCatMat(2)
RateCat1 <- getStateMat4Dat(Data)$rate.mat
RateCat2 <- getStateMat4Dat(Data)$rate.mat

#Make it a precursor model by removing gains of state 1 or state 2 in one rate cat (RateCat2)
RateCat2[4] <- 0
RateCat2[7] <- 0
#Now rate category 1 state 1 is the non-precursor from which neither 
#actinorhizal nor rhizobial nodulation can be gained
RateCat2
#Make it so that in both rate categories:
#only actinorhizal (state 2) can become rhizobial (state 3)
#1) state 3 can't become state 2
#2) state 1 can't become state 3
#For Ratecat1
RateCat1
#1 can't -> 3
RateCat1[7] <- 0
#3 can't -> 2
RateCat1[6] <- 0
RateCat1
#Same for RateCat2
RateCat2[6] <- 0
RateCat2[7] <- 0
RateCat2

StateMats <- list(RateCat1, RateCat2)
index.mat <- getFullMat(StateMats, RateClassMat)
tipstate_matrix <- read.csv("../../InputDataFiles/TipStates.csv",header=TRUE)
#Add the order data to the wells for changing "present" into two states
Labels_and_data <- read.csv("../../../Labels_and_data.v3.csv",header=FALSE)
Wells_and_family <- Labels_and_data[c(1,5)]
Wells_and_family$V1 <- str_replace(Wells_and_family$V1, "FMN_P118","P118")
Wells_and_family$V1 <- str_replace(Wells_and_family$V1, "FMN_P119","P119")
#P118 and P119 that does have FMN
FMN_P118 <- tipstate_matrix[grepl(pattern = "FMN_P118",tipstate_matrix$tip),] %>% select(tip)
P118 <- str_replace(FMN_P118$tip,"FMN_","")
FMN_P118 <- str_replace(FMN_P118$tip,"FMN_","FMN_")
FMN_P119 <- tipstate_matrix[grepl(pattern = "FMN_P119",tipstate_matrix$tip),] %>% select(tip)
P119 <- str_replace(FMN_P119$tip,"FMN_","")
FMN_P119 <- str_replace(FMN_P119$tip,"FMN_","FMN_")
#Add FMN back to the lists above in Wells_and_family$V1
for (i in 1:length(FMN_P118)){
Wells_and_family$V1 <- replace(Wells_and_family$V1, Wells_and_family$V1 == P118[i], FMN_P118[i])
}
for (i in 1:length(FMN_P119)){
  Wells_and_family$V1 <- replace(Wells_and_family$V1, Wells_and_family$V1 == P119[i], FMN_P119[i])
}

tipstates_and_family <- merge(Wells_and_family,tipstate_matrix,by.x="V1",by.y="tip",all.y=TRUE)

new.tipstate_matrix <- tipstates_and_family %>% mutate(newstates =
                     case_when(states == "Absent" ~ "Absent", 
                               states == "Present" & V5 =="Leguminosae" ~ "Rhizobial",
                               states == "Present" & V5 !="Leguminosae" ~ "Actinorhizal",
                               states == "?"  ~ "?")
)
#Get Parasponia wells
Parasponia_wells <- filter(Labels_and_data,grepl("^Parasponia",V7)) %>% select(V1)
Parasponia_wells
new.tipstate_matrix$newstates[new.tipstate_matrix$V1=="P119_WE06"]<-"Rhizobial"
new.tipstate_matrix$newstates[new.tipstate_matrix$V1=="KIB_P014_WG06"]<-"Rhizobial"
new.tipstate_matrix$newstates[new.tipstate_matrix$V1=="UFL_P01_WB02"]<-"Rhizobial"
new.tipstate_matrix$newstates[new.tipstate_matrix$V1=="UFL_P03_WG05"]<-"Rhizobial"

#Check what rows don't have newstates
new.tipstate_matrix[is.na(new.tipstate_matrix$newstates),]$V1

#Drop the wells that are missing newstates from the tree 
load("../../../v7.Backbone_astral003/corHMM/v7.joint.bestML.v2.edit.v2.RData")
tree <- v7.joint.bestML.edit.v2$phy
tree <- drop.tip(tree, new.tipstate_matrix[is.na(new.tipstate_matrix$newstates),]$V1, trim.internal = TRUE, subtree = FALSE,
         root.edge = 0, rooted = is.rooted(tree), collapse.singles = TRUE,
         interactive = FALSE)

tipstate_matrix <- new.tipstate_matrix %>% select(V1,newstates)
colnames(tipstate_matrix) <- c("tip","states")

ThreeStates <- corHMM(tree,tipstate_matrix,2,rate.mat=index.mat,
                     node.states="none",fixed.nodes=FALSE,p=NULL,root.p=NULL,
                     ip=c(0.13976213595921,0.0931973763699544,0.068115077028051,0.0678292287979275,0.0639861048664898),nstarts=0,n.cores=1,get.tip.states=FALSE,lewis.asc.bias=FALSE,
                     lower.bound = 1e-9,upper.bound = 100)
save.image("RData_100_Reps/ThreeStates.43.RData")
