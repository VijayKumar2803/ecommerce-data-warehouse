-- SCD Type 2 Example

UPDATE DimCustomer
SET end_date = CURRENT_DATE, is_current = FALSE
WHERE customer_id = 1 AND is_current = TRUE;

INSERT INTO DimCustomer (customer_id, name, city, start_date, end_date, is_current)
VALUES (1, 'Amit Sharma', 'Pune', CURRENT_DATE, NULL, TRUE);