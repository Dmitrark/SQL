do $$
	declare maxPizzaId int;
	begin
		select coalesce(max(id), 0)+1 into maxPizzaId from menu;
		insert into menu (id, pizzeria_id, pizza_name, price)
		values (maxPizzaId,(select id from pizzeria where name = 'Dominos'), 'Sicilian pizza', 900);
end $$;