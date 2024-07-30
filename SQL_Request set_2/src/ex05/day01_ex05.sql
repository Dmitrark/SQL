select p.id as "person.id", p.name as "person.name", p.age, p.gender, p.address,
p2.id as "pizzeria.id", p2.name as "pizzeria.name", p2.rating
	from person p 
	cross join pizzeria p2
	order by p.id asc, p2.id;