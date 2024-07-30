CREATE TABLE Classical_TSP (
	point1 varchar(1),
	point2 varchar(1),
	cost int
);
	
INSERT INTO Classical_TSP (point1, point2, cost)
VALUES ('a', 'b', 10),
    	('b', 'a', 10),
	    ('a', 'c', 15),
	    ('c', 'a', 15),
	    ('a', 'd', 20),
	    ('d', 'a', 20),
	    ('b', 'c', 35),
	    ('c', 'b', 35),
	    ('b', 'd', 25),
	    ('d', 'b', 25),
	    ('c', 'd', 30),
	    ('d', 'c', 30);

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
	WHERE total_cost = (SELECT min(total_cost) FROM x) 
	ORDER BY 1, 2;