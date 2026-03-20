-- Star Schema Design Gemini

-- Dimension: dim_date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

-- Dimension: dim_store
CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(100) NOT NULL
);

-- Dimension: dim_product
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Fact Table: fact_sales
CREATE TABLE fact_sales (
    transaction_id VARCHAR(20) PRIMARY KEY,
    date_id INT NOT NULL,
    store_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_revenue DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Loading Cleaned Sample Data

INSERT INTO dim_date (full_date, date_id, month, month_name, year, quarter) VALUES 
('2023-08-29', 20230829, 8, 'August', 2023, 3),
('2023-12-12', 20231212, 12, 'December', 2023, 4),
('2023-02-05', 20230205, 2, 'February', 2023, 1),
('2023-02-20', 20230220, 2, 'February', 2023, 1),
('2023-01-15', 20230115, 1, 'January', 2023, 1),
('2023-08-09', 20230809, 8, 'August', 2023, 3),
('2023-03-31', 20230331, 3, 'March', 2023, 1),
('2023-10-26', 20231026, 10, 'October', 2023, 4),
('2023-12-08', 20231208, 12, 'December', 2023, 4),
('2023-08-15', 20230815, 8, 'August', 2023, 3);

INSERT INTO dim_store (store_name, store_city, store_id) VALUES 
('Chennai Anna', 'Chennai', 'STR001'),
('Delhi South', 'Delhi', 'STR002'),
('Bangalore MG', 'Bangalore', 'STR003'),
('Pune FC Road', 'Pune', 'STR004'),
('Mumbai Central', 'Mumbai', 'STR005');


INSERT INTO dim_product (product_name, category, product_id) VALUES 
('Speaker', 'Electronics', 'PRD001'),
('Tablet', 'Electronics', 'PRD002'),
('Phone', 'Electronics', 'PRD003'),
('Smartwatch', 'Electronics', 'PRD004'),
('Atta 10kg', 'Groceries', 'PRD005'),
('Jeans', 'Clothing', 'PRD006'),
('Biscuits', 'Groceries', 'PRD007');

INSERT INTO fact_sales (transaction_id, date_id, store_id, product_id, customer_id, units_sold, unit_price, total_revenue) VALUES 
('TXN5000', 20230829, 'STR001', 'PRD001', 'CUST045', 3, 49262.78, 147788.34),
('TXN5001', 20231212, 'STR001', 'PRD002', 'CUST021', 11, 23226.12, 255487.31999999998),
('TXN5002', 20230205, 'STR001', 'PRD003', 'CUST019', 20, 48703.39, 974067.8),
('TXN5003', 20230220, 'STR002', 'PRD002', 'CUST007', 14, 23226.12, 325165.68),
('TXN5004', 20230115, 'STR001', 'PRD004', 'CUST004', 10, 58851.01, 588510.1),
('TXN5005', 20230809, 'STR003', 'PRD005', 'CUST027', 12, 52464.0, 629568.0),
('TXN5006', 20230331, 'STR004', 'PRD004', 'CUST025', 6, 58851.01, 353106.06),
('TXN5007', 20231026, 'STR004', 'PRD006', 'CUST041', 16, 2317.47, 37079.52),
('TXN5008', 20231208, 'STR003', 'PRD007', 'CUST030', 9, 27469.99, 247229.91),
('TXN5009', 20230815, 'STR003', 'PRD004', 'CUST020', 3, 58851.01, 176553.03);



SELECT * FROM dim_date
SELECT * FROM dim_store
SELECT * FROM dim_product
SELECT * FROM fact_sales

