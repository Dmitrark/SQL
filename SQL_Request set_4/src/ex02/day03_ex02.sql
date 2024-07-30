select m.pizza_name, m.price, p."name" as pizzeria_name--id as menu_id
	from menu m
	left join pizzeria p on m.pizzeria_id = p.id
	where not exists (
	select *
		from person_order po
		where m.id = po.menu_id
	)
	order by m.pizza_name asc, m.price asc;