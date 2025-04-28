-- Обогащение данных транзакций
WITH enriched AS (
    SELECT 
        t.*,
        r.region_name,
        CASE 
            WHEN t.amount > 10000 THEN 'LARGE'
            ELSE 'STANDARD'
        END as tx_type
    FROM stg_transactions t
    JOIN ref.regions r ON t.region_id = r.id
    WHERE t.dt = '${processing_date}'
)
SELECT * INTO transactions PARTITION (dt = '${processing_date}')
FROM enriched;