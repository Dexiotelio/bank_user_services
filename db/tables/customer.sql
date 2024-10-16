CREATE TYPE gender AS ENUM ('male', 'female', 'other');

CREATE TABLE customer (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    gender gender,
    type_document VARCHAR(50) NOT NULL,
    document_number VARCHAR(50) NOT NULL UNIQUE,
    civil_status VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    date_born DATE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    update_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
)