-- Sending vs. opening snaps solution
-- You can see the exercise here: https://datalemur.com/questions/time-spent-snaps

WITH send_open_activities AS
  (SELECT
    age.age_bucket,
    SUM(CASE WHEN act.activity_type = 'open' THEN act.time_spent ELSE 0 END) AS total_open_time,
    SUM(CASE WHEN act.activity_type = 'send' THEN act.time_spent ELSE 0 END) AS total_send_time
  FROM activities act JOIN age_breakdown age
    ON act.user_id = age.user_id
  WHERE activity_type IN ('open', 'send')
  GROUP BY age_bucket)

SELECT
  age_bucket,
  ROUND((100.0 * total_send_time / (total_send_time + total_open_time)), 2) AS pct_send_time,
  ROUND((100.0 * total_open_time / (total_send_time + total_open_time)), 2) AS pct_open_time
FROM send_open_activities;
