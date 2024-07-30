CREATE TABLE person_discounts (
	id int8 PRIMARY key,
	person_id int8,
	pizzeria_id int8,
	discount NUMERIC,
	CONSTRAINT fk_person_discount_person_id FOREIGN KEY (person_id) REFERENCES person (id),
	CONSTRAINT fk_person_discount_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
	);
	
--SELECT *
--	FROM person_discounts;
