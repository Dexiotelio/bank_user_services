CREATE OR REPLACE FUNCTION validate_email_format(email TEXT)
RETURN BOOLEAN AS $$
BEGIN
    RETURN email ~ '^[a-zA-Z0-9!#$%&''*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&''*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validate_email_uniqueness(email TEXT, id BIGINT DEFAULT NULL)
RETURN BOOLEAN AS $$
BEGIN
    RETURN NOT EXISTS (
        SELECT 1
        FROM customer
        WHERE email = email AND (id IS NULL OR customer.id != id)
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validate_email()
RETURN TRIGGER AS $$
BEGIN
    IF NOT validate_email_format(NEW.email) THEN
        RAISE EXCEPTION 'Invalid email format.';
    END IF;

    IF NOT validate_email_uniqueness(NEW.email, NEW.id) THEN
        RAISE EXCEPTION 'Email already in use.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;