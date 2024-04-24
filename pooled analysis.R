library(dplyr)
library(tidyr)
library(readxl)
library(tidyverse)
library(rstatix)
library(car)

# Reading Datasets
Jan21_Data <- read.csv("Jan21_Scores.csv", header = T)
May21_Data <- read.csv("May21_Scores.csv", header = T)
Dec21_Data <- read.csv("Dec21_Scores.csv", header = T)
May22_Data <- read.csv("May22_Scores.csv", header = T)



Pre <- rbind(Jan21_Data,Dec21_Data)
Post <- rbind(May21_Data,May22_Data)


T_Scores_Col <- c(grep("_T$", names(Jan21_Data), value = TRUE))
Scales_name <- c("ResponseLevel", "AtypicalResponse", "Anxiety", "Depression", "Anger_Aggression",
                 "Posttraumatic_Stress_Intrusion", "Posttraumatic_Stress_Avoidance", "Posttraumatic_Stress_Arousal",
                 "Posttraumatic_Stress_Total","Dissociation", "SexualConcerns")

# T_Scores_Col <- c(colnames(Jan21_Data[,1:5]),grep("_T$", names(Jan21_Data), value = TRUE))



# This selects all columns that are not in T_Scores_Col
# Jan21_T_Scores <- Jan21_Data %>%
#   select(-any_of(T_Scores_Col))

Pre_T_Scores <- Pre %>%
  select(any_of(T_Scores_Col))

colnames(Pre_T_Scores) <- paste(colnames(Pre_T_Scores), "Pre", sep = "_")


Post_T_Scores <- Post %>%
  select(any_of(T_Scores_Col))

colnames(Post_T_Scores) <- paste(colnames(Post_T_Scores), "Post", sep = "_")



# Pre vs Post
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
Pre_Post_Scale <- list()

for (i in c(1:11)) {
  Pre_Post_Scale[[i]] <- cbind(Pre_T_Scores,Post_T_Scores) %>% 
    select(contains(T_Scores_Col[i]))
}

Pre_Post_Scale <- setNames(Pre_Post_Scale, Scales_name)



Pre_Post_Scale_SummaryStats <- list()

for (i in c(1:11)) {
  A <- Pre_Post_Scale[[i]]
  B <- Pre_Post_Scale[[i]]
  colnames(A) <- paste(colnames(A), "Mean", sep = "_")
  colnames(B) <- paste(colnames(B), "SD", sep = "_")
  MU <- A %>% apply(2,mean) 
  SD <- B %>% apply(2, sd)
  Pre_Post_Scale_SummaryStats[[i]] <- c(MU,SD)
}


Pre_Post_Scale_SummaryStats <- setNames(Pre_Post_Scale_SummaryStats, Scales_name)


#---------------------------------------------------------------------------------------


Pre_Post_Scale_long <- list()

for (i in c(1:11)) {
  Pre_Post_Scale_long[[i]] <- cbind(Pre_T_Scores,Post_T_Scores) %>% 
    select(contains(T_Scores_Col[i]))%>%
    gather(key = "Scale", value = "T_Score")
}

Pre_Post_Scale_long <- setNames(Pre_Post_Scale_long, Scales_name)
#---------------------------------t Test----------------------------------------------

Pre_Post_Scale_Shapirotest <-  list()

for (i in c(1:11)) {
  Pre_Post_Scale_Shapirotest[[i]] <- apply(Pre_Post_Scale[[i]],2,shapiro.test)
}



Pre_Post_Scale_Shapirotest <- setNames(Pre_Post_Scale_Shapirotest, Scales_name)

Pre_Post_Scale_Shapirotest


Pre_Post_Scale_Levenetest <-  list()

for (i in c(1:11)) {
  Q <- Pre_Post_Scale_long[[i]] %>% mutate(Scale = as.factor(Scale))
  Pre_Post_Scale_Levenetest[[i]] <- Q %>%  levene_test(T_Score ~ Scale)
}
#

Pre_Post_Scale_Levenetest <- setNames(Pre_Post_Scale_Levenetest, Scales_name)

Pre_Post_Scale_Levenetest


Pre_Post_Scale_TTest <- list()


for (i in c(1:11)) {
  Pre_Post_Scale_TTest[[i]] <-t.test(T_Score ~ Scale, data =  Pre_Post_Scale_long[[i]], paired = T)
  
}


Pre_Post_Scale_TTest <- setNames(Pre_Post_Scale_TTest, Scales_name)

Pre_Post_Scale_TTest
#---------------------------------------------------------------------------------------
#---------------------------------Sign Test----------------------------------------------



Pre_Post_Scale_SignTest <- list()


for (i in c(1:11)) {
  Pre_Post_Scale_SignTest[[i]] <- Pre_Post_Scale_long[[i]] %>% wilcox_test (T_Score ~ Scale, paired = TRUE)
  
}

Pre_Post_Scale_SignTest <- setNames(Pre_Post_Scale_SignTest, Scales_name)


#---------------------------------------------------------------------------------------
#--------------------------------- Cohen Test--------------------------------------------


Cohen_d_Results <- list()

for (i in c(1:11)) {
  Cohen_d_Results[[i]] <- Pre_Post_Scale_long[[i]] %>% cohens_d(T_Score ~ Scale, paired = TRUE)
}


Cohen_d_Results <- setNames(Cohen_d_Results, Scales_name)


Cohen_d_Results

























