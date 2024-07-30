SELECT p.name, count(*), round(avg(price), 2) AS average_price, max(price) AS max_price, min(price) AS min_price
	FROM person_order po
	JOIN menu m ON po.menu_id = m.id
	JOIN pizzeria p ON m.pizzeria_id = p.id 
	GROUP BY p.name
	ORDER BY name ASC;