WITH RECURSIVE t AS (
	SELECT point1, point2, "cost", ARRAY[point1]::varchar[] AS tour
		FROM classical_tsp ct
		WHERE point1 = 'a'
	UNION ALL 
	SELECT ct.point1, ct.point2, ct."cost" + t."cost" AS "cost", t.tour || ct.point1 AS tour
		FROM t
		JOIN classical_tsp ct ON t.point2 = ct.point1 AND not ARRAY [ct.point1] <@ t.tour
		),
x AS (
	SELECT "cost" AS total_cost, tour || ARRAY['a']::varchar[] AS tour
		FROM t
		WHERE tour @> ARRAY ['a', 'b', 'c', 'd']::varchar[] AND ARRAY_length(tour, 1) = 4 AND point2 = 'a')
SELECT *
	FROM x
	WHERE total_cost = (SELECT min(total_cost) FROM x) OR total_cost = (SELECT max(total_cost) FROM x) 
	ORDER BY 1, 2;