# source('Male_RawScores2TScores.R')
# source('Female_RawScores2TScores.R')

May22_SCORES <- arrange(rbind(May22_M_tidy,May22_F_tidy), ID)

Demographics <- read_excel("Demographics.xlsx")

May22_SCORES <- merge(Demographics, May22_SCORES, by = "ID", all = FALSE )

write.csv(May22_SCORES,file = "May22_Scores.csv",row.names = FALSE)
