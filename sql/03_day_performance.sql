--------------------view de dias com melhor performance (total spent)--------------------

SELECT
  EXTRACT(DAYOFWEEK FROM `Transaction Date`) AS dow,
  EXTRACT(year FROM `Transaction Date`) AS year,
  FORMAT_DATE('%A', `Transaction Date`) AS week_day,
  sum(`Total Spent`) AS total_sales,
  ROUND(avg(`Total Spent`), 2) AS avg_tkt,
  SUM(Quantity) AS total_unit_sold,
  COUNT(*) AS nb_transactions,
FROM `retail-store-sales-493313.Retail_Store_Sales.red_flag_sales`
WHERE `Total Spent` IS NOT NULL AND price_issue = 1
GROUP BY year, dow, week_day
ORDER BY dow;