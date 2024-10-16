CREATE TYPE gender AS ENUM ('male', 'female', 'other');
CREATE TYPE civil_status AS ENUM (
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'In a Relationship',
    'Separated',
    'Engaged',
    'Cohabiting'
);
CREATE TYPE document_type AS ENUM (
    'ID Card',
    'Passport',
    'Driver\'s License',
    'Birth Certificate',
    'Social Security Number',
    'Residency Permit'
);

CREATE TABLE customer (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY
    first_name VARCHAR(100) NOT NULL CHECK (first_name ~ '^[A-Za-zÀ-ÿ[[:space:]]]+$')
    last_name VARCHAR(100) NOT NULL CHECK (last_name ~ '^[A-Za-zÀ-ÿ[[:space:]]]+$')
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE CHECK (phone ~ '^[0-9]{10,15}$'),
    gender gender,
    document_type document_type,
    document_number VARCHAR(50) NOT NULL UNIQUE,
    civil_status civil_status,
    address VARCHAR(100) NOT NULL,
    date_born DATE NOT NULL CHECK (date_born <= CURRENT_DATE - INTERVAL '18 years'),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    update_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
)

CREATE INDEX idx_customer_email ON customer (email);
CREATE INDEX idx_customer_gender ON customer (gender);
CREATE INDEX idx_customer_type_document ON customer (type_document);
CREATE INDEX idx_customer_civil_status ON customer (civil_status);
CREATE INDEX idx_customer_date_born ON customer (date_born);
CREATE INDEX idz_customer_age_gender_civil_status ON customer (date_born, gender, civil_status);