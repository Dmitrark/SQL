with GenderVisits as (
    select pizzeria_id,
        SUM(case when p2.gender = 'male' then 1 else 0 end) as male_visits,
        SUM(case when p2.gender = 'female' then 1 else 0 end) as female_visits
    	from person_visits pv
        join person p2 on pv.person_id = p2.id
    group by pizzeria_id
),
GenderDifference as (
    select pizzeria_id, male_visits, female_visits,
        ABS(male_visits - female_visits) as gender_difference
    	from GenderVisits
)
select p."name" as pizzeria_name
	from GenderDifference gd
	join pizzeria p on p.id = gd.pizzeria_id
	where gd.gender_difference > 0
	order by pizzeria_name asc;