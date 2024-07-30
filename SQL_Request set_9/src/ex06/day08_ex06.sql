--Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT sum(rating)
	FROM pizzeria p;
SELECT sum(rating)
	FROM pizzeria p;
COMMIT;
SELECT sum(rating)
	FROM pizzeria p;
	
--Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
	FROM pizzeria p;