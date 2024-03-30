- TSCYC_Analysis.R obtains the Scales and their RawScore for the given time periods of "TSCYC Master Data List.xlsx"

  For the different time periods (Jan21,May21,Dec21,May22), use ctrl+f to replace time periods (eg. ctrl+f then Jan21 then May21 then replace all ) and apply :

- Female_RawScores2TScores.R:  maps the RawScores for each scale with their corresponding T Scores using "Female_T_scores_v3.xlsx" and "TSCYC_clean.3.29.xlsx"
- Male_RawScores2TScores.R:  maps the RawScores for each scale with their corresponding T Scores using "Male_T_scores_v3.xlsx" and "TSCYC_clean.3.29.xlsx"
- RawScores2TScores.R:  merges Females and Males Scores and Save them to a csv file.
