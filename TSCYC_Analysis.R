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




