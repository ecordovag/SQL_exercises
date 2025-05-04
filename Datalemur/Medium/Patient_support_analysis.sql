-- Patient Support Analysis solution:
-- You can see the exercise here: https://datalemur.com/questions/uncategorized-calls-percentage

WITH count_nulls AS 
  (SELECT
    count(call_date) AS total_count,
    SUM(CASE wHEN call_category IS NULL THEN 1 ELSE 0 END) AS null_count,
    SUM(CASE WHEN call_category = 'n/a' THEN 1 ELSE 0 END) AS na_count
  FROM callers)

SELECT
  ROUND(((100.0 * (null_count + na_count ))/ total_count), 1) AS uncategorised_pct
FROM count_nulls;