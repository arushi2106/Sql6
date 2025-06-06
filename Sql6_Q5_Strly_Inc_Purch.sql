with total_amount_table as 
(
select
    customer_id
    , year(order_date) as year_purch
    , sum(price) as total_purchases
from 
    Orders
group by 1,2
order by 1,2
)
select 
    t1.customer_id
from 
    total_amount_table t1 left join total_amount_table t2 on
    t1.customer_id = t2.customer_id 
    and t2.total_purchases > t1.total_purchases 
    and t2.year_purch = t1.year_purch + 1
group by 1
having count(*) - count(t2.customer_id) = 1

-- second test case failed because there can be a year where it first decreased then increased. so this 
-- query captured the increasing part and displayed it. but we want strictly increasing. 
-- if we simply did select distinct t1.customer_id and then all the conditions, then 1st case did qualify
-- but in case of increasijg decreasing increasing, we fail. so we need to think of something where we can count 
-- every row has been increasing. for that if we check count(*) and count(t2.cutsomer_id) and check nulls, 
-- we will be able to find if all the years have been strictly increasing or not.
-- then we also dont have to do distinct , we just have to group by and put count condition in having