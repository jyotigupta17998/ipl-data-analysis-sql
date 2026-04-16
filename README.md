# IPL Data Analysis (2008-2020)

## Project Overview
This project analyzes 12 years of IPL match data using MySQL. 
The dataset contains 1,076 matches and 1,06,670 ball-by-ball 
deliveries from 2008 to 2020.

  ## Dataset
- Source: Kaggle - IPL Complete Dataset 2008-2020
- Link: https://www.kaggle.com/datasets/patrickb1912/ipl-complete-dataset-20082020
- Tables: matches (1,076 rows) and deliveries (1,06,670 rows)
- Note: Dataset not uploaded due to file size. 
  Please download directly from Kaggle link above.

## Tools Used
- MySQL
- MySQL Workbench

## Business Questions Answered

### 1. Which team won the most matches?
- Mumbai Indians dominate with 142 wins across all seasons
- They are the most successful IPL franchise in this dataset

### 2. Does winning the toss help win the match?
- Teams choosing to FIELD after winning toss won 54% of matches
- Teams choosing to BAT after winning toss won only 45% of matches
- Conclusion: Chasing is a clear advantage in IPL T20 format

### 3. Who are the top 10 batsmen by total runs?
- SK Raina leads with 3,333 runs across all seasons
- Followed by RG Sharma (2,903) and G Gambhir (2,806)

### 4. Who scored most runs in winning matches? (JOIN Query)
- Used JOIN across matches and deliveries tables
- SK Raina scored 2,183 runs in winning matches
- 65% of his total runs came in matches his team won
- Shows he was not just consistent but match-winning

### 5. Who are the top wicket takers?
- SL Malinga leads with 119 wickets
- Followed by A Mishra (102) and PP Chawla (98)

## Data Quality Issue Found and Fixed
The dismissal_kind column contained text value 'NA' 
instead of proper NULL for non-wicket deliveries.
This was identified and filtered out to get accurate wicket counts.
This is a common real-world dirty data problem.

## Key Insights
- Mumbai Indians are the most successful IPL team
- Fielding first after winning toss gives 54% win rate
- SK Raina is the most impactful batsman in winning matches
- Lasith Malinga is the most successful IPL bowler

## SQL Concepts Used
- GROUP BY and COUNT
- Conditional Aggregation (CASE WHEN inside SUM)
- JOIN across two tables
- Data cleaning with IS NOT NULL and NOT IN
- ORDER BY and LIMIT

### 6. Which venue hosted the most matches?
- Eden Gardens hosted 77 matches — most in IPL history
- Wankhede Stadium second with 72 matches
- Both are iconic cricket venues in India
