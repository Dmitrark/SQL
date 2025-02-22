SELECT (SELECT name FROM person p WHERE p.id = pv.person_id), count(*) AS count_of_visits
	FROM person_visits pv
	GROUP BY person_id
	ORDER BY count_of_visits DESC, person_id ASC
	LIMIT 4;