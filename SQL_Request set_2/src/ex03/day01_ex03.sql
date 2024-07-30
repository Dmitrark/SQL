with po as (
	select order_date as action_date, person_id
	from person_order 
),
m as (
	select visit_date as action_date, person_id
	from person_visits
)
select * from po
intersect all
select * from m
order by action_date asc, person_id desc;