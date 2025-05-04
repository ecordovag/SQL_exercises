-- Highest-Grossing Items solution
-- YO can see the exercise here: https://datalemur.com/questions/sql-highest-grossing

WITH spend_rankings AS 
  (SELECT
    category,
    product,
    SUM(spend) AS total_spend,
    row_number() OVER (partition by category order by SUM(spend) DESC) AS ranking
  FROM product_spend
  WHERE date_part('year', transaction_date) = '2022'
  GROUP BY
    category,
    product
  ORDER BY 
    category, 
    total_spend DESC)

SELECT 
  category,
  product,
  total_spend
FROM spend_rankings
WHERE ranking = 1 OR ranking = 2;
