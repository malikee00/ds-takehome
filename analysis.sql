CREATE TABLE transaction (
    order_id VARCHAR(64),
    customer_id VARCHAR(64),
    order_date_raw VARCHAR(20),  -- ubah sementara jadi string
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
