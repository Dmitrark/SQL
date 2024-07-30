WITH poc AS
(SELECT DISTINCT po.person_id
	FROM person_order po)
SELECT (SELECT name FROM person p WHERE poc.person_id = p.id)
	FROM poc
ORDER BY name ASC;