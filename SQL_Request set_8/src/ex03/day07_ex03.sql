WITH orders as
(SELECT p."name" AS name, count(*)
	FROM person_order po
	JOIN menu m ON po.menu_id = m.id
	JOIN pizzeria p ON m.pizzeria_id = p.id
	GROUP BY p."name"
	ORDER BY count DESC),
visits as 
(SELECT p."name" AS name, count(*)
	FROM person_visits pv 
	JOIN pizzeria p ON pv.pizzeria_id = p.id
	GROUP BY p."name"
	ORDER BY count DESC)
SELECT v.name, COALESCE(o.count, 0) + COALESCE(v.count, 0) AS total_count
	FROM orders o
	RIGHT JOIN visits v ON o.name = v.name  
ORDER BY total_count DESC, name ASC;