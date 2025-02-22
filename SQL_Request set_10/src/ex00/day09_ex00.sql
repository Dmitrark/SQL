CREATE TABLE person_audit (
	created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	type_event char(1) NOT null DEFAULT 'I',
	row_id bigint NOT null,
	name varchar,
	age integer,
	gender varchar,
	address varchar,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);
	
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $person_audit$
BEGIN
    EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address
    );
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

SELECT *
	FROM person p;

SELECT *
	FROM person_audit;
	
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

DROP TABLE person_audit;
DELETE FROM person WHERE id = 10;