select p."name", p.rating
	from pizzeria p
	left join person_visits pv on pv.pizzeria_id = p.id 
	where pv.id is null;