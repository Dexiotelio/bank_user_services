CREATE OR REPLACE FUNCTION user_exists(p_email VARCHAR)
RETURN BOOLEAN AS &&
BEGIN
    RETURN SELECT EXISTS (
        SELECT 1
        FROM 'users'
        WHERE email = p_email
    );
END;
$$ LANGUAGE plpgsql;
