select pizza_name, p2.name as pizzeria_name
	from person_order po
	left join person p on po.person_id = p.id
	left join menu m on po.menu_id = m.id
	left join pizzeria p2 on m.pizzeria_id = p2.id
	where p.name = 'Denis' or p.name = 'Anna'
	order by pizza_name asc, pizzeria_name asc;