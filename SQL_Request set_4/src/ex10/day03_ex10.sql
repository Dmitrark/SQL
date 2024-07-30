do $$
	declare maxPoId int;
	declare maxPoId2 int;
	begin
		select coalesce(max(id), 0)+1 into maxPoId from person_order po;
		maxPoId2 := maxPoId+1;
		insert into person_order (id, person_id, menu_id, order_date)
		values (maxPoId, 
				(select id from person where name = 'Denis'),
				(select id from menu where pizza_name = 'Sicilian pizza'), '2022-02-24');
		insert into person_order (id, person_id, menu_id, order_date)
		values (maxPoId2, 
				(select id from person where name = 'Irina'),
				(select id from menu where pizza_name = 'Sicilian pizza'), '2022-02-24');
end $$;