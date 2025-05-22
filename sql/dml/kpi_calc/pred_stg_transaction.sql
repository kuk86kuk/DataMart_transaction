WITH synthetic_data AS (
  SELECT
    uuid() AS transaction_id,
    CONCAT('CUST', LPAD(CAST(FLOOR(RAND() * 100) AS STRING), 3, '0')) AS customer_id,
    ROUND(RAND() * 1000, 2) AS amount,
    TIMESTAMPADD(DAY, -FLOOR(RAND() * 30), '2025-05-22 00:00:00') AS transaction_date,
    CASE
      WHEN RAND() < 0.3 THEN 'Retail'
      WHEN RAND() < 0.6 THEN 'Travel'
      WHEN RAND() < 0.9 THEN 'Food'
      ELSE 'Other'
    END AS category,
    CASE
      WHEN RAND() < 0.9 THEN 'Completed'
      ELSE 'Pending'
    END AS status
  FROM
    (SELECT explode(sequence(1, 1000)) AS seq) t
)
SELECT * FROM synthetic_data