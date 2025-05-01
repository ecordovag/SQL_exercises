-- User's third transaction solution
-- You can see de exercise here: https://datalemur.com/questions/sql-third-transaction

WITH transaction_orders AS
  (SELECT
    user_id,
    spend,
    transaction_date,
    row_number() OVER (PARTITION BY user_id ORDER BY transaction_date) AS transaction_order
  FROM transactions)

SELECT
  user_id,
  spend,
  transaction_date
FROM transaction_orders
WHERE transaction_order = 3;