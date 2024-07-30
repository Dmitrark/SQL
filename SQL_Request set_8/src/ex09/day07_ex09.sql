SELECT address, round(max(age) - (min(age)/max(age)::NUMERIC), 2) AS formula, round(avg(age), 2) as average,
	CASE
		WHEN round(max(age) - (min(age)/max(age)::NUMERIC), 2) > avg(age) then TRUE
		ELSE false
	END AS comprasion
FROM person p 
GROUP BY address
ORDER BY address asc; 