-- SQL Intermediate Datacamp Training --
/* Select the team's long name and API id from the teams_germany table.
Filter the query for FC Schalke 04 and FC Bayern Munich using IN, giving you the team_api_IDs needed for the next step. */
SELECT
	team_long_name,
	team_api_id
FROM teams_germany
WHERE team_long_name in ('FC Schalke 04', 'FC Bayern Munich');

/* Create a CASE statement that identifies whether a match in Germany included FC Bayern Munich, FC Schalke 04, or neither as the home team.
Group the query by the CASE statement alias, home_team */

-- Identify the home team as Bayern Munich, Schalke 04, or neither
SELECT 
    CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
        WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
    COUNT(id) AS total_matches
FROM matches_germany
-- Group by the CASE statement alias
GROUP BY home_team;


/* Select the date of the match and create a CASE statement to identify matches as home wins, home losses, or ties.*/
SELECT 
	-- Select the date of the match
	date,
	-- Identify home wins, losses, or ties
	case when home_goal > away_goal then 'Home win!'
        when home_goal < away_goal then 'Home loss :(' 
        else 'Tie' end as outcome
FROM matches_spain;

/* Left join the teams_spain table team_api_id column to the matches_spain table awayteam_id. This allows us to retrieve the away team's identity.
Select team_long_name from teams_spain as opponent and complete the CASE statement from Step 1. */

SELECT 
	m.date,
	--Select the team long name column and call it 'opponent'
	t.team_long_name AS opponent, 
	-- Complete the CASE statement with an alias
	case when m.home_goal > m.away_goal then 'Home win!'
        when m.home_goal < m.away_goal then 'Home loss :('
        else 'Tie' end as outcome
FROM matches_spain AS m
-- Left join teams_spain onto matches_spain
left join teams_spain AS t
	on m.awayteam_id = t.team_api_id;

/* Complete the same CASE statement as the previous steps.
Filter for matches where the home team is FC Barcelona (id = 8634). */
SELECT 
	m.date,
	t.team_long_name AS opponent,
    -- Complete the CASE statement with an alias
	case when m.home_goal > m.away_goal then 'Barcelona win!'
        when m.home_goal < m.away_goal then 'Barcelona loss :(' 
        else 'Tie' end as  outcome 
FROM matches_spain AS m
LEFT JOIN teams_spain AS t 
ON m.awayteam_id = t.team_api_id
-- Filter for Barcelona as the home team
WHERE m.hometeam_id = 8634; 

/*Complete the CASE statement to identify Barcelona's away team games (id = 8634) as wins, losses, or ties.
Left join the teams_spain table team_api_id column on the matches_spain table hometeam_id column. This retrieves the identity of the home team opponent.
Filter the query to only include matches where Barcelona was the away team. */
-- Select matches where Barcelona was the away team
SELECT
	m.date,
	t.team_long_name AS opponent,
	CASE WHEN m.home_goal < m.away_goal THEN 'Barcelona win!'
         WHEN m.home_goal > m.away_goal THEN 'Barcelona loss :('
         ELSE 'Tie' END AS outcome
FROM matches_spain AS m
-- Join teams_spain to matches_spain
LEFT JOIN teams_spain AS t
ON m.hometeam_id = t.team_api_id
WHERE m.awayteam_id = 8634;

/* Checking if each match was played, and won by the team Chelsea*/
select date,
	hometeam_id,
	awayteam_id,
	case when hometeam_id = 8455 and home_goal > away_goal
			then 'chelsea home win!'
		when awayteam_id = 8455 and home_goal < away_goal
			then 'Chelsea away win!'
		else 'Loss or tie :(' end as outcome
from match
where hometeam_id = 8455 or awayteam_id = 8455;

/* Return a column with tables that have null values */
select date,
	case when date > '2015-01-01' then 'More REcently'
	when date < '2012-01-01' then 'Older'
	end as date_category
from match;
select date,
	case when date > '2015-01-01' then 'More Recently'
		when date < '2012-01-01' then 'Older'
		else NULL end as date_category
from match;

/* Complete the first CASE statement, identifying Barcelona or Real Madrid as the home team using the hometeam_id column.
Complete the second CASE statement in the same way, using awayteam_id.
*/
SELECT date, 
CASE WHEN hometeam_id = 8634 THEN 'FC Barcelona' 
    ELSE 'Real Madrid CF' END as home, 
CASE WHEN awayteam_id = 8634 THEN 'FC Barcelona' 
ELSE 'Real Madrid CF' END as away, 
CASE WHEN home_goal > away_goal AND hometeam_id = 8634 THEN 'Barcelona win!' WHEN home_goal > away_goal AND hometeam_id = 8633 THEN 'Real Madrid win!' WHEN home_goal < away_goal AND awayteam_id = 8634 THEN 'Barcelona win!' 
WHEN home_goal < away_goal AND awayteam_id = 8633 THEN 'Real Madrid win!' ELSE 'Tie!' END AS outcome 
FROM matches_spain 
WHERE (awayteam_id = 8634 OR hometeam_id = 8634) AND (awayteam_id = 8633 OR hometeam_id = 8633); 
