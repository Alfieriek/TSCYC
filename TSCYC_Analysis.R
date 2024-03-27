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
May21_RL <- May21_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 
Dec21_RL <- Dec21_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 
May22_RL <- May22_data %>% select(c('TSCYC Q.3','TSCYC Q.14','TSCYC Q.22','TSCYC Q.53',
                                    'TSCYC Q.66','TSCYC Q.73','TSCYC Q.83','TSCYC Q.86',
                                    'TSCYC Q.89')) 

