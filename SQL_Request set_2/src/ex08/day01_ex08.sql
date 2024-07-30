with po as (
	select order_date, person_id as id
	from person_order
)
select order_date, concat(p.name, ' (age:', p.age, ')') as person_information 
	from po
	natural join person p
	order by order_date asc, person_information asc;