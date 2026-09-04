-- =====================================================================
-- Unit 2e — Grouping
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2e_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in each state?
SELECT   state, COUNT(*) AS team_count
FROM     teams
GROUP BY state;

-- 2. Same as query 1, but sorted with the most teams first.
SELECT state, COUNT(*) AS team_count
FROM teams
GROUP BY state
ORDER BY team_count DESC;

-- 3. Same as query 2, but only show states with more than one team.
SELECT   state, COUNT(*) AS team_count
FROM     teams
GROUP BY state
HAVING count(*) > 1
ORDER BY team_count DESC;

-- 4. For each season, show the average points scored per game,
--    rounded to one decimal.
SELECT season, ROUND(AVG(pts), 1) AS avg_points
FROM team_game_stats
GROUP BY season
ORDER BY season ASC;

-- 5. For each team, count how many games they won. (Wins are
--    wl = 'W'.) Show team_id and the win count.
SELECT team_id, COUNT(*) AS win_count
FROM team_game_stats
WHERE wl = 'W'
GROUP BY team_id
ORDER BY win_count;

-- 6. Same as query 5, but only teams with more than 200 wins.
SELECT team_id, COUNT(*) AS win_count
FROM team_game_stats
WHERE wl = 'W'
GROUP BY team_id
HAVING COUNT(*) > 200
ORDER BY win_count DESC;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Which two states have the most teams, and how many each?
SELECT state, COUNT(*) AS team_count
FROM teams
WHERE state IN ('California', 'Texas')
GROUP BY state
ORDER BY team_count DESC;

-- In query 6 you used both WHERE and HAVING. Explain in your own
-- words what each one filtered.
WHERE wl = 'W' gets rid of the losses and only shows the wins
HAVING COUNT(*) > 200 only shows if a tally is more then 200

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- GROUP BY:
select group

-- HAVING: 
filters group