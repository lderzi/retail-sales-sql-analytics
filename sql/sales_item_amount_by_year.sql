WITH
  sales_year AS (
    SELECT
      Item,
      Quantity,
      `Total Spent`,
      EXTRACT(Year FROM `Transaction Date`) AS year,
    FROM retail-store-sales-493313.Retail_Store_Sales.red_flag_sales
  )
SELECT
  Item,
  year,
  sum(Quantity) AS total_units_sold,
  sum(`Total Spent`) as total_amount
FROM sales_year
WHERE Item is not null 
GROUP BY Item, year
