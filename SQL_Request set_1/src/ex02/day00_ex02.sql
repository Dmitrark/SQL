select "name", rating
 	from pizzeria p 
 	where rating >= 3.5 and rating <=5.0
 	order by rating asc;
 	
select "name", rating 
	from pizzeria p
	where rating
	between 3.5 and 5.0
	order by rating asc;