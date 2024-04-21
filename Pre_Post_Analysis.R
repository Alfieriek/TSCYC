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

