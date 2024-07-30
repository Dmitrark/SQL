select p.name as person_name1, p2.name as person_name2, p.address as common_address
	from person p
	join person p2 on p.address = p2.address and p.name < p2.name
	order by p.name asc, p2.name asc;