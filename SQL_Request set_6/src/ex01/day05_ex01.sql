set enable_seqscan = off;
EXPLAIN ANALYZE SELECT m.pizza_name, p.name AS pizzeria_name--(SELECT name FROM pizzeria p WHERE p.id = m.pizzeria_id) AS pizzeria_name
	FROM menu m
	JOIN pizzeria p on p.id = m.pizzeria_id;