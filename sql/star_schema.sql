-- Dimension Tables

CREATE TABLE DimCustomer (
    customer_sk SERIAL PRIMARY KEY,
    customer_id INT,
    name VARCHAR(100),
    city VARCHAR(50),
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN
);

CREATE TABLE DimProduct (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE DimDate (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

-- Fact Table

CREATE TABLE FactSales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date_id DATE,
    quantity INT,
    total_amount NUMERIC(10,2)
);