SELECT
  Location,
  Item,
  COUNT(*) AS nb_item
FROM `retail-store-sales-493313.Retail_Store_Sales.red_flag_sales` AS s
WHERE item_issue = 1
GROUP BY Item, Location
ORDER BY nb_item DESC
LIMIT 5;
