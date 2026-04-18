# retail-sales-sql-analytics
# Retail Sales SQL Analytics Project

## Overview

This project was developed to strengthen my SQL and analytical thinking skills after completing a Data Analytics bootcamp.

The main goal was to simulate a real-world retail analytics workflow using SQL, covering:

- initial data exploration
- data quality assessment
- handling missing values
- creation of quality flags
- analytical query structuring
- business-oriented sales analysis

Instead of focusing only on query writing, I used this project to practice data cleaning decisions, metric definition, and the relationship between data quality and business analysis.

---

## Project Goals

The main objectives of this project were:

- explore a raw retail sales dataset
- identify data quality issues in key columns
- build a non-destructive cleaning strategy
- preserve raw data while creating analysis-ready logic
- organize SQL queries into reusable analytical steps
- answer business-oriented questions using SQL

---

## Dataset Context

The dataset represents retail sales transactions, where each row corresponds to one transaction.

During the initial analysis, I identified missing values in important columns such as:

- `Item`
- `Price Per Unit`
- `Quantity`

Since these fields do not affect every type of analysis in the same way, I decided not to delete incomplete rows immediately.

Instead, I treated data quality as part of the analytical process.

---

## Data Cleaning Approach

One of the main decisions in this project was to **preserve the original data** and avoid deleting rows too early.

Rather than removing incomplete records, I created a quality-oriented approach based on flags and analysis context.

This was important because:

- a transaction can still be counted even if `Item` is missing
- revenue analysis requires valid price and quantity
- product-level analysis requires a valid item name

This helped me understand that data cleaning should be driven by the business question, not only by technical completeness.

---

## SQL Project Structure

The SQL scripts in this repository are organized by analysis stage:

### `01_data_profiling.sql`
Initial exploration of the dataset, including general checks and quality assessment.

### `02_category_analysis.sql`
Category-level analysis to understand sales behavior across product groups.

### `03_day_performance.sql`
Analysis of transaction behavior by day or weekday performance.

### `04_item_amount_by_year.sql`
Yearly analysis of item-related sales volume.

### `05_item_location_analysis.sql`
Analysis of item behavior across different locations.

### `06_quantity_comparison.sql`
Quantity-focused comparisons across relevant dimensions.

### `07_top5_items_per_year.sql`
Analysis of top-performing items by year.

---

## Analytical Focus

This project was designed to go beyond isolated SQL queries.

The main focus was to practice:

- data quality reasoning
- query organization
- business-oriented analysis
- metric interpretation
- analytical structuring for portfolio purposes

Examples of questions explored in this project include:

- How does sales performance vary across categories?
- Which items perform better over time?
- How does performance vary by location?
- Which days show stronger transaction activity?
- What is the impact of incomplete data on analysis?

---

## Key Learnings

Through this project, I improved my skills in:

- SQL for exploratory analysis
- data quality assessment
- handling missing values without losing raw data
- structuring analytical SQL files
- thinking about which fields are required for each metric
- connecting technical SQL work to business questions

One of the most important lessons from this project was understanding that **data completeness depends on the purpose of the analysis**.

---

## Tools Used

- SQL
- Google BigQuery
- GitHub
- GitHub Desktop

---

## Next Steps

Possible next improvements for this project include:

- adding documented views used in the analysis layer
- expanding the project with revenue-focused analysis
- creating a data dictionary for fields and business logic
- adding screenshots of query results and BigQuery views
- building a dashboard based on the SQL outputs

---

## Author

Created by **Luã Derzi**

This project is part of my learning journey in Data Analytics and SQL portfolio development.
