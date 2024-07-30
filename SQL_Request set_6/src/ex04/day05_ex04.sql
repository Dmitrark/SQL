CREATE unique INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

set enable_seqscan = off;
EXPLAIN ANALYZE 
SELECT * 
	FROM menu 
	WHERE pizzeria_id = 1 AND pizza_name = 'Margherita';