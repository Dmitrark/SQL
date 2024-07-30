with SortedPerson as (
	select name as object_name
	from person p
	order by name
),
SortedMenu as (
	select pizza_name as object_name
	from menu m
	order by pizza_name
)
select * from SortedPerson
union all
select * from SortedMenu;