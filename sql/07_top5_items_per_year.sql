WITH
  rank_sales AS (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY year ORDER BY total_amount desc) AS ranking
    FROM
      retail-store-sales-493313.Retail_Store_Sales.vw_sales_item_amount_by_year
  )
SELECT
  Item, year, total_units_sold,total_amount,ranking
FROM rank_sales
WHERE ranking <= 5 
ORDER BY year, ranking
