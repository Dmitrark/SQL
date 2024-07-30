CREATE OR REPLACE FUNCTION fnc_persons(IN pgender TEXT DEFAULT 'female')
RETURNS SETOF person
AS $$
	SELECT *
	FROM person
	WHERE gender = pgender;
$$ LANGUAGE SQL STABLE;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();