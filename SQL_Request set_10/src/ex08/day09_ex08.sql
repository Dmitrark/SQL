CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int DEFAULT 10)
RETURNS TABLE (numbers int) AS $$
DECLARE 
    fib_sum int := 0;
    fn int := 0;
    fn2 int := 1;
BEGIN
	IF pstop <= 0 THEN
		RAISE EXCEPTION 'Значение не может быть меньше или равно нулю.';
		RETURN;
	ELSIF pstop = 1 THEN
		RETURN QUERY SELECT 0;
		RETURN;
	END IF;
    RETURN QUERY SELECT 0;
    RETURN QUERY SELECT 1;
	LOOP
        fib_sum := fn + fn2;
        fn := fn2;
        fn2 := fib_sum;
        IF fib_sum < pstop THEN
            RETURN QUERY SELECT fib_sum;
        ELSE
            EXIT;
        END IF;
    END LOOP;
    
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(20);

select * from fnc_fibonacci();