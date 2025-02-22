CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $person_audit$
BEGIN
    EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address
    );
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

SELECT *
	FROM person p;

SELECT *
	FROM person_audit;
	
DELETE FROM person WHERE id = 10;