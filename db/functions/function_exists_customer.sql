CREATE OR REPLACE FUNCTION customer_exists(p_email VARCHAR)
RETURN BOOLEAN AS &&
BEGIN
    RETURN SELECT EXISTS (
        SELECT 1
        FROM customer
        WHERE email = p_email
    );
END;
$$ LANGUAGE plpgsql;
