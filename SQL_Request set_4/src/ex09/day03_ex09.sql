do $$
	declare maxPvId int;
	declare maxPvId2 int;
	begin
		select coalesce(max(id), 0)+1 into maxPvId from person_visits pv;
		maxPvId2 := maxPvId+1;
		insert into person_visits (id, person_id, pizzeria_id, visit_date)
		values (maxPvId,
				(select id from person where name = 'Denis'), 
				(select id from pizzeria  where name = 'Dominos'), '2022-02-24');
		insert into person_visits (id, person_id, pizzeria_id, visit_date)
		values (maxPvId2,
				(select id from person where name = 'Irina'), 
				(select id from pizzeria  where name = 'Dominos'), '2022-02-24');
end $$;