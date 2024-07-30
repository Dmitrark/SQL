CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $person_audit$
BEGIN
	IF TG_OP = 'INSERT' THEN
		EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address
    	);
    	RETURN NULL;
	ELSIF TG_OP = 'UPDATE' THEN
		EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'U', old.id, old.name, old.age, old.gender, old.address
    	);
    	RETURN NULL;
	ELSIF TG_OP = 'DELETE' THEN
		EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address
    	);
    	RETURN NULL;
    END IF;
END
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person_audit;
DELETE FROM person WHERE id = 10;

SELECT *
	FROM person p;

SELECT *
	FROM person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;