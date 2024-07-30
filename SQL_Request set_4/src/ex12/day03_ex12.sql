insert into person_order (id, person_id, menu_id, order_date)
select g+(select max(id) from person_order) as id,
		id as person_id,
		(select id from menu where pizza_name = 'Greek pizza') as menu_id,
		'2022-02-25' as order_date
		from person
		inner join
		generate_series(1,(select count(*) from person)) as g on g=person.id
