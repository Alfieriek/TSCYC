# source('Male_RawScores2TScores.R')
# source('Female_RawScores2TScores.R')

May22_SCORES <- rbind(May22_M_tidy,May22_F_tidy)

write.csv(May22_SCORES,file = "May22_Scores.csv",row.names = FALSE)
