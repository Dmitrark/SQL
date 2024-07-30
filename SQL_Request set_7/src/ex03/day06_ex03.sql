CREATE unique INDEX idx_person_discount_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF; 
EXPLAIN analyze SELECT person_id, pizzeria_id 
	FROM person_discounts pd;