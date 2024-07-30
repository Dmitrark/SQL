select person_id
	from person_order po
	where order_date = '2022-01-07'
except all
select person_id
	from person_visits pv 
	where visit_date = '2022-01-07';
	
-- Без понятия что от меня хотят по заданию, написал пока что так.