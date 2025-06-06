select 
    p.firstName
    , p.lastName
    , a.city
    , a.state
from 
    Person p left join Address a on p.personId = a.personId

-- This SQL query retrieves a list of people along with their associated city and state information, if available. 
-- It performs a left join between the Person table (aliased as p) and the Address table (aliased as a) 
-- using the common personId column. The LEFT JOIN ensures that all records from the Person table are included, 
-- even if there is no matching record in the Address table. For those people who don’t have a corresponding address, 
-- the city and state fields will appear as NULL in the output. The selected columns include the person’s 
-- first name, last name, city, and state.