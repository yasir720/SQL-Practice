-- Link: https://datalemur.com/questions/matching-skills

-- Find candidates who possess all three required data science skills.
-- The query filters for only the target skills, then identifies candidates with all three.

WITH candidate_skils AS (
  -- Extract only candidates with one of the three required skills.
  SELECT
    candidate_id,
    skill
  FROM
    candidates
  WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
)

SELECT
  candidate_id
FROM
  candidate_skils
GROUP BY
  candidate_id
HAVING
  -- Keep only candidates who have all 3 required skills (count equals 3).
  COUNT(skill) = 3;