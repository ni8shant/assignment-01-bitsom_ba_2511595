-- Part 3: Data Warehouse Star Schema
-- Fact and Dimension tables for retail analytics

-- Dimension: Date
CREATE TABLE dim_date (
  date_id INT PRIMARY KEY,
  date DATE NOT NULL,
  month INT,
  year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
  store_id INT PRIMARY KEY,
  store_name VARCHAR(100),
  city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50)
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
  sales_id INT PRIMARY KEY,
  date_id INT,
  store_id INT,
  product_id INT,
  quantity INT,
  revenue DECIMAL(10, 2),
  FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
  FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
  FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
