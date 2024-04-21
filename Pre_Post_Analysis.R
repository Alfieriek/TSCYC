library(dplyr)
library(tidyr)
library(readxl)
library(tidyverse)
library(rstatix)

# Reading Datasets
Jan21_Data <- read.csv("Jan21_Scores.csv", header = T)
May21_Data <- read.csv("May21_Scores.csv", header = T)
Dec21_Data <- read.csv("Dec21_Scores.csv", header = T)
May22_Data <- read.csv("May22_Scores.csv", header = T)

str(Jan21_Data)

T_Scores_Col <- c(grep("_T$", names(Jan21_Data), value = TRUE))
Scales_name <- c("ResponseLevel", "AtypicalResponse", "Anxiety", "Depression", "Anger_Aggression",
            "Posttraumatic_Stress_Intrusion", "Posttraumatic_Stress_Avoidance", "Posttraumatic_Stress_Arousal",
            "Posttraumatic_Stress_Total","Dissociation", "SexualConcerns")

# T_Scores_Col <- c(colnames(Jan21_Data[,1:5]),grep("_T$", names(Jan21_Data), value = TRUE))



# This selects all columns that are not in T_Scores_Col
# Jan21_T_Scores <- Jan21_Data %>%
#   select(-any_of(T_Scores_Col))

Jan21_T_Scores <- Jan21_Data %>%
  select(any_of(T_Scores_Col))

colnames(Jan21_T_Scores) <- paste(colnames(Jan21_T_Scores), "Jan21", sep = "_")


May21_T_Scores <- May21_Data %>%
  select(any_of(T_Scores_Col))

colnames(May21_T_Scores) <- paste(colnames(May21_T_Scores), "May21", sep = "_")


Dec21_T_Scores <- Dec21_Data %>%
  select(any_of(T_Scores_Col))

colnames(Dec21_T_Scores) <- paste(colnames(Dec21_T_Scores), "Dec21", sep = "_")


May22_T_Scores <- May22_Data %>%
  select(any_of(T_Scores_Col))

colnames(May22_T_Scores) <- paste(colnames(May22_T_Scores), "May22", sep = "_")


Jan_May_21_long <- list()

for (i in c(1:11)) {
  Jan_May_21_long[[i]] <- cbind(Jan21_T_Scores,May21_T_Scores) %>% 
    select(contains(T_Scores_Col[i]))%>%
    gather(key = "Scale", value = "T_Score")
}

Jan_May_21_SignTest <- list()

for (i in c(1:11)) {
  Jan_May_21_SignTest[[i]] <- Jan_May_21_long[[i]] %>% wilcox_test (T_Score ~ Scale, paired = TRUE)

}

Jan_May_21_SignTest <- setNames(Jan_May_21_SignTest, Scales_name)


Dec_May_22_long <- list()

for (i in c(1:11)) {
  Dec_May_22_long[[i]] <- cbind(Dec21_T_Scores,May22_T_Scores) %>% 
    select(contains(T_Scores_Col[i]))%>%
    gather(key = "Scale", value = "T_Score")
}

Dec_May_22_SignTest <- list()

for (i in c(1:11)) {
  Dec_May_22_SignTest[[i]] <- Dec_May_22_long[[i]] %>% wilcox_test (T_Score ~ Scale, paired = TRUE)
  
}

Dec_May_22_SignTest <- setNames(Dec_May_22_SignTest, Scales_name)





