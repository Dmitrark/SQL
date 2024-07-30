CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
	IN pperson varchar DEFAULT 'Dmitriy',
	IN pprice int DEFAULT 500,
	IN pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (name varchar) AS $$
BEGIN
	RETURN QUERY
	SELECT p2.name
		FROM person p
		JOIN person_visits pv ON p.id = pv.person_id
		JOIN pizzeria p2 ON pv.pizzeria_id = p2.id
		JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
		WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');