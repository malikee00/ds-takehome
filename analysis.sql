CREATE TABLE transaction (
    order_id VARCHAR(64),
    customer_id VARCHAR(64),
    order_date_raw VARCHAR(20),  -- into string
    payment_value DECIMAL(10,2),
    decoy_flag VARCHAR(10),
    decoy_noise VARCHAR(10)
);

SELECT
  customer_id,
  DATEDIFF(
    (SELECT MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y')) FROM transaction),
    MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y'))
  ) AS recency,
  COUNT(order_id) AS frequency,
  SUM(payment_value) AS monetary,
  
  CASE
    WHEN DATEDIFF(
      (SELECT MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y')) FROM transaction),
      MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y'))
    ) <= 30 THEN 'Recent Buyer'
    
    WHEN COUNT(order_id) >= 10 AND SUM(payment_value) >= 1000 THEN 'Loyal High Spender'
    WHEN COUNT(order_id) >= 10 THEN 'Frequent Buyer'
    WHEN SUM(payment_value) >= 1000 THEN 'Big Spender'
    WHEN DATEDIFF(
      (SELECT MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y')) FROM transaction),
      MAX(STR_TO_DATE(order_date_raw, '%d/%m/%Y'))
    ) > 300 THEN 'At Risk'
    ELSE 'Others'
  END AS segment

FROM transaction
GROUP BY customer_id
ORDER BY CAST(customer_id AS UNSIGNED);

-- QUERY: Anomaly Detection
-- sneak peek for knowing top 10 abs_diff
SELECT 
  order_id,
  customer_id,
  order_date_raw,
  payment_value,
  decoy_flag,
  decoy_noise,
  ABS(payment_value - decoy_noise) AS abs_diff
FROM transaction
ORDER BY abs_diff DESC
LIMIT 10;

-- MEASURING MOST ANOMALIEST DECOY_FLAG
-- Knowing the treshold

SELECT COUNT(*) AS total_rows FROM abs_diff_values;

-- Q1
SELECT abs_diff FROM abs_diff_values
LIMIT 1 OFFSET 2499;  -- 25% dari 10.000

-- Q3
SELECT abs_diff FROM abs_diff_values
LIMIT 1 OFFSET 7499;  -- 75% dari 10.000

-- 11.069999999999993 (Q1)
-- 41.16999999999996 (Q2)
-- 30 (IQR = Q3 - Q1)

SELECT 41.17 + 1.5 * (41.17 - 11.07) AS threshold;
-- 86.320 (Treshold)

-- 1. Merging total transaction on CTE
WITH 
total_trans AS (
    SELECT 
        decoy_flag,
        COUNT(*) AS total_trans
    FROM transaction
    GROUP BY decoy_flag
),

anomaly_transactions AS (
    SELECT 
        decoy_flag,
        COUNT(*) AS anomaly_count
    FROM transaction
    WHERE ABS(payment_value - decoy_noise) > 86.32
    GROUP BY decoy_flag
)

-- Adding them and measure the anomaly percentage
SELECT 
    t.decoy_flag,
    t.total_trans,
    COALESCE(a.anomaly_count, 0) AS anomaly_count,
    ROUND(COALESCE(a.anomaly_count, 0) / t.total_trans * 100, 2) AS anomaly_pct
FROM total_trans t
LEFT JOIN anomaly_transactions a
    ON t.decoy_flag = a.decoy_flag
ORDER BY anomaly_pct DESC;