-- =====================================================================
-- Unit 2b — Filtering with Logic
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players
--
-- Rename this file with your last name before you start.
--
-- Read unit2b_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Show every team in Ohio or California, with its state.
SELECT full_name, state
FROM teams
WHERE state = 'California';

-- 2. Show teams founded between 1960 and 1980, with their founding
--    years. Use BETWEEN.
SELECT full_name, year_founded
FROM teams
WHERE year_founded BETWEEN 1960 AND 1980;

-- 3. Show teams in Texas, Florida, or New York, with their states.
--    Use IN.
SELECT full_name, state
FROM teams
WHERE state IN ('Texas', 'Florida', 'New York');

-- 4. Show teams whose nickname starts with the letter C.
SELECT full_name, nickname
FROM teams
WHERE nickname LIKE 'C%';

-- 5. Find every player whose name contains "James".
SELECT full_name
FROM players
WHERE full_name LIKE '%James%';


-- 6. List each state that has at least one team — each state only
--    once, sorted alphabetically.
SELECT DISTINCT state
FROM teams
WHERE state IS NOT NULL
ORDER BY state ASC;

-- 7. Show every team that is NOT in California. Use NOT.
SELECT full_name, state
FROM teams
WHERE  NOT (state = 'California');

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 5 returns more than just LeBron. Who else shows up, and why?

Players like James Harden show up because the wild card is making it so it is specificaly looking for people who have "James" in their name.


-- Query 6 returns fewer rows than there are teams. Why?
distinct makes so only one team per state shows because there can be multiple teams in 1 state

-- Query 7 could also be written with <> instead of NOT. Why do they
-- give the same result?
<> means not

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Boolean logic:
true or false

-- Wildcard:
pattern matching

-- NULL:
no value