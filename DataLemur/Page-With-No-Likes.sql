-- Link: https://datalemur.com/questions/sql-page-with-no-likes

-- Find all pages that have never received any likes.
-- A LEFT JOIN returns all pages, matching like records where they exist.
-- NULL values in the page_likes side indicate pages with zero likes.

SELECT
  p.page_id
FROM
  pages AS p
LEFT JOIN page_likes AS pl
  ON p.page_id = pl.page_id
-- Filter to keep only rows where no matching like was found.
WHERE pl.page_id IS NULL;