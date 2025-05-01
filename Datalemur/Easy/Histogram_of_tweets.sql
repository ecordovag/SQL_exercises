-- Histogram of Tweets solution
-- You can see the exercise here: https://datalemur.com/questions/sql-histogram-tweets

WITH tweet_count_by_user AS
  (SELECT 
    user_id,
    count(tweet_id) AS tweet_counts
  FROM tweets
  WHERE date_part('year', tweet_date) = '2022'
  GROUP BY
    user_id)

SELECT
  tweet_counts,
  COUNT(user_id) AS user_count
FROM tweet_count_by_user
GROUP BY tweet_counts;