with GenderVisits as ( 
	select pizzeria_id,
	sum(case when p.gender = 'male' then 1 else 0 end) as male_visits,
	sum(case when p.gender = 'female' then 1 else 0 end) as female_visits 
		from person_order po
		left join person p on po.person_id = p.id
		left join menu m on po.menu_id = m.id
	group by pizzeria_id
)
select p."name" as pizzeria_name
	from GenderVisits gv
	left join pizzeria p on gv.pizzeria_id = p.id
	where gv.male_visits > 0 and gv.female_visits = 0
union
select p."name" as pizzeria_name
	from GenderVisits gv
	left join pizzeria p on gv.pizzeria_id = p.id
	where gv.male_visits = 0 and gv.female_visits > 0
order by pizzeria_name asc;