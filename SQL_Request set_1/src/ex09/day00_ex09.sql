select (select p.name from person p where p.id = pv.person_id) as person_name,
		(select p2.name from pizzeria p2 where p2.id = pv.pizzeria_id) as pizzeria_name
	from person_visits pv
	where visit_date between '2022-01-07' and '2022-01-09'
	order by person_name asc, pizzeria_name desc;