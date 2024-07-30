SELECT p.name, count(*) AS count_of_visits
	FROM person_visits pv 
	JOIN person p on p.id = pv.person_id
	GROUP BY p.name
	HAVING count(*)>3;