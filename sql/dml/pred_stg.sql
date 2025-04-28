-- Загрузка данных в стейджинг с партиционированием
INSERT OVERWRITE TABLE stg_transactions PARTITION (dt = '${processing_date}')
SELECT 
    t.id,
    t.amount,
    t.customer_id,
    t.transaction_time,
    t.status,
    c.segment
FROM source.raw_transactions t
LEFT JOIN ref.customers c ON t.customer_id = c.id
WHERE t.processing_date = '${processing_date}'
CLUSTER BY customer_id;