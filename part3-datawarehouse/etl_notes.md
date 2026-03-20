## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats such as "29/08/2023", "12-12-2023" and "2023-02-05". These different formats can cause errors in SQL queries and make time-based analysis difficult.

Resolution: All dates were converted into the standardized ISO format "YYYY-MM-DD". A dedicated date dimension table (dim_date) was created with additional attributes such as month, month_name, year, and quarter to support efficient time-based reporting.

### Decision 2 — Fixing Category Casing Inconsistency
Problem: The product category column contained inconsistent casing such as "electronics", "Electronics", "Grocery", and "groceries". This inconsistency would result in incorrect grouping during aggregation queries.

Resolution: All category values were standardized into consistent labels such as "Electronics", "Clothing" and "Groceries" before loading the data into the dim_product table. This ensures accurate reporting and aggregation in queries.

### Decision 3 — Creating Surrogate Keys for Dimension Tables
Problem: The raw dataset did not provide unique numeric identifiers for dimensions such as stores, products, and dates. Instead, it contained textual attributes like store_name and product_name, which may not be efficient for joins.

Resolution: Surrogate keys (store_id, product_id, and date_id) were created for each dimension table during the ETL process. These keys provide unique identifiers for dimension records and improve join performance in the fact table while maintaining a clean star schema design.