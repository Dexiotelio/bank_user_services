CREATE TABLE customer_audit (
    audit_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    operation_type VARCHAR(50) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    gender gender,
    type_document VARCHAR(50) NOT NULL,
    document_number VARCHAR(50) NOT NULL,
    civil_status VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    date_born DATE NOT NULL,
    changed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    changed_by VARCHAR(100) NOT NULL
)