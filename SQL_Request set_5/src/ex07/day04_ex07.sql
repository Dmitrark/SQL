INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id)+1 
			FROM person_visits),
		(SELECT id 
			FROM person 
			WHERE name = 'Dmitriy'), 
		(SELECT pizzeria.id 
			FROM pizzeria 
			JOIN menu m ON pizzeria.id = m.pizzeria_id 
			WHERE price < 800 AND m.pizza_name != 'Papa_Johns'
			ORDER BY pizzeria.id LIMIT 1), '2022-01-08');
			
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;