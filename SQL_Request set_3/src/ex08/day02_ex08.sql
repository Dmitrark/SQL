select p."name" 
	from person_order po
	left join person p on po.person_id = p.id
	left join menu m on po.menu_id = m.id
	where (p.address = 'Moscow' or p.address = 'Samara') and p.gender = 'male' and (m.pizza_name = 'pepperoni pizza' or m.pizza_name = 'mushroom pizza')
	order by p."name" desc;