-- Link: https://datalemur.com/questions/second-day-confirmation

-- Find users who confirmed via text exactly one day after signup.
-- This query joins signup email records to text actions and filters for next-day confirmation.

SELECT
  user_id
FROM emails AS e
INNER JOIN texts AS t
  ON e.email_id = t.email_id
WHERE
  -- Match text actions occurring exactly one day after the email signup date.
  t.action_date = e.signup_date + INTERVAL '1 day'
  AND t.signup_action = 'Confirmed';