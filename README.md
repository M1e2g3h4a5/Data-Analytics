mkdir -p A_Exploratory_Data_Analytics/{1_Database_Exploration,2_Dimension_Exploration,3_Data_Exploration,4_Measure_Exploration,5_Magnitude,6_Ranking_TopN_BottomN}
mkdir -p B_Advanced_Analytics/{1_Change_Over_Time,2_Cumulative_Analysis,3_Performance_Analysis,4_Part_to_Whole,5_Data_Segmentation,6_Reporting}

# add placeholder files so folders aren't empty
find A_Exploratory_Data_Analytics -type d -exec touch {}/.gitkeep \;
find B_Advanced_Analytics -type d -exec touch {}/.gitkeep \;
