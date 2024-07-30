(SELECT p."name" AS name, count(*), 'order' AS action_type
	FROM person_order po
	JOIN menu m ON po.menu_id = m.id
	JOIN pizzeria p ON m.pizzeria_id = p.id
	GROUP BY p."name"
	ORDER BY count desc
	LIMIT 3)
UNION 
(SELECT p."name" AS name, count(*), 'visit' AS action_type
	FROM person_visits pv 
	JOIN pizzeria p ON pv.pizzeria_id = p.id
	GROUP BY p."name"
	ORDER BY count desc
	LIMIT 3)
ORDER BY action_type asc, count desc;