-- Second day Confirmation solution
-- You can see the exercise here: https://datalemur.com/questions/second-day-confirmation

SELECT 
  e.user_id
FROM emails e JOIN texts t 
  ON e.email_id = t.email_id
WHERE 
  t.signup_action = 'Confirmed' AND
  t.action_date::date - e.signup_date::date = 1;