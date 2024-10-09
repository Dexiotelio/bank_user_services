CREATE OR REPLACE FUNCTION create_user(
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_email VARCHAR,
    p_password VARCHAR,
    p_type_user p_type_user DEFAULT 'client'
)   RETURNS VOID AS &&
BEGIN
    RAISE NOTICE 'Creating user with name: % % and email: %', p_first_name, p_last_name, p_email;

    INSERT INTO 'users' (first_name, last_name, mail, password, p_type_user)
    VALUES (p_first_name, p_last_name, p_email, p_password, p_type_user),

    RAISE NOTICE 'User has been created successfully!';
END;
$$ LANGUAGE plpgsql;