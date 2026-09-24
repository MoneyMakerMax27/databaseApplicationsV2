**Before you start:** rename this file to `unit3a_lastname.md`, using your own last name. Read `unit3a_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3a — Redundancy

Open **`denormalized_demo.db`** in DB Browser for SQLite. The walkthrough used the **Cleveland Cavaliers**. In this task you do the same work for the **Chicago Bulls**.

The 30 teams, cities, states, conferences, and divisions are real. The games and scores are made up.

## 1. Count the repeats

Use the **Execute SQL** tab. You know enough SQL from Unit 2 for all of these. Paste each query you run into the code block under the question.

**a.** How many rows are in `games_flat`?

```sql
SELECT count (*)
FROM games_flat;
```

**Answer:** 230


**b.** How many rows have `home_city = 'Chicago'`? How many have `away_city = 'Chicago'`?

```sql
SELECT count (*)
FROM games_flat
WHERE home_city = 'Chicago' or away_city = 'Chicago';
```

**Answer:** 34


**c.** So how many times is the fact any team "plays in Chicago, Illinois" typed into this table?

**Answer:** 34


## 2. Find the mistakes

There are **8** mistakes planted in `games_flat`. Two of them are the Cavaliers mistakes from the walkthrough. Find all 8.

Run `SELECT DISTINCT` on each of these six columns: `home_team`, `away_team`, `home_city`, `away_city`, `home_state`, `away_state`. Add `ORDER BY` so the list is sorted.

What each list should have if nothing is wrong:

- **Team names:** 30.
- **Cities:** 29. The Clippers and the Lakers both play in Los Angeles.
- **States:** 23. Toronto is in Ontario, and Washington is in District of Columbia, so those count too.

If a list has more than that, something in it is wrong. Once you find a wrong value, use `WHERE` to get its `game_id`.

| # | game_id | Which column | What it says | What it should say |
|---|---|---|---|---|
| 1 | 30|home_team |Clevland Cavaliers |Cleveland Cavaliers |
| 2 | 48|home_city |Pheonix Suns |Phoenix Suns |
| 3 | 70|away_state|OH |Ohio |
| 4 | 93|home_city |Philidelphia |Philadelphia |
| 5 |118|home_team | Chicago Buls |Chicago Bulls |
| 6 |124|home_state|IL |Illinois |
| 7 |131|away_state|TX |Texas |
| 8 |134|away_team |Chicago Bull |Chicago Bulls |

**d.** Write a query that counts every Bulls game by **team name** (home or away). Compare your count to your city count from **b**. Which count is right, and why are they different?

```sql
SELECT COUNT(*) AS bulls_game_count
FROM games_flat
WHERE home_team = 'Chicago Bulls'
   OR away_team = 'Chicago Bulls';
```

**Answer:**


## 3. Spot the anomalies in a new table

A school keeps its class schedule in one table, `class_schedule`:

| student | course | period | teacher | room |
|---|---|---|---|---|
| Ava Brooks | Web Design | 1 | Mr. Grant | 214 |
| Ava Brooks | Algebra II | 2 | Ms. Ortiz | 108 |
| Liam Chen | Web Design | 1 | Mr. Grant | 214 |
| Liam Chen | Chemistry | 3 | Mrs. Hall | 122 |
| Noah Diaz | Web Design | 1 | Mr. Grant | 214 |
| Noah Diaz | Algebra II | 2 | Ms. Ortiz | 108 |
| Emma Fox | Art I | 4 | Mr. Kerr | 301 |

For each scenario, name the anomaly (**update**, **insert**, or **delete**) and explain what goes wrong.

**Scenario A** — Emma Fox drops Art I, so her Art I row is deleted.

**Which anomaly:**
Deletion anomaly
**What goes wrong:**
eleting Emma Fox's row completely removes all record of Art I

**Scenario B** — The school hires a new teacher, Ms. Reyes, who will use Room 205. She has no students yet.

**Which anomaly:**
Insertion anomaly
**What goes wrong:**
You cannot add Ms. Reyes and Room 205 to the schedule without enrolling a student

**Scenario C** — Mr. Grant moves from Room 214 to Room 220. How many rows have to change, and what happens if you miss one?

**Which anomaly:**
Update anomaly
**What goes wrong:**
If you miss updating even one row, the database will contain conflicting, inconsistent data

**e.** In `denormalized_demo.db`, team facts (city, state, conference, division) were moved into their own table, `teams`. Which facts in `class_schedule` should be moved into their own table the same way?

**Answer:**
The course information—course, period, teacher, and room—should be moved into its own dedicated courses or classes table. Student enrollment would then link students to a specific course ID, eliminating redundant teacher and room data.

**g.** Look up the Bulls' `team_id` in `teams`. Then write a query on **`games`** (not `games_flat`) that counts every Bulls game using that number. Which count from Part 1 or 2 does it match? Why can't the `games` table have the kind of mistake you found in Part 2?

```sql
SELECT COUNT(*) AS bulls_game_count
FROM games
WHERE home_team_id = 5 
   OR away_team_id = 5;
```

**Answer:**


**h.** Write one query that shows the game date, home team name, away team name, home points, and away points for **Bulls games only**, sorted by date. Start from the walkthrough's query. You will need to add columns and a `WHERE`.

```sql
SELECT 
    g.game_date,
    ht.full_name AS home_team,
    at.full_name AS away_team,
    g.home_pts,
    g.away_pts
FROM games g
JOIN teams ht ON g.home_team_id = ht.team_id
JOIN teams at ON g.away_team_id = at.team_id
WHERE g.home_team_id = 5 
   OR g.away_team_id = 5
ORDER BY g.game_date;
```

## Closing 3a — Vocabulary

Your words, not the slide's.

| Term | Your definition |
|---|---|
| Redundancy | Storing the exact same piece of data in multiple places across a database table, which wastes space and leads to inconsistencies.|
| Update anomaly |A data error that happens when duplicated data is changed in one row but not in every other row where it appears, leaving conflicting information. |
| Insert anomaly |A situation where new data cannot be added to a database table because required fields |
| Delete anomaly | The unintentional loss of valuable data when deleting a record because unrelated information is stored together in the same row.|
| Normalization |The process of organizing data into distinct, related tables to eliminate redundant values and protect data integrity. |

