-- Well Paid Employees solution
-- You can see the exercise here: https://datalemur.com/questions/sql-well-paid-employees

WITH managers AS
  (SELECT 
    employee_id,
    name,
    salary
  FROM employee 
  WHERE employee_id IN (SELECT manager_id FROM employee))

SELECT
  e.employee_id,
  e.name
FROM employee e JOIN managers m
  ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;