select p."name" as person_name, m.pizza_name as pizza_name, p2."name" as pizzeria_name
	from person_order po
	join person p on po.person_id = p.id
	join menu m on po.menu_id = m.id
	join pizzeria p2 on m.pizzeria_id = p2.id
	order by person_name asc, pizza_name asc, pizzeria_name asc; --включает в себя номера людей и меню