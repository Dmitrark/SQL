select p2.name
	from person_visits pv
	left join person p on pv.person_id = p.id
	left join menu m on pv.pizzeria_id = m.pizzeria_id
	left join pizzeria p2 on m.pizzeria_id = p2.id
	where p.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800;
	