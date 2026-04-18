WITH
  media_global AS (
    SELECT
      ROUND(avg(Quantity), 0) AS avg_global,
    FROM `retail-store-sales-493313.Retail_Store_Sales.red_flag_sales`
    WHERE quantity_issue = 1
  ),
  media_category AS (
    SELECT
      Category,
      ROUND(avg(Quantity), 0) AS avg_category
    FROM `retail-store-sales-493313.Retail_Store_Sales.red_flag_sales`
    WHERE quantity_issue = 1
    GROUP BY Category
  )
SELECT
  c.Category,
  c.avg_category,
  g.avg_global,
  CASE
    WHEN avg_category > avg_global THEN 'acima da média'
    WHEN avg_category < avg_global THEN 'abaixo da média'
    ELSE 'na média global'
    END AS comparacao
FROM media_category AS c
CROSS JOIN media_global AS g
ORDER BY comparacao desc