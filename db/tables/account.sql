CREATE TABLE account (
    account_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id BIGINT REFERENCES customer(id),
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    interest_rate DECIMAL(15, 2),
    credit_limit DECIMAL(15, 2),
    currency VARCHAR(10),
    opening_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status VARCHAR(20)
)