SELECT generated_date AS missing_date
	FROM v_generated_dates
except
SELECT pv.visit_date AS missing_date
	FROM person_visits pv
ORDER BY missing_date ASC;