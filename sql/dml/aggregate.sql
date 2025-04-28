-- Агрегация по клиентам
INSERT OVERWRITE TABLE agg_customer_transactions
PARTITION (dt = '${processing_date}')
SELECT 
    customer_id,
    COUNT(*) as tx_count,
    SUM(amount) as total_amount,
    AVG(amount) as avg_amount
FROM transactions
WHERE dt = '${processing_date}'
GROUP BY customer_id;