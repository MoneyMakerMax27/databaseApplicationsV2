-- =====================================================================
-- Unit 2d — Counting and Summarizing
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2d_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in the database?
SELECT count(*) AS team_count FROM teams;

-- 2. How many players?
SELECT count (*) AS player_count FROM players;

-- 3. What is the earliest founding year of any team?
SELECT MIN(year_founded) 
FROM teams;

-- 4. What is the most recent?
SELECT MAX(year_founded) 
FROM teams;

-- 5. What is the average founding year, rounded to a whole number?
SELECT ROUND(AVG(year_founded)) AS avg_year_founded
FROM teams;

-- 6. What is the total number of points scored across every game in
--    the database?
SELECT SUM(pts) AS total_points
FROM team_game_stats;

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 6 reads 10,842 rows and gives you one number. What is it?
1399607

-- COUNT(*) counts rows. What does COUNT(birth_year) count instead?
the number of non-null values

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Aggregate function: combining multiple functions into 1