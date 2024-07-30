CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC[])
RETURNS NUMERIC AS $$
DECLARE min_value NUMERIC := arr[1];
BEGIN
    FOR i IN 1..array_length(arr, 1)
    LOOP
        IF arr[i] < min_value THEN
            min_value := arr[i];
        END IF;
    END LOOP;
    RETURN min_value;
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);