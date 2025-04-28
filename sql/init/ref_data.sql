-- Инициализация справочников
INSERT OVERWRITE TABLE ref.customers
SELECT * FROM legacy.customer_data
WHERE valid_to IS NULL;

INSERT OVERWRITE TABLE ref.regions
SELECT id, name FROM legacy.region_mapping;