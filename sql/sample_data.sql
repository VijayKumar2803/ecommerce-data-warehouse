-- Initial Data

INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', '2023-01-10', 'Delhi'),
(2, 'Priya Verma', 'priya@gmail.com', '2023-02-15', 'Mumbai'),
(3, 'Rahul Das', 'rahul@gmail.com', '2023-03-01', 'Bangalore'),
(4, 'Sneha Reddy', 'sneha@gmail.com', '2023-04-12', 'Hyderabad');

INSERT INTO Products VALUES
(101, 'iPhone 14', 'Electronics', 80000),
(102, 'Running Shoes', 'Sports', 3000),
(103, 'T-shirt', 'Fashion', 1000),
(104, 'Laptop', 'Electronics', 60000);

INSERT INTO Orders VALUES
(1001, 1, '2024-01-10', 'Delivered'),
(1002, 1, '2024-02-05', 'Delivered'),
(1003, 2, '2024-02-20', 'Delivered'),
(1004, 3, '2024-03-15', 'Delivered'),
(1005, 1, '2025-01-12', 'Delivered');

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1, 80000),
(2, 1002, 103, 2, 1000),
(3, 1003, 102, 1, 3000),
(4, 1004, 104, 1, 60000),
(5, 1005, 101, 1, 82000);