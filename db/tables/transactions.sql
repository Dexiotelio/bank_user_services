CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(account_id),
    transaction_type VARCHAR(50),
    amount DECIMAL(15, 2),
    currency_type VARCHAR(10),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    transaction_status VARCHAR(20),
    transaction_reference VARCHAR(50),
    validation_date TIMESTAMP
);
