# source('Male_RawScores2TScores.R')
# source('Female_RawScores2TScores.R')

Dec21_SCORES <- arrange(rbind(Dec21_M_tidy,Dec21_F_tidy), ID)

Demographics <- read_excel("Demographics.xlsx")

Dec21_SCORES <- merge(Demographics, Dec21_SCORES, by = "ID", all = FALSE )

write.csv(Dec21_SCORES,file = "Dec21_Scores.csv",row.names = FALSE)
