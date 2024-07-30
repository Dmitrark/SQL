select id as object_id, pizza_name as object_name
	from menu m
union
select id as object_id, "name" as object_name
	from person p
order by object_id asc, object_name asc;