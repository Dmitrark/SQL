select id as menu_id
	from menu m
	where not exists (
	select *
		from person_order po
		where m.id = po.menu_id
	)
	order by menu_id asc;