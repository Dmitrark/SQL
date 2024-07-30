--Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT sum(rating)
	FROM pizzeria p;
SELECT sum(rating)
	FROM pizzeria p;
COMMIT;
SELECT sum(rating)
	FROM pizzeria p;
	
--Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
	FROM pizzeria p;