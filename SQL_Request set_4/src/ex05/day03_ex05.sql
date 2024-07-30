with visits_p as (
	select p2.name as pizzeria_name 
		from person_visits pv
		left join person p on pv.person_id = p.id
		left join pizzeria p2 on pv.pizzeria_id = p2.id
		where p."name" = 'Andrey'
),
order_p as (
	select p2.name as pizzeria_name
		from person_order po 
		left join person p on po.person_id = p.id
		left join menu m on po.menu_id = m.id
		left join pizzeria p2 on m.pizzeria_id = p2.id
		where p."name" = 'Andrey'
)
select *
	from visits_p vp
except
select *
	from order_p op;