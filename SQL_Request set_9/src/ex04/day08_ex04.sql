--Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT *
	FROM pizzeria p;
SELECT *
	FROM pizzeria p;
COMMIT;
SELECT *
	FROM pizzeria p;
	
--Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
SELECT *
	FROM pizzeria p;