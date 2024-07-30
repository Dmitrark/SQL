select m.pizza_name as pizza_name, m.price, p2.name as pizzeria_name, pv.visit_date 
	from person p
	join person_visits pv on p.id = pv.person_id
	join pizzeria p2 on pv.pizzeria_id = p2.id
	join menu m on pv.pizzeria_id = m.pizzeria_id 
	where p."name" = 'Kate' and m.price between 800 and 1000
	order by m.pizza_name asc, m.price asc, p2."name";