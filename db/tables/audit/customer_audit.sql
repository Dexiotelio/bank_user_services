CREATE TABLE customer_audit (
    audit_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id NOT NULL REFERENCES customer(id) ON DELETE CASCADE,
    operation_type VARCHAR(50) NOT NULL,
    changed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    changed_by BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    operation_type VARCHAR(50) NOT NULL,
    previous_value JSONB,
    new_value JSONB,
    change_details TEXT
)