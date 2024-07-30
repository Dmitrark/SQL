--Session 1
BEGIN;
SELECT *
	FROM pizzeria p;
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
	FROM pizzeria p;
	
--Session 2
BEGIN;
SELECT *
	FROM pizzeria p;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
	FROM pizzeria p;