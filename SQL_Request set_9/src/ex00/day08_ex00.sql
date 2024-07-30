-- Session #1
BEGIN;	
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

SELECT *
	FROM pizzeria p;
	
COMMIT;

--Session #2
SELECT *
	FROM pizzeria p;