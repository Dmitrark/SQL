CREATE INDEX idx_person_name ON person (upper(name));

set enable_seqscan = off;
EXPLAIN analyze SELECT *
	FROM person p
	WHERE upper(name) = 'Kate';