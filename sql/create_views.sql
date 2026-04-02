CREATE OR REPLACE VIEW `caramel_id202729.gold_devdb.vw_sales_summary` AS
SELECT
  category,
  COUNT(order_id) AS total_orders,
  SUM(quantity) AS total_quantity,
  SUM(total_amount) AS total_revenue,
  AVG(price) AS avg_price
FROM `caramel_id202729.gold_devdb.sales_summary`
GROUP BY category;

CREATE OR REPLACE VIEW `caramel_id202729.gold_devdb.vw_top_products` AS
SELECT
  product_name,
  SUM(quantity) AS total_quantity,
  SUM(total_amount) AS total_revenue
FROM `caramel_id202729.gold_devdb.sales_summary`
GROUP BY product_name
ORDER BY total_revenue DESC;
