-- Q1: Create Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);


-- Q2: Create Products Table
CREATE TABLE products (
    product_id VARCHAR (50) PRIMARY KEY,
    product_name VARCHAR (100) NOT NULL,
    unit_price DECIMAL (10, 2) NOT NULL,
    category VARCHAR (50) NOT NULL
);

-- Q3: Create Orders Table
CREATE TABLE orders (
    order_id VARCHAR (50) PRIMARY KEY,
    customer_id VARCHAR (50) NOT NULL,
    product_id VARCHAR (50) NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
  	sales_rep_id VARCHAR (50) NOT NULL,
  	sales_rep_name VARCHAR (100) Not NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


--Insert customber data (5 records)
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

-- Insert product data (5 records)
INSERT INTO products (product_id, product_name, unit_price, category) VALUES
('P007', 'Pen Set', 250.00, 'Stationery'),
('P008', 'Webcam', 2100.00, 'Electronics'),
('P003', 'Desk Chair', 8500.00, 'Furniture'),
('P004', 'Notebook', 120.00, 'Stationery'),
('P006', 'Standing Desk', 22000.00, 'Furniture');

-- Insert order data (5 records)
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity,sales_rep_id
,sales_rep_name
) VALUES
('ORD1027', 'C002', 'P004', '02-11-2023', 4, 'SR02','Anita Desai'),
('ORD1114', 'C001', 'P007', '06-08-2023', 2, 'SR01','Deepak Joshi'),
('ORD1075', 'C005', 'P003', '18-02-2023', 3, 'SR03','Ravi Kumar'),
('ORD1185', 'C003', 'P008', '15-01-2023', 1, 'SR03','Ravi Kumar'),
('ORD1076', 'C004', 'P006', '16-11-2023', 5, 'SR03','Ravi Kumar');
