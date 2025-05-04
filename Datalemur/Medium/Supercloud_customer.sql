-- Supercloud Customer solution:
-- You can see the exercise here: https://datalemur.com/questions/supercloud-customer

WITH categories_per_customer AS  
  (SELECT
    c.customer_id,
    p.product_category,
    ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY p.product_category) AS categories_purchased
  FROM customer_contracts c JOIN products p
    ON c.product_id = p.product_id
  GROUP BY
    c.customer_id,
    p.product_category
  ORDER BY c.customer_id)

SELECT
  customer_id
FROM categories_per_customer
WHERE categories_purchased = (SELECT COUNT(DISTINCT product_category) FROM products);