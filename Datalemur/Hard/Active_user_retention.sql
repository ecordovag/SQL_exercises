-- Active User Retention solution:
-- You can see the exercise here: https://datalemur.com/questions/user-retention

WITH dates AS  
  (SELECT DISTINCT
    user_id,
    event_date,
    LAG(event_date) OVER (PARTITION BY user_id ORDER BY event_date ASC) AS previous_date
  FROM user_actions
  WHERE date_part('month', event_date) IN (6,7)
  ORDER BY 
    user_id,
    event_date)

SELECT
  date_part('month', event_date)::INTEGER AS month,
  COUNT(user_id) AS monthly_active_users
FROM dates
WHERE date_part('month', event_date) = 7 AND date_part('month', previous_date) = 6
GROUP BY date_part('month', event_date)::INTEGER