SELECT
  Category,
  SUM(`Total Spent`) AS total_turnover
FROM `retail-store-sales-493313.Retail_Store_Sales.red_flag_sales` AS s
WHERE `Total Spent` IS NOT NULL
GROUP BY Category
ORDER BY total_turnover desc;
