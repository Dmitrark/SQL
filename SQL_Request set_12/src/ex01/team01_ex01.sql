insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
	
WITH past AS ( 
SELECT b."money", b."type", u."name", u.lastname, c."name" AS currency_name, b.money*c.rate_to_usd AS currency_in_usd, b.updated AS b_up, c.updated AS c_up, ROW_NUMBER() OVER (PARTITION BY b.updated, c."name", u.name, u.lastname ORDER BY c.updated desc) AS rn
	FROM balance b
	LEFT JOIN "user" u ON b.user_id = u.id
	LEFT JOIN currency c ON b.currency_id = c.id AND b.updated >= c.updated
	WHERE c."name" IS NOT NULL
),
future AS ( 
SELECT b."money", b."type", u."name", u.lastname, c."name" AS currency_name, b.money*c.rate_to_usd AS currency_in_usd, b.updated AS b_up, c.updated AS c_up, ROW_NUMBER() OVER (PARTITION BY b.updated, c."name", u.name, u.lastname ORDER BY c.updated) AS rn
	FROM balance b
	LEFT JOIN "user" u ON b.user_id = u.id
	LEFT JOIN currency c ON b.currency_id = c.id AND b.updated < c.updated
	WHERE c."name" IS NOT NULL
),
"all" AS (
(SELECT p.name, p.lastname, p.currency_name, p.currency_in_usd
	FROM past p
	WHERE rn = 1)
UNION
(SELECT f.name, f.lastname, f.currency_name, f.currency_in_usd
	FROM future f
	WHERE rn = 1 AND NOT EXISTS (SELECT * FROM past p WHERE f.money = p.money AND f."type" = p."type"))
)
SELECT COALESCE(a.name, 'not defined') AS "name", COALESCE(a.lastname, 'not defined') AS "lastname", a.currency_name, a.currency_in_usd
	FROM "all" a
ORDER BY 1 DESC, 2 asc, 3 asc;