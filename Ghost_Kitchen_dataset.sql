-- ========================================================
-- SECTION 1: SCHEMA STRUCTURE (DDL)
-- ========================================================

-- 1. Create Menu Items Table
CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    cost_to_make DECIMAL(10,2) NOT NULL
);

-- 2. Create Delivery Partners Table
CREATE TABLE Delivery_Partners (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(50) NOT NULL
);

-- 3. Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    item_id INT,
    driver_id INT,
    order_timestamp TIMESTAMP,
    pickup_timestamp TIMESTAMP,
    delivery_timestamp TIMESTAMP,
    order_status VARCHAR(20),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id),
    FOREIGN KEY (driver_id) REFERENCES Delivery_Partners(driver_id)
);

-- 4. Create Customer Reviews Table
CREATE TABLE Customer_Reviews (
    review_id INT PRIMARY KEY,
    order_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- ========================================================
-- SECTION 2: DATA POPULATION (DML)
-- ========================================================

-- 1. Populate Menu_Items [cite: 32]
INSERT INTO Menu_Items (item_id, item_name, category, price, cost_to_make) VALUES
(1, 'Truffle Parmesan Fries', 'Appetizer', 8.50, 2.10),
(2, 'Spicy Buffalo Wings', 'Appetizer', 12.00, 4.50),
(3, 'Classic Cheeseburger', 'Main', 14.95, 5.20),
(4, 'Vegan Avocado Wrap', 'Main', 13.50, 3.80),
(5, 'Double Pepperoni Pizza', 'Main', 18.99, 6.00),
(6, 'Chocolate Lava Cake', 'Dessert', 7.50, 1.80);

-- 2. Populate Delivery_Partners [cite: 31]
INSERT INTO Delivery_Partners (driver_id, driver_name, vehicle_type) VALUES
(501, 'Rahul Sharma', 'Bicycle'),
(502, 'Priya Patel', 'Scooter'),
(503, 'Amit Mishra', 'Car'),
(504, 'Sneha Reddy', 'E-Bike'),
(505, 'Vikram Singh', 'Scooter');

-- 3. Populate Orders [cite: 33, 34]
INSERT INTO Orders (order_id, customer_id, item_id, driver_id, order_timestamp, pickup_timestamp, delivery_timestamp, order_status) VALUES
(1, 2202, 4, 505, '2026-01-01 08:08:00', '2026-01-01 08:20:00', '2026-01-01 08:44:00', 'Completed'),
(2, 2327, 1, 504, '2026-01-01 08:16:00', '2026-01-01 08:28:00', '2026-01-01 09:00:00', 'Completed'),
(3, 2452, 4, 503, '2026-01-01 08:24:00', '2026-01-01 08:36:00', '2026-01-01 09:17:00', 'Completed'),
(4, 2077, 1, 501, '2026-01-01 08:32:00', '2026-01-01 08:44:00', '2026-01-01 08:59:00', 'Completed'),
(5, 2203, 4, 505, '2026-01-01 08:40:00', '2026-01-01 08:52:00', '2026-01-01 09:16:00', 'Completed'),
(6, 2328, 1, 504, '2026-01-01 08:48:00', '2026-01-01 09:00:00', '2026-01-01 09:33:00', 'Completed'),
(7, 2453, 4, 503, '2026-01-01 08:56:00', '2026-01-01 09:08:00', '2026-01-01 09:49:00', 'Completed'),
(8, 2078, 1, 501, '2026-01-01 09:04:00', '2026-01-01 09:16:00', '2026-01-01 09:31:00', 'Completed'),
(9, 2203, 4, 505, '2026-01-01 09:12:00', '2026-01-01 09:24:00', '2026-01-01 09:48:00', 'Completed'),
(10, 2328, 1, 504, '2026-01-01 09:20:00', '2026-01-01 09:32:00', '2026-01-01 10:05:00', 'Completed'),
(11, 2453, 4, 503, '2026-01-01 09:28:00', '2026-01-01 09:40:00', '2026-01-01 10:22:00', 'Completed'),
(12, 2078, 1, 501, '2026-01-01 09:36:00', '2026-01-01 09:48:00', '2026-01-01 10:03:00', 'Completed'),
(13, 2203, 4, 505, '2026-01-01 09:44:00', '2026-01-01 09:56:00', '2026-01-01 10:20:00', 'Completed'),
(14, 2328, 1, 504, '2026-01-01 09:52:00', '2026-01-01 10:04:00', '2026-01-01 10:37:00', 'Completed'),
(15, 2453, 4, 503, '2026-01-01 10:00:00', '2026-01-01 10:12:00', '2026-01-01 10:54:00', 'Completed'),
(16, 2079, 1, 501, '2026-01-01 10:08:00', '2026-01-01 10:20:00', '2026-01-01 10:35:00', 'Completed'),
(17, 2204, 4, 505, '2026-01-01 10:16:00', '2026-01-01 10:28:00', '2026-01-01 10:52:00', 'Completed'),
(18, 2329, 1, 504, '2026-01-01 10:24:00', '2026-01-01 10:36:00', '2026-01-01 11:09:00', 'Completed'),
(19, 2454, 4, 503, '2026-01-01 10:32:00', '2026-01-01 10:44:00', '2026-01-01 11:26:00', 'Completed'),
(20, 2079, 1, 501, '2026-01-01 10:40:00', '2026-01-01 10:52:00', '2026-01-01 11:08:00', 'Completed'),
(21, 2204, 4, 505, '2026-01-01 10:48:00', '2026-01-01 11:00:00', '2026-01-01 11:24:00', 'Completed'),
(22, 2329, 1, 504, '2026-01-01 10:56:00', '2026-01-01 11:08:00', '2026-01-01 11:41:00', 'Completed'),
(23, 2454, 4, 503, '2026-01-01 11:04:00', '2026-01-01 11:16:00', '2026-01-01 11:58:00', 'Completed'),
(24, 2079, 1, 501, '2026-01-01 11:12:00', '2026-01-01 11:24:00', '2026-01-01 11:40:00', 'Completed'),
(25, 2204, 4, 505, '2026-01-01 11:20:00', '2026-01-01 11:32:00', '2026-01-01 11:56:00', 'Completed'),
(26, 2329, 1, 504, '2026-01-01 11:28:00', '2026-01-01 11:40:00', '2026-01-01 12:13:00', 'Completed'),
(27, 2455, 4, 503, '2026-01-01 11:36:00', '2026-01-01 11:48:00', '2026-01-01 12:30:00', 'Completed'),
(28, 2080, 1, 501, '2026-01-01 11:44:00', '2026-01-01 11:56:00', '2026-01-01 12:12:00', 'Completed'),
(29, 2205, 4, 505, '2026-01-01 11:52:00', '2026-01-01 12:04:00', '2026-01-01 12:29:00', 'Completed'),
(30, 2330, 1, 504, '2026-01-01 12:00:00', '2026-01-01 12:12:00', '2026-01-01 12:45:00', 'Completed'),
(31, 2455, 4, 503, '2026-01-01 12:08:00', '2026-01-01 12:20:00', '2026-01-01 13:02:00', 'Completed'),
(32, 2080, 2, 501, '2026-01-01 12:16:00', '2026-01-01 12:28:00', '2026-01-01 12:44:00', 'Completed'),
(33, 2205, 5, 505, '2026-01-01 12:24:00', '2026-01-01 12:36:00', '2026-01-01 13:01:00', 'Completed'),
(34, 2330, 2, 504, '2026-01-01 12:32:00', '2026-01-01 12:44:00', '2026-01-01 13:18:00', 'Completed'),
(35, 2455, 5, NULL, '2026-01-01 12:40:00', NULL, NULL, 'Cancelled'),
(36, 2080, 2, 501, '2026-01-01 12:48:00', '2026-01-01 13:00:00', '2026-01-01 13:16:00', 'Completed'),
(37, 2205, 5, 505, '2026-01-01 12:56:00', '2026-01-01 13:08:00', '2026-01-01 13:33:00', 'Completed'),
(38, 2331, 2, 504, '2026-01-01 13:04:00', '2026-01-01 13:16:00', '2026-01-01 13:50:00', 'Completed'),
(39, 2456, 5, 503, '2026-01-01 13:12:00', '2026-01-01 13:24:00', '2026-01-01 14:06:00', 'Completed'),
(40, 2081, 2, 501, '2026-01-01 13:20:00', '2026-01-01 13:32:00', '2026-01-01 13:48:00', 'Completed'),
(41, 2206, 5, 505, '2026-01-01 13:28:00', '2026-01-01 13:40:00', '2026-01-01 14:05:00', 'Completed'),
(42, 2331, 2, 504, '2026-01-01 13:36:00', '2026-01-01 13:48:00', '2026-01-01 14:22:00', 'Completed'),
(43, 2456, 5, 503, '2026-01-01 13:44:00', '2026-01-01 13:56:00', '2026-01-01 14:39:00', 'Completed'),
(44, 2081, 2, 501, '2026-01-01 13:52:00', '2026-01-01 14:04:00', '2026-01-01 14:20:00', 'Completed'),
(45, 2206, 5, 505, '2026-01-01 14:00:00', '2026-01-01 14:12:00', '2026-01-01 14:37:00', 'Completed'),
(46, 2331, 2, 504, '2026-01-01 14:08:00', '2026-01-01 14:20:00', '2026-01-01 14:54:00', 'Completed'),
(47, 2456, 5, 503, '2026-01-01 14:16:00', '2026-01-01 14:28:00', '2026-01-01 15:11:00', 'Completed'),
(48, 2082, 2, 501, '2026-01-01 14:24:00', '2026-01-01 14:36:00', '2026-01-01 14:52:00', 'Completed'),
(49, 2207, 5, 505, '2026-01-01 14:32:00', '2026-01-01 14:44:00', '2026-01-01 15:09:00', 'Completed'),
(50, 2332, 2, 504, '2026-01-01 14:40:00', '2026-01-01 14:52:00', '2026-01-01 15:26:00', 'Completed');

-- 4. Populate Customer_Reviews [cite: 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
INSERT INTO Customer_Reviews (review_id, order_id, rating, review_text) VALUES
(10003, 3, 5, 'Exceptional service and quick delivery!'),
(10006, 6, 4, 'Superb, clean presentation. Ordering again!'),
(10009, 9, 3, 'Delayed delivery execution, packaging was wet.'),
(10012, 12, 1, 'Food arrived slightly cool but tasted great.'),
(10015, 15, 5, 'Exceptional service and quick delivery!'),
(10018, 18, 4, 'Superb, clean presentation. Ordering again!'),
(10021, 21, 3, 'Delayed delivery execution, packaging was wet.'),
(10024, 24, 1, 'Food arrived slightly cool but tasted great.'),
(10027, 27, 5, 'Exceptional service and quick delivery!'),
(10030, 30, 4, 'Superb, clean presentation. Ordering again!'),
(10033, 33, 3, 'Delayed delivery execution, packaging was wet.'),
(10036, 36, 1, 'Food arrived slightly cool but tasted great.'),
(10039, 39, 5, 'Exceptional service and quick delivery!'),
(10042, 42, 4, 'Superb, clean presentation. Ordering again!'),
(10045, 45, 3, 'Delayed delivery execution, packaging was wet.'),
(10048, 48, 1, 'Food arrived slightly cool but tasted great.'),
(10051, 51, 5, 'Exceptional service and quick delivery!'),
(10054, 54, 4, 'Superb, clean presentation. Ordering again!'),
(10057, 57, 3, 'Delayed delivery execution, packaging was wet.'),
(10060, 60, 1, 'Food arrived slightly cool but tasted great.'),
(10063, 63, 5, 'Exceptional service and quick delivery!'),
(10066, 66, 4, 'Superb, clean presentation. Ordering again!'),
(10069, 69, 3, 'Delayed delivery execution, packaging was wet.'),
(10072, 72, 1, 'Food arrived slightly cool but tasted great.'),
(10075, 75, 5, 'Exceptional service and quick delivery!'),
(10078, 78, 4, 'Superb, clean presentation. Ordering again!'),
(10081, 81, 3, 'Delayed delivery execution, packaging was wet.'),
(10084, 84, 1, 'Food arrived slightly cool but tasted great.'),
(10087, 87, 5, 'Exceptional service and quick delivery!'),
(10090, 90, 4, 'Superb, clean presentation. Ordering again!'),
(10093, 93, 3, 'Delayed delivery execution, packaging was wet.'),
(10096, 96, 1, 'Food arrived slightly cool but tasted great.'),
(10099, 99, 5, 'Exceptional service and quick delivery!'),
(10102, 102, 4, 'Superb, clean presentation. Ordering again!'),
(10108, 108, 1, 'Food arrived slightly cool but tasted great.'),
(10111, 111, 5, 'Exceptional service and quick delivery!'),
(10114, 114, 4, 'Superb, clean presentation. Ordering again!'),
(10117, 117, 3, 'Delayed delivery execution, packaging was wet.'),
(10120, 120, 1, 'Food arrived slightly cool but tasted great.'),
(10123, 123, 5, 'Exceptional service and quick delivery!'),
(10126, 126, 4, 'Superb, clean presentation. Ordering again!'),
(10129, 129, 3, 'Delayed delivery execution, packaging was wet.'),
(10132, 132, 1, 'Food arrived slightly cool but tasted great.'),
(10135, 135, 5, 'Exceptional service and quick delivery!'),
(10138, 138, 4, 'Superb, clean presentation. Ordering again!'),
(10141, 141, 3, 'Delayed delivery execution, packaging was wet.'),
(10144, 144, 1, 'Food arrived slightly cool but tasted great.'),
(10147, 147, 5, 'Exceptional service and quick delivery!'),
(10150, 150, 4, 'Superb, clean presentation. Ordering again!'),
(10153, 153, 3, 'Delayed delivery execution, packaging was wet.');