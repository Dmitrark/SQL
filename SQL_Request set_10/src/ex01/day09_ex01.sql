CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $person_audit$
BEGIN
    EXECUTE format(
        'INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) VALUES (%L, %L, %L, %L, %L, %L, %L)',
        NOW(), 'U', old.id, old.name, old.age, old.gender, old.address
    );
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

SELECT *
	FROM person p;

SELECT *
	FROM person_audit;
	
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;