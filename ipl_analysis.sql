-- IPL Data Analysis Project (2008-2020)
-- Tool: MySQL
-- Dataset: Kaggle - IPL Complete Dataset

USE ipl_analysis;

-- Query 1: Which team won the most matches?
SELECT winner, COUNT(*) as total_wins
FROM matches
GROUP BY winner
ORDER BY total_wins DESC;

-- Query 2: Does winning toss help win the match?
SELECT toss_decision, 
       COUNT(*) as total_matches,
       SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) as toss_winner_also_won,
       ROUND(SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as win_percentage
FROM matches
GROUP BY toss_decision;

-- Query 3: Top 10 batsmen by total runs
SELECT batter, 
       SUM(batsman_runs) as total_runs
FROM deliveries
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;

-- Query 4: Top batsmen in winning matches only (JOIN)
SELECT d.batter,
       SUM(d.batsman_runs) as total_runs
FROM deliveries d
JOIN matches m ON d.match_id = m.id
WHERE d.batting_team = m.winner
GROUP BY d.batter
ORDER BY total_runs DESC
LIMIT 10;

-- Query 5: Top 10 wicket takers
SELECT bowler,
       COUNT(*) as total_wickets
FROM deliveries
WHERE dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field', 'NA')
AND dismissal_kind IS NOT NULL
AND dismissal_kind != ''
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;

-- Query 6: Which venue hosted the most IPL matches?
SELECT venue, COUNT(*) as total_matches
FROM matches
GROUP BY venue
ORDER BY total_matches DESC;

-- Query 7: Top scorer in each IPL season (Orange Cap)
WITH season_ranks AS (
    SELECT 
        m.season,
        d.batter,
        SUM(d.batsman_runs) as total_runs,
        RANK() OVER (PARTITION BY m.season 
                     ORDER BY SUM(d.batsman_runs) DESC) as rank_in_season
    FROM deliveries d
    JOIN matches m ON d.match_id = m.id
    GROUP BY m.season, d.batter
)
SELECT season, batter, total_runs
FROM season_ranks
WHERE rank_in_season = 1
ORDER BY season;

-- Query 8: Top wicket taker in each IPL season (Purple Cap)
WITH season_wickets AS (
    SELECT 
        m.season,
        d.bowler,
        COUNT(*) as total_wickets,
        RANK() OVER (PARTITION BY m.season 
                     ORDER BY COUNT(*) DESC) as rank_in_season
    FROM deliveries d
    JOIN matches m ON d.match_id = m.id
    WHERE d.dismissal_kind NOT IN 
          ('run out', 'retired hurt', 
           'obstructing the field', 'NA')
    AND d.dismissal_kind IS NOT NULL
    AND d.dismissal_kind != ''
    GROUP BY m.season, d.bowler
)
SELECT season, bowler, total_wickets
FROM season_wickets
WHERE rank_in_season = 1
ORDER BY season;

-- Query 9: Top 10 batsmen by strike rate (min 200 balls)
SELECT 
    batter,
    SUM(batsman_runs) as total_runs,
    COUNT(*) as balls_faced,
    ROUND((SUM(batsman_runs) / COUNT(*)) * 100, 2) as strike_rate
FROM deliveries
GROUP BY batter
HAVING balls_faced > 200
ORDER BY strike_rate DESC
LIMIT 10;

-- Query 10: Top batsmen in successful run chases
SELECT 
    d.batter,
    SUM(d.batsman_runs) as total_runs
FROM deliveries d
JOIN matches m ON d.match_id = m.id
WHERE
    d.inning = 2
    AND d.batting_team = m.winner 
GROUP BY d.batter 
ORDER BY total_runs DESC
LIMIT 10;
