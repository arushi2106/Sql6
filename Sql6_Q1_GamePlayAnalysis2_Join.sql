with min_player_dev as
(
    select 
        player_id
        , min(event_date) as min_date
    from 
        Activity
    group by 1
)
select 
    m.player_id
    , a.device_id
from min_player_dev m join Activity a on m.player_id = a.player_id and m.min_date = a.event_date

-- First, the query defines a Common Table Expression (CTE) named min_player_dev that selects the
--  earliest (MIN) event_date for each player_id from the Activity table, giving us the first day each player was active.
--  Next, the main query joins this CTE with the original Activity table on both player_id and event_date, 
--  ensuring we only match records where the activity happened on the player’s first active date.
--  The final output lists each player_id along with the device_id they used on that first day of activity.
--  If a player used multiple devices on their first day,
--  the result will include multiple rows for that player—one for each device.