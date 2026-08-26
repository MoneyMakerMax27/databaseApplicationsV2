-- =====================================================================
-- Unit 2a — Getting Data Out
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Table: teams
--
-- Rename this file with your last name before you start.
-- Write each query below its number. Test it in DB Browser's
-- Execute SQL tab before you move on.
--
-- Read unit2a_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. List every team's full name.
SELECT full_name
FROM teams;

-- 2. Show the full name, city, and state of every team.
SELECT full_name, state, city
FROM teams;

-- 3. Show the full name and city of every team in Ohio.
SELECT full_name, city
FROM teams
WHERE state = 'Ohio';

-- 4. Show the full name and founding year of teams founded before 1950.
SELECT full_name, year_founded
FROM teams
WHERE year_founded < 1950;

-- 5. List every team's name and founding year, oldest team first.
SELECT full_name, year_founded
FROM teams
ORDER BY year_founded;

-- 6. Show the five most recently founded teams, with their founding years.
SELECT full_name, year_founded
FROM teams
ORDER BY year_founded DESC
LIMIT 5;

-- =====================================================================
-- CHECK YOUR WORK
-- Answer each question in a sentence or two, as a comment.
-- =====================================================================

-- How many teams are in Ohio?
1

-- What's the oldest team in the league, and what year?
Boston Celtics 1946


-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Query:
Question.

-- Clause:
Problem.

-- Alias (AS):
A temporary name.
