select name
from pizzeria p
where not exists (
    select pizzeria_id
    from person_visits
    where pizzeria_id = p.id
);
	
select name
from pizzeria p
where p.id not in (
    SELECT pizzeria_id
    FROM person_visits
);