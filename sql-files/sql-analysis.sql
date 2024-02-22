-- 1.

-- Are there certain products that are getting refunded more frequently than others?

-- Join orders and order_status tables to match products with refund status.
-- Consolidate and validate product names using CASE.
-- Create helper column to identify refunds (1 = refund, 0 = no refund).
-- Sum helper column for total number of refunds.
-- Average helper column for refund rate; convert to percent (x 100) and convert to integer.
-- Order by descending refund rate to see products with highest refund rates.

SELECT
  CASE
    WHEN orders.product_name LIKE '%gaming monitor' THEN '27in 4K Gaming Monitor'
    WHEN orders.product_name LIKE 'bose%' THEN INITCAP(orders.product_name, ' ')
    ELSE orders.product_name
  END AS product_cleaned,
  SUM(
    CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0
    END) AS refunds,
  CAST(
    ROUND(
      AVG(
        CASE
          WHEN order_status.refund_ts IS NOT NULL THEN 1
          ELSE 0
        END)*100,0) AS INTEGER) AS refund_rate
FROM core.orders
JOIN core.order_status
ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC;

-- 2.

-- Within each region, what is the most popular product?

-- Join orders, customers, and geo_lookup tables to match regions and orders.
-- Use a CTE to add total number of orders and total price sold per region.
-- Use another CTE and ROW_NUMBER() to rank the results by descending number of orders within each region.
-- Filter results to show top product sold in each region (i.e., where rank = 1).

WITH sales_by_product AS (
  SELECT geo_lookup.region,
    orders.product_name,
    COUNT(orders.product_name) AS orders,
    ROUND(SUM(orders.usd_price),2) AS price
  FROM core.orders
  JOIN core.customers
  ON orders.customer_id = customers.id
  JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country
  GROUP BY 1, 2
  ORDER BY 1, 3 DESC),

 product_ranking AS (
  SELECT *,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY orders DESC) AS ranking
  FROM sales_by_product)

SELECT region,
  product_name,
  orders,
  price
FROM product_ranking
WHERE ranking = 1
ORDER BY 3 DESC;
