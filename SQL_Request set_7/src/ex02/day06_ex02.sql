SELECT p."name", m.pizza_name, m.price, m.price - (m.price*pd.discount/100), p2."name" AS pizzeria_name
	FROM person_order po
	JOIN person p ON po.person_id = p.id
	JOIN menu m ON po.menu_id = m.id
	JOIN pizzeria p2 ON m.pizzeria_id = p2.id
	JOIN person_discounts pd ON pd.person_id = po.person_id AND pd.pizzeria_id = m.pizzeria_id
	ORDER BY p.name ASC, m.pizza_name asc;