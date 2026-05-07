-- Link: https://datalemur.com/questions/user-retention

-- Count distinct users active in July 2022 who also had activity in June 2022.
-- This measures month-to-month retention for the selected month.

  SELECT
    DATE_PART('MONTH', curr_month.event_date) AS mth,
    COUNT(DISTINCT curr_month.user_id) AS monthly_active_users
  FROM user_actions AS curr_month
  WHERE EXISTS (
    -- Ensure the same user also appears in the prior month's data.
    SELECT
      last_month.user_id
    FROM
      user_actions AS last_month
    WHERE last_month.user_id = curr_month.user_id
      AND DATE_TRUNC('MONTH', last_month.event_date) =
      DATE_TRUNC('MONTH', curr_month.event_date) - INTERVAL '1 MONTH'
    )
    -- Restrict the report to July 2022 only.
    AND DATE_PART('MONTH', curr_month.event_date) = 7
    AND DATE_PART('YEAR', curr_month.event_date) = 2022
  GROUP BY
    DATE_PART('MONTH', curr_month.event_date);

-- The query returns one row with the month number and retained active user count.