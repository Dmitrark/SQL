WITH lr AS (
	SELECT id, "name", rate_to_usd, updated 
	FROM (SELECT c.id, c.name, c.rate_to_usd, c.updated,
        		ROW_NUMBER() OVER(PARTITION BY c.id ORDER BY c.updated DESC) AS rn
    		FROM Currency c)
    WHERE rn = 1
),
tviu AS (
	SELECT b.user_id, 
			b.currency_id, 
			b."type", b.money, 
			sum(b."money") OVER (PARTITION BY b.user_id, b."type") AS volume, 
			COALESCE (l."rate_to_usd", 1) AS last_rate_to_usd
		FROM balance b
		LEFT JOIN lr l ON b.currency_id = l.id 
)
--SELECT *
--	FROM tviu;
SELECT DISTINCT COALESCE(u."name", 'not defined') AS name,
		COALESCE(u.lastname, 'not defined') AS lastname , t."type",
		t.volume,
		COALESCE(l."name", 'not defined') AS currency_name,
		t.last_rate_to_usd,
		t."volume"*t.last_rate_to_usd AS total_volume_in_usd
	FROM "user" u
	full JOIN tviu t ON u.id = t.user_id
	FULL JOIN lr l ON t.currency_id = l.id
	ORDER BY name DESC, lastname, t."type";
	
SELECT *
	FROM balance b;