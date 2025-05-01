-- Second highest salaty solution
-- You can see the exercise here: https://datalemur.com/questions/sql-second-highest-salary

WITH salary_rankings AS
  (SELECT
    name,
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS ranking
  FROM employee)

SELECT DISTINCT
  salary
FROM salary_rankings
WHERE ranking = 2;