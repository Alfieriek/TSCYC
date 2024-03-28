library(readxl)
library(dplyr)
library(tidyr)

# Raw Data

Jan21_data_R <- read_excel("TSCYC Master Data List.xlsx",sheet = 1) 
May21_data_R <- read_excel("TSCYC Master Data List.xlsx",sheet = 2) 
Dec21_data_R <- read_excel("TSCYC Master Data List.xlsx",sheet = 3) 
May22_data_R <- read_excel("TSCYC Master Data List.xlsx",sheet = 4) 


# Reading datasets and dropping rows with missing values

Jan21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 1) %>% drop_na()
May21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 2) %>% drop_na()
Dec21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 3) %>% drop_na()
May22_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 4) %>% drop_na()

May22_data <- May22_data %>%
  rename(Participant = Paricipant)
# Sub-Scales 

#_______________________________________________________________________________
## Response Level (RL) Scale Items
## Item 3,14,22,53,66,73,83,86,89

replace_non_ones <- function(row) {
  return(ifelse(row != 1, 0, row))
}



Jan21_RL <- Jan21_data %>% select(c('Participant','TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                 'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                 'TSCYC Q.89'))
Jan21_RL$Raw_Score <- apply(Jan21_RL[,-1], 2, replace_non_ones) %>% apply(1,sum)


May21_RL <- May21_data %>% select(c('Participant','TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89'))
May21_RL$Raw_Score <- apply(May21_RL[,-1], 2, replace_non_ones) %>% apply(1,sum)

Dec21_RL <- Dec21_data %>% select(c('Participant','TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89'))
Dec21_RL$Raw_Score <-  apply(Dec21_RL[,-1], 2, replace_non_ones) %>% apply(1,sum)

May22_RL <- May22_data %>% select(c('Participant','TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89'))
May22_RL$Raw_Score <- apply(May22_RL[,-1], 2, replace_non_ones) %>% apply(1,sum)

#_______________________________________________________________________________
## Atypical Response (ATR) Scale Items
## Item 9,30,37,40,51,60,64,77,79

Jan21_ATR <- Jan21_data %>% select(c('Participant','TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                    'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                    'TSCYC Q.79'))
Jan21_ATR$Raw_Score <- apply(Jan21_ATR[,-1],1,sum)


May21_ATR <- May21_data %>% select(c('Participant','TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
May21_ATR$Raw_Score <- apply(May21_ATR[,-1],1,sum)

Dec21_ATR <- Dec21_data %>% select(c('Participant','TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
Dec21_ATR$Raw_Score <- apply(Dec21_ATR[,-1],1,sum)

May22_ATR <- May22_data %>% select(c('Participant','TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
May22_ATR$Raw_Score <- apply(May22_ATR[,-1],1,sum)



#______________________________________________________________________________
## Anxiety (ANX) Scale Items
## Item 7,21,31,32,42,44,57,67,76

Jan21_ANX <- Jan21_data %>% select(c('Participant','TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                    'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                    'TSCYC Q.76'))
Jan21_ANX$Raw_Score <- apply(Jan21_ANX[,-1],1,sum)


May21_ANX <- May21_data %>% select(c('Participant','TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
May21_ANX$Raw_Score <- apply(May21_ANX[,-1],1,sum)

Dec21_ANX <- Dec21_data %>% select(c('Participant','TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
Dec21_ANX$Raw_Score <- apply(Dec21_ANX[,-1],1,sum)

May22_ANX <- May22_data %>% select(c('Participant','TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
May22_ANX$Raw_Score <- apply(May22_ANX[,-1],1,sum)


#______________________________________________________________________________
## Depression (DEP)
## Item 2,18,41,54,61,68,71,84,88

Jan21_DEP <- Jan21_data %>% select(c('Participant','TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
Jan21_DEP$Raw_Score <- apply(Jan21_DEP[,-1],1,sum)


May21_DEP <- May21_data %>% select(c('Participant','TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
May21_DEP$Raw_Score <- apply(May21_DEP[,-1],1,sum)

Dec21_DEP <- Dec21_data %>% select(c('Participant','TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
Dec21_DEP$Raw_Score <- apply(Dec21_DEP[,-1],1,sum)

May22_DEP <- May22_data %>% select(c('Participant','TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
May22_DEP$Raw_Score <- apply(May22_DEP[,-1],1,sum)



#______________________________________________________________________________
## Anger/Agression (ANG)
## Item 1,15,23,34,43,58,62,87,90

Jan21_ANG <- Jan21_data %>% select(c('Participant','TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
Jan21_ANG$Raw_Score <- apply(Jan21_ANG[,-1],1,sum)


May21_ANG <- May21_data %>% select(c('Participant','TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
May21_ANG$Raw_Score <- apply(May21_ANG[,-1],1,sum)

Dec21_ANG <- Dec21_data %>% select(c('Participant','TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
Dec21_ANG$Raw_Score <- apply(Dec21_ANG[,-1],1,sum)

May22_ANG <- May22_data %>% select(c('Participant','TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
May22_ANG$Raw_Score <- apply(May22_ANG[,-1],1,sum)




#_______________________________________________________________________________
## Post traumatic Stress-Intrusion (PTS-I)
## Item 4,11,19,24,27,36,63,69,80

Jan21_PTSI <- Jan21_data %>% select(c('Participant','TSCYC Q.4','TSCYC Q.11', 'TSCYC Q.19', 'TSCYC Q.24','TSCYC Q.27',
                                      'TSCYC Q.36','TSCYC Q.63','TSCYC Q.69','TSCYC Q.80'))

Jan21_PTSI$Raw_Score <- apply(Jan21_PTSI[,-1],1,sum)


May21_PTSI <- May21_data %>% select(c('Participant','TSCYC Q.4','TSCYC Q.11', 'TSCYC Q.19', 'TSCYC Q.24','TSCYC Q.27',
                                      'TSCYC Q.36','TSCYC Q.63','TSCYC Q.69','TSCYC Q.80'))

May21_PTSI$Raw_Score <- apply(May21_PTSI[,-1],1,sum)

Dec21_PTSI <- Dec21_data %>% select(c('Participant','TSCYC Q.4','TSCYC Q.11', 'TSCYC Q.19', 'TSCYC Q.24','TSCYC Q.27',
                                      'TSCYC Q.36','TSCYC Q.63','TSCYC Q.69','TSCYC Q.80'))

Dec21_PTSI$Raw_Score <- apply(Dec21_PTSI[,-1],1,sum)

May22_PTSI <- May22_data %>% select(c('Participant','TSCYC Q.4','TSCYC Q.11', 'TSCYC Q.19', 'TSCYC Q.24','TSCYC Q.27',
                                      'TSCYC Q.36','TSCYC Q.63','TSCYC Q.69','TSCYC Q.80'))

May22_PTSI$Raw_Score <- apply(May22_PTSI[,-1],1,sum)



#_______________________________________________________________________________
## Post traumatic Stress-Avoidance (PTS-AV)
## Item 8,13,29,39,49,55,70,72,81

Jan21_PTSAV <- Jan21_data %>% select(c('Participant','TSCYC Q.8','TSCYC Q.13', 'TSCYC Q.29', 'TSCYC Q.39','TSCYC Q.49',
                                       'TSCYC Q.55','TSCYC Q.70','TSCYC Q.72','TSCYC Q.81'))

Jan21_PTSAV$Raw_Score <- apply(Jan21_PTSAV[,-1],1,sum)


May21_PTSAV <- May21_data %>% select(c('Participant','TSCYC Q.8','TSCYC Q.13', 'TSCYC Q.29', 'TSCYC Q.39','TSCYC Q.49',
                                       'TSCYC Q.55','TSCYC Q.70','TSCYC Q.72','TSCYC Q.81'))

May21_PTSAV$Raw_Score <- apply(May21_PTSAV[,-1],1,sum)

Dec21_PTSAV <- Dec21_data %>% select(c('Participant','TSCYC Q.8','TSCYC Q.13', 'TSCYC Q.29', 'TSCYC Q.39','TSCYC Q.49',
                                       'TSCYC Q.55','TSCYC Q.70','TSCYC Q.72','TSCYC Q.81'))

Dec21_PTSAV$Raw_Score <- apply(Dec21_PTSAV[,-1],1,sum)

May22_PTSAV <- May22_data %>% select(c('Participant','TSCYC Q.8','TSCYC Q.13', 'TSCYC Q.29', 'TSCYC Q.39','TSCYC Q.49',
                                       'TSCYC Q.55','TSCYC Q.70','TSCYC Q.72','TSCYC Q.81'))
May22_PTSAV$Raw_Score <- apply(May22_PTSAV[,-1],1,sum)



#_______________________________________________________________________________
## Post traumatic Stress-Arousal (PTS-AR)
## Item 10, 17, 26, 45, 47, 48, 56, 74, 82, 

Jan21_PTSAR <- Jan21_data %>% select(c('Participant','TSCYC Q.10','TSCYC Q.17', 'TSCYC Q.26', 'TSCYC Q.45','TSCYC Q.47',
                                       'TSCYC Q.48','TSCYC Q.56','TSCYC Q.74','TSCYC Q.82'))

Jan21_PTSAR$Raw_Score <- apply(Jan21_PTSAR[,-1],1,sum)


May21_PTSAR <- May21_data %>% select(c('Participant','TSCYC Q.10','TSCYC Q.17', 'TSCYC Q.26', 'TSCYC Q.45','TSCYC Q.47',
                                       'TSCYC Q.48','TSCYC Q.56','TSCYC Q.74','TSCYC Q.82'))
May21_PTSAR$Raw_Score <- apply(May21_PTSAR[,-1],1,sum)

Dec21_PTSAR <- Dec21_data %>% select(c('Participant','TSCYC Q.10','TSCYC Q.17', 'TSCYC Q.26', 'TSCYC Q.45','TSCYC Q.47',
                                       'TSCYC Q.48','TSCYC Q.56','TSCYC Q.74','TSCYC Q.82'))
Dec21_PTSAR$Raw_Score <- apply(Dec21_PTSAR[,-1],1,sum)

May22_PTSAR <- May22_data %>% select(c('Participant','TSCYC Q.10','TSCYC Q.17', 'TSCYC Q.26', 'TSCYC Q.45','TSCYC Q.47',
                                       'TSCYC Q.48','TSCYC Q.56','TSCYC Q.74','TSCYC Q.82'))

May22_PTSAR$Raw_Score <- apply(May22_PTSAR[,-1],1,sum)


#______________________________________________________________________________
## Posttraumatic Stress-Total (PTS-TOT)
## This is the sum of PTS-I + PTS-AV + PTS-AR scales

 Jan21_PTS_TOT <- data.frame(PTS_I = Jan21_PTSI$Raw_Score,
                             PTS_AV = Jan21_PTSAV$Raw_Score,
                             PTS_AR = Jan21_PTSAR$Raw_Score)
 
 Jan21_PTS_TOT$PTSTotal <-  Jan21_PTS_TOT %>% apply(1,sum)
 Jan21_PTS_TOT$Participants <- Jan21_data$Participant
 
# May21
 
 May21_PTS_TOT <- data.frame(PTS_I = May21_PTSI$Raw_Score,
                             PTS_AV = May21_PTSAV$Raw_Score,
                             PTS_AR = May21_PTSAR$Raw_Score)
 
 May21_PTS_TOT$PTSTotal <-  May21_PTS_TOT %>% apply(1,sum)
 May21_PTS_TOT$Participants <- May21_data$Participant
 
 
# Dec21
 
 Dec21_PTS_TOT <- data.frame(PTS_I = Dec21_PTSI$Raw_Score,
                             PTS_AV = Dec21_PTSAV$Raw_Score,
                             PTS_AR = Dec21_PTSAR$Raw_Score)
 
 Dec21_PTS_TOT$PTSTotal <-  Dec21_PTS_TOT %>% apply(1,sum) 
 Dec21_PTS_TOT$Participants <- Dec21_data$Participant
 
 
# May22
 
 May22_PTS_TOT <- data.frame(PTS_I = May22_PTSI$Raw_Score,
                             PTS_AV = May22_PTSAV$Raw_Score,
                             PTS_AR = May22_PTSAR$Raw_Score)
 
 May22_PTS_TOT$PTSTotal <-  May22_PTS_TOT %>% apply(1,sum) 
 May22_PTS_TOT$Participants <- May22_data$Participant
 
 
#_______________________________________________________________________________
##Dissociation (DIS)
## Item 5, 25, 28, 33, 38, 46, 52, 78, 85

Jan21_DIS <- Jan21_data %>% select(c('Participant','TSCYC Q.5','TSCYC Q.25', 'TSCYC Q.28', 'TSCYC Q.33','TSCYC Q.38',
                                     'TSCYC Q.46','TSCYC Q.52','TSCYC Q.78','TSCYC Q.85'))

Jan21_DIS$Raw_Score <- apply(Jan21_DIS[,-1],1,sum)


May21_DIS <- May21_data %>% select(c('Participant','TSCYC Q.5','TSCYC Q.25', 'TSCYC Q.28', 'TSCYC Q.33','TSCYC Q.38',
                                     'TSCYC Q.46','TSCYC Q.52','TSCYC Q.78','TSCYC Q.85'))

May21_DIS$Raw_Score <- apply(May21_DIS[,-1],1,sum)

Dec21_DIS <- Dec21_data %>% select(c('Participant','TSCYC Q.5','TSCYC Q.25', 'TSCYC Q.28', 'TSCYC Q.33','TSCYC Q.38',
                                     'TSCYC Q.46','TSCYC Q.52','TSCYC Q.78','TSCYC Q.85'))

Dec21_DIS$Raw_Score <- apply(Dec21_DIS[,-1],1,sum)

May22_DIS <- May22_data %>% select(c('Participant','TSCYC Q.5','TSCYC Q.25', 'TSCYC Q.28', 'TSCYC Q.33','TSCYC Q.38',
                                     'TSCYC Q.46','TSCYC Q.52','TSCYC Q.78','TSCYC Q.85'))
May22_DIS$Raw_Score <- apply(May22_DIS[,-1],1,sum)


#_______________________________________________________________________________
##Sexual Concerns (SC)
## Item 6, 12, 16, 20, 35, 50, 59, 65, 75

Jan21_SC <- Jan21_data %>% select(c('Participant','TSCYC Q.6','TSCYC Q.12', 'TSCYC Q.16', 'TSCYC Q.20','TSCYC Q.35',
                                    'TSCYC Q.50','TSCYC Q.59','TSCYC Q.65','TSCYC Q.75'))

Jan21_SC$Raw_Score <- apply(Jan21_SC[,-1],1,sum)


May21_SC <- May21_data %>% select(c('Participant','TSCYC Q.6','TSCYC Q.12', 'TSCYC Q.16', 'TSCYC Q.20','TSCYC Q.35',
                                    'TSCYC Q.50','TSCYC Q.59','TSCYC Q.65','TSCYC Q.75'))

May21_SC$Raw_Score <- apply(May21_SC[,-1],1,sum)

Dec21_SC <- Dec21_data %>% select(c('Participant','TSCYC Q.6','TSCYC Q.12', 'TSCYC Q.16', 'TSCYC Q.20','TSCYC Q.35',
                                    'TSCYC Q.50','TSCYC Q.59','TSCYC Q.65','TSCYC Q.75'))

Dec21_SC$Raw_Score <- apply(Dec21_SC[,-1],1,sum)

May22_SC <- May22_data %>% select(c('Participant','TSCYC Q.6','TSCYC Q.12', 'TSCYC Q.16', 'TSCYC Q.20','TSCYC Q.35',
                                    'TSCYC Q.50','TSCYC Q.59','TSCYC Q.65','TSCYC Q.75'))

May22_SC$Raw_Score <- apply(May22_SC[,-1],1,sum)




#_______________________________________________________________________________
# Putting Raw Scores Together
#_______________________________________________________________________________


Jan21_TSCYC_Scoring <- data.frame()
















































