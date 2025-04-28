-- Основная таблица транзакций
CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT PRIMARY KEY,
    amount DECIMAL(18,2) NOT NULL,
    customer_id VARCHAR(36) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    status VARCHAR(20) CHECK (status IN ('PENDING', 'COMPLETED', 'FAILED'))
PARTITIONED BY (dt DATE)
STORED AS PARQUET;

-- Справочник клиентов
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    segment VARCHAR(50));