library(dplyr)
library(tidyr)
library(readxl)
library(tidyverse)


Jan21_RS <- read_excel("TSCYC_clean.3.29.xlsx",sheet = 1)
# May21_RS <- read_excel("TSCYC_clean.3.29.xlsx",sheet = 2) 
# Dec21_RS <- read_excel("TSCYC_clean.3.29.xlsx",sheet = 3) 
# May22_RS <- read_excel("TSCYC_clean.3.29.xlsx",sheet = 4) 

Jan21_M_RS <- Jan21_RS %>% filter(Gender == 'M')


#_________________________________________________________1

########################### RL #########################
Male_Rl_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 1)

A <- Jan21_M_RS %>% select(ID,Jan21_RL_RawScore) %>% rename(Raw_Score = Jan21_RL_RawScore)

Jan21_M_Rl_TS <- merge(A, Male_Rl_TS, by = "Raw_Score", all = FALSE )
Jan21_M_Rl_TS <- Jan21_M_Rl_TS %>% rename(RL_Raw_Score = Raw_Score,
                                          RL_T = T,
                                          RL_Ptile  = Percentile)



#_________________________________________________________2

########################### ATR #########################
Male_ATR_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 2)

B <- Jan21_M_RS %>% select(ID,Jan21_ATR_RawScore) %>% rename(Raw_Score = Jan21_ATR_RawScore)

Jan21_M_ATR_TS <- merge(B, Male_ATR_TS, by = "Raw_Score", all = FALSE )
Jan21_M_ATR_TS <- Jan21_M_ATR_TS %>% rename(ATR_Raw_Score = Raw_Score,
                                            ATR_T = T,
                                            ATR_Ptile  = Percentile)



#_________________________________________________________3

########################### ANX #########################
Male_ANX_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 3)

C <- Jan21_M_RS %>% select(ID,Jan21_ANX_RawScore) %>% rename(Raw_Score = Jan21_ANX_RawScore)

Jan21_M_ANX_TS <- merge(C, Male_ANX_TS, by = "Raw_Score", all = FALSE )
Jan21_M_ANX_TS <- Jan21_M_ANX_TS  %>% rename(ANX_Raw_Score = Raw_Score,
                                             ANX_T = T,
                                             ANX_Ptile  = Percentile)



#_________________________________________________________4

########################### DEP #########################
Male_DEP_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 4)

D <- Jan21_M_RS %>% select(ID,Jan21_DEP_RawScore) %>% rename(Raw_Score = Jan21_DEP_RawScore)

Jan21_M_DEP_TS <- merge(D, Male_DEP_TS, by = "Raw_Score", all = FALSE )
Jan21_M_DEP_TS <- Jan21_M_DEP_TS  %>% rename(DEP_Raw_Score = Raw_Score,
                                             DEP_T = T,
                                             DEP_Ptile  = Percentile)


#_________________________________________________________5

########################### ANG #########################
Male_ANG_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 5)

E <- Jan21_M_RS %>% select(ID,Jan21_ANG_RawScore) %>% rename(Raw_Score = Jan21_ANG_RawScore)

Jan21_M_ANG_TS <- merge(E, Male_ANG_TS, by = "Raw_Score", all = FALSE )
Jan21_M_ANG_TS <- Jan21_M_ANG_TS  %>% rename(ANG_Raw_Score = Raw_Score,
                                             ANG_T = T,
                                             ANG_Ptile  = Percentile)


#_________________________________________________________6
########################### PTSI #########################
Male_PTSI_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 6)

f <- Jan21_M_RS %>% select(ID,Jan21_PTSI_RawScore) %>% rename(Raw_Score = Jan21_PTSI_RawScore)


Jan21_M_PTSI_TS <- merge(f, Male_PTSI_TS, by = "Raw_Score", all = FALSE )
Jan21_M_PTSI_TS <- Jan21_M_PTSI_TS %>% rename(PTSI_Raw_Score = Raw_Score,
                                              PTSI_T = T,
                                              PTSI_Ptile  = Percentile)


#_________________________________________________________7
########################### PTSAV #########################
Male_PTSAV_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 7)

G <- Jan21_M_RS %>% select(ID,Jan21_PTSAV_RawScore) %>% rename(Raw_Score = Jan21_PTSAV_RawScore)


Jan21_M_PTSAV_TS <- merge(G, Male_PTSAV_TS, by = "Raw_Score", all = FALSE )
Jan21_M_PTSAV_TS <- Jan21_M_PTSAV_TS %>% rename(PTSAV_Raw_Score = Raw_Score,
                                                PTSAV_T = T,
                                                PTSAV_Ptile  = Percentile)



#_________________________________________________________8
########################### PTSAR #########################
Male_PTSAR_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 8)

H <- Jan21_M_RS %>% select(ID,Jan21_PTSAR_RawScore) %>% rename(Raw_Score = Jan21_PTSAR_RawScore)

Jan21_M_PTSAR_TS <- merge(H, Male_PTSAR_TS, by = "Raw_Score", all = FALSE )
Jan21_M_PTSAR_TS <- Jan21_M_PTSAR_TS %>% rename(PTSAR_Raw_Score = Raw_Score,
                                                PTSAR_T = T,
                                                PTSAR_Ptile  = Percentile)



#_________________________________________________________9
########################### PTS_TOT #########################
Male_PTSTOT_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 9)

I <- Jan21_M_RS %>% select(ID,Jan21_PTS_TOT_RawScore) %>% rename(Raw_Score = Jan21_PTS_TOT_RawScore)

Jan21_M_PTS_TOT_TS <- merge(I, Male_PTSTOT_TS, by = "Raw_Score", all = FALSE )
Jan21_M_PTS_TOT_TS <- Jan21_M_PTS_TOT_TS %>% rename(PTS_TOT_Raw_Score = Raw_Score,
                                                    PTS_TOT_T = T,
                                                    PTS_TOT_Ptile  = Percentile)



#_________________________________________________________10
########################### DIS #########################
Male_DIS_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 10)

J <- Jan21_M_RS %>% select(ID,Jan21_DIS_RawScore) %>% rename(Raw_Score = Jan21_DIS_RawScore)


Jan21_M_DIS_TS <- merge(J, Male_DIS_TS, by = "Raw_Score", all = FALSE )
Jan21_M_DIS_TS <- Jan21_M_DIS_TS%>% rename(DIS_Raw_Score = Raw_Score,
                                           DIS_T = T,
                                           DIS_Ptile  = Percentile)
#_________________________________________________________11
########################### SC #########################

Male_SC_TS <- read_excel("Male_T_scores_v2.xlsx",sheet = 11)


K <-  Jan21_M_RS %>% select(ID,Jan21_SC_RawScore) %>% rename(Raw_Score = Jan21_SC_RawScore)


Jan21_M_SC_TS <- merge(K, Male_SC_TS, by = "Raw_Score", all = FALSE )
Jan21_M_SC_TS <- Jan21_M_SC_TS  %>% rename(SC_Raw_Score = Raw_Score,
                                           SC_T = T,
                                           SC_Ptile  = Percentile)




# Put all data frames into a list
Jan21_M_list <- list(Jan21_M_Rl_TS,
                Jan21_M_ATR_TS,
                Jan21_M_ANX_TS,
                Jan21_M_DEP_TS,
                Jan21_M_ANG_TS,
                Jan21_M_PTSI_TS,
                Jan21_M_PTSAV_TS,
                Jan21_M_PTSAR_TS,
                Jan21_M_PTS_TOT_TS,
                Jan21_M_DIS_TS,
                Jan21_M_SC_TS)

# Merge all data frames together
Jan21_M_tidy <- Jan21_M_list %>% reduce(full_join, by='ID')

# Print the resulting merged dataframe
print(Jan21_M_tidy)


Jan21_M_tidy <- Jan21_M_tidy %>% select(ID, everything()) 

