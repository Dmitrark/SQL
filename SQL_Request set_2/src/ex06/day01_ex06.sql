with po as (
    select order_date as action_date, person_id
    	from person_order 
),
m as (
    select visit_date as action_date, person_id
    	from person_visits
)
select action_date, p.name as person_name
	from po
	join person p on p.id = po.person_id
intersect all
select action_date, p.name AS person_name
	from m
	join person p ON p.id = m.person_id
order by action_date asc, person_name desc;