SELECT p.address, p2.name, count(*)
	FROM person_order po
	JOIN person p ON po.person_id = p.id
	JOIN menu m  ON m.id = po.menu_id
	JOIN pizzeria p2 on m.pizzeria_id = p2.id 
	GROUP BY p2."name", p.address
	ORDER BY p.address ASC, p2."name" ASC;
