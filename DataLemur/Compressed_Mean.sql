-- Link: https://datalemur.com/questions/alibaba-compressed-mean

-- Compute the weighted mean number of items per order using compressed frequency data.
-- Each row represents an item count value and how many orders had that item count.
SELECT
  ROUND(
    SUM(item_count::DECIMAL * order_occurrences) -- weighted total items across all orders
    / SUM(order_occurrences), 1) AS mean -- average items per order
FROM items_per_order;
