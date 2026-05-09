-- Link: https://datalemur.com/questions/sql-histogram-tweets

-- Build a histogram showing the distribution of tweet frequencies among users in 2022.
-- Each row in the result shows how many users tweeted exactly X times that year.

WITH user_tweet_count AS ( 
  -- Count total tweets per user, filtering for 2022 only.
  SELECT
    user_id,
    COUNT(tweet_id) AS tweet_count_per_user
  FROM
    tweets
  WHERE
    DATE_PART('YEAR', tweet_date) = 2022
  GROUP BY
    user_id
)

SELECT
  tweet_count_per_user AS tweet_bucket,
  COUNT(user_id) AS user_num
FROM
  user_tweet_count
-- Group by tweet count to create histogram buckets.
GROUP BY
  tweet_count_per_user
-- Order by frequency (highest first) to identify most common tweet volumes.
ORDER BY
  user_num DESC;