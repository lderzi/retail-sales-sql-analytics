------------------------------------------------------------------------------------------------------
SELECT
  *
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

------------------------------------------------------------------------------------------------------
## Possui 1213 itens nulos
SELECT
  Item,
  COUNT(*) AS nb_null
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY Item;

------------------------------------------------------------------------------------------------------
## Possui 609 price nulos
SELECT
  `Price Per Unit`,
  COUNT(*) AS nb_null
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
WHERE `Price Per Unit` IS NULL
GROUP BY `Price Per Unit`;
------------------------------------------------------------------------------------------------------
## ID duplicados analise - não possui Transaction ID duplicados

SELECT
  `Transaction ID`,
  COUNT(*) AS nb_trans
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY `Transaction ID`
HAVING COUNT(*) > 1;
------------------------------------------------------------------------------------------------------
## Existem datas inválidas ou em formatos mistos?
-- não existe datas nulas e distribuição anula aparenta ser coerente (Normalizada)

SELECT
  `Transaction Date`,
  COUNT(*) AS nb_date
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY `Transaction Date`
ORDER BY `Transaction Date` DESC;

SELECT
  COUNT(*) AS nb_null
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
WHERE `Transaction ID` IS NULL;

SELECT
  min(`Transaction Date`) AS min_date,
  max(`Transaction Date`) AS max_date,
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

SELECT
  EXTRACT(Year FROM `Transaction Date`) AS Year,
  COUNT(*) AS nb_year
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY Year
ORDER BY Year;

------------------------------------------------------------------------------------------------------
## Há preços negativos ou iguais a zero?
-- Não há price per unit e total spend com valores negativos

SELECT
  min(`Total Spent`) AS min_turnover,
  max(`Total Spent`) AS max_turnover,
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

------------------------------------------------------------------------------------------------------
## Verificar as quantidade?
-- está no formato string e deve ser float

SELECT
  Quantity,
  COUNT(*) AS nb,
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY Quantity;

------------------------------------------------------------------------------------------------------
## Quantidades fazem sentido?

SELECT
  min(Quantity) AS min_qtd,
  max(Quantity) AS max_qtd,
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

------------------------------------------------------------------------------------------------------
## Analisar as categorias
-- 604 linhas sem quantidades registadas

SELECT
  Category,
  COUNT(*) AS nb_category
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY Category;

------------------------------------------------------------------------------------------------------
SELECT
  `Transaction ID` AS t_id,
  Quantity AS qty,
  `Price Per Unit` AS ppu,
  `Total Spent` AS total_spend,
  CASE
    WHEN (Quantity * `Price Per Unit` = `Total Spent`) THEN 'ok'
    ELSE 'nok'
    END AS cross_check
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`
GROUP BY Quantity, `Transaction ID`, `Price Per Unit`, `Total Spent`
HAVING Quantity >= 1 AND `Price Per Unit` >= 1;

------------------------------------------------------------------------------------------------------
SELECT
  `Transaction ID`,
  `Customer ID`,
  Category,
  Item,
  `Price Per Unit`,
  Quantity,
  `Total Spent`,
  `Payment Method`,
  Location,
  `Transaction Date`,
  `Discount Applied`,
  CASE
    WHEN Quantity >= 1 AND `Price Per Unit` >= 1 AND Item IS NOT NULL
      THEN 'ok'
    ELSE 'nok'
    END AS red_flag
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

------------------------------------------------------------------------------------------------------
SELECT
  `Transaction ID`,
  `Customer ID`,
  Category,
  Item,
  `Price Per Unit`,
  Quantity,
  `Total Spent`,
  `Payment Method`,
  Location,
  `Transaction Date`,
  `Discount Applied`,
  CASE
    WHEN Quantity >= 1 THEN 1
    ELSE 0
    END AS quantity_issue,
  CASE
    WHEN `Price Per Unit` >= 1 THEN 1
    ELSE 0
    END AS price_issue,
  CASE
    WHEN Item IS NOT NULL THEN 1
    ELSE 0
    END AS item_issue,
  CASE
    WHEN
      Item IS NULL
      OR Quantity IS NULL
      OR `Price Per Unit` IS NULL
      THEN 'red_flag'
    ELSE 'ok'
    END AS row_status
FROM `retail-store-sales-493313.Retail_Store_Sales.raw_sales`;

------------------------------------------------------------------------------------------------------
