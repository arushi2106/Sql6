select 
    player_id
    , event_date
    , sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from Activity

-- This query selects each row from the Activity table and calculates a running total of games played 
-- by each player over time. For each row, it returns the player_id, the event_date, 
-- and a new column games_played_so_far, which is computed using a window function. 
-- The window function SUM(games_played) operates over a partition of rows grouped by player_id and 
-- ordered by event_date, so for each player, it adds up the number of games played from their earliest activity 
-- up to the current row's date. This creates a cumulative sum that grows with each new activity date per player.