-- Top Three Salaries solution:
-- You can see the exercise here: https://datalemur.com/questions/sql-top-three-salaries

WITH ranked_salaries AS
  (SELECT
    d.department_name,
    e.name,
    e.salary,
    dense_rank() OVER (PARTITION BY d.department_name ORDER BY e.salary DESC) AS ranking
  FROM employee e JOIN department d
    ON e.department_id = d.department_id
  ORDER BY
    d.department_name,
    e.salary DESC,
    e.name)
  
  SELECT
    department_name,
    name,
    salary
  FROM ranked_salaries
  WHERE ranking <=3;