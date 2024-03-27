library(readxl)
library(dplyr)
library(tidyr)

Raw_Jan21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 1)
Raw_May21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 2)
Raw_Dec21_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 3)
Raw_May22_data <- read_excel("TSCYC Master Data List.xlsx",sheet = 4)


# Dropping rows with missing values

Jan21_data <- Raw_Jan21_data %>% drop_na()
May21_data <- Raw_May21_data %>% drop_na()
Dec21_data <- Raw_Dec21_data %>% drop_na()
May22_data <- Raw_May22_data %>% drop_na()

# Sub-Scales 

## Response Level (RL) Scale Items
## Item 3,14,22,53,66,73,83,86,89

Jan21_RL <- Jan21_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                 'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                 'TSCYC Q.89'))
Jan21_RL$Raw_Score <- apply(Jan21_RL,1,sum)


May21_RL <- May21_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 
May21_RL$Raw_Score <- apply(May21_RL,1,sum)

Dec21_RL <- Dec21_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 
Dec21_RL$Raw_Score <- apply(Dec21_RL,1,sum)

May22_RL <- May22_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 
May22_RL$Raw_Score <- apply(May22_RL,1,sum)

## Atypical Response (ATR) Scale Items
## Item 9,30,37,40,51,60,64,77,79

Jan21_ATR <- Jan21_data %>% select(c('TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                    'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                    'TSCYC Q.79'))
Jan21_ATR$Raw_Score <- apply(Jan21_ATR,1,sum)


May21_ATR <- May21_data %>% select(c('TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
May21_ATR$Raw_Score <- apply(May21_ATR,1,sum)

Dec21_ATR <- Dec21_data %>% select(c('TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
Dec21_ATR$Raw_Score <- apply(Dec21_ATR,1,sum)

May22_ATR <- May22_data %>% select(c('TSCYC Q.9','TSCYC Q.30','TSCYC Q.37','TSCYC Q.40',
                                     'TSCYC Q.51','TSCYC Q.60','TSCYC Q.64','TSCYC Q.77',
                                     'TSCYC Q.79'))
May22_ATR$Raw_Score <- apply(May22_ATR,1,sum)



#______________________________________________________________________________
## Anxiety (ANX) Scale Items
## Item 7,21,31,32,42,44,57,67,76

Jan21_ANX <- Jan21_data %>% select(c('TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                    'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                    'TSCYC Q.76'))
Jan21_ANX$Raw_Score <- apply(Jan21_ANX,1,sum)


May21_ANX <- May21_data %>% select(c('TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
May21_ANX$Raw_Score <- apply(May21_ANX,1,sum)

Dec21_ANX <- Dec21_data %>% select(c('TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
Dec21_ANX$Raw_Score <- apply(Dec21_ANX,1,sum)

May22_ANX <- May22_data %>% select(c('TSCYC Q.7','TSCYC Q.21','TSCYC Q.31','TSCYC Q.32',
                                     'TSCYC Q.42','TSCYC Q.44','TSCYC Q.57','TSCYC Q.67',
                                     'TSCYC Q.76'))
May22_ANX$Raw_Score <- apply(May22_ANX,1,sum)


#______________________________________________________________________________
## Depression (DEP)
## Item 2,18,41,54,61,68,71,84,88

Jan21_DEP <- Jan21_data %>% select(c('TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
Jan21_DEP$Raw_Score <- apply(Jan21_DEP,1,sum)


May21_DEP <- May21_data %>% select(c('TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
May21_DEP$Raw_Score <- apply(May21_DEP,1,sum)

Dec21_DEP <- Dec21_data %>% select(c('TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
Dec21_DEP$Raw_Score <- apply(Dec21_DEP,1,sum)

May22_DEP <- May22_data %>% select(c('TSCYC Q.2','TSCYC Q.18','TSCYC Q.41','TSCYC Q.54',
                                     'TSCYC Q.61','TSCYC Q.68','TSCYC Q.71','TSCYC Q.84',
                                     'TSCYC Q.88'))
May22_DEP$Raw_Score <- apply(May22_DEP,1,sum)



#______________________________________________________________________________
## Anger/Agression (ANG)
## Item 1,15,23,34,43,58,62,87,90

Jan21_ANG <- Jan21_data %>% select(c('TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
Jan21_ANG$Raw_Score <- apply(Jan21_ANG,1,sum)


May21_ANG <- May21_data %>% select(c('TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
May21_ANG$Raw_Score <- apply(May21_ANG,1,sum)

Dec21_ANG <- Dec21_data %>% select(c('TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
Dec21_ANG$Raw_Score <- apply(Dec21_ANG,1,sum)

May22_ANG <- May22_data %>% select(c('TSCYC Q.1','TSCYC Q.15','TSCYC Q.23','TSCYC Q.34',
                                     'TSCYC Q.43','TSCYC Q.58','TSCYC Q.62','TSCYC Q.87',
                                     'TSCYC Q.90'))
May22_ANG$Raw_Score <- apply(May22_ANG,1,sum)

















































