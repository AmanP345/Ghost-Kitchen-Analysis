
-- KITCHEN PREPARATION TIME--------------------------------
SELECT 
ROUND(AVG(TIMESTAMPDIFF(MINUTE, order_timestamp, pickup_timestamp)),2) AS avg_kitchen_prep FROM Orders;

-- TRANSIT TIME--------------------------------
SELECT 
ROUND(AVG(TIMESTAMPDIFF(MINUTE, pickup_timestamp, delivery_timestamp)),2) AS avg_transit_time FROM Orders;

-- DELIVERY TIME ACCORDING TO TYPE OF VEHICLE--------------------------------
SELECT 
vehicle_type,ROUND(AVG(TIMESTAMPDIFF(MINUTE, pickup_timestamp, delivery_timestamp)),2) AS average_deliverytime
FROM Orders
JOIN Delivery_Partners ON Delivery_Partners.driver_id=Orders.driver_id
GROUP BY vehicle_type;

-- TOP 3 ITEMS IN MENU--------------------------------
SELECT 
m.item_name,COUNT(o.order_id) AS num_of_orders
FROM Menu_Items AS m LEFT JOIN Orders AS o ON m.item_id=o.item_id 
GROUP BY m.item_id 
ORDER BY num_of_orders;

-- PROFIT AND PROFIT PERCENTAGE--------------------------------
SELECT m.item_name, 
ROUND(((m.price-m.cost_to_make)/m.price*100)) AS profit_percentage
FROM Menu_Items AS m GROUP BY m.item_id ORDER BY profit_percentage;

-- ORDERS REVIEWED AND UNREVIEWED
SELECT 
ROUND(AVG(cr.rating),1) AS Overall_avg_rating,
COUNT(o.order_id) AS total_orders, 
COUNT(cr.order_id) AS total_orders_reviewed,
COUNT(o.order_id)-COUNT(cr.order_id) AS unreviewd_orders
FROM Customer_Reviews AS cr 
RIGHT JOIN Orders AS o ON cr.order_id=o.order_id;

-- ORDERS CANCELLED AND COMPLETED--------------------------------
SELECT 
COUNT(order_id) AS Total_orders,
SUM(IF(order_status="Cancelled",1,0)) AS Cancelled_Orders,
SUM(IF(order_status="Completed",1,0)) AS Completed_Orders
FROM Orders;

-- RANKING OF DRIVERS--------------------------------
WITH T5D AS (
    SELECT dp.driver_name,AVG(TIMESTAMPDIFF(MINUTE, o.pickup_timestamp, o.delivery_timestamp)) AS Avg_Dtransit_time
    FROM Delivery_Partners AS dp JOIN Orders AS o ON dp.driver_id=o.driver_id GROUP BY dp.driver_id
)

SELECT
T5D.driver_name,Avg_Dtransit_time, DENSE_RANK() OVER (ORDER BY Avg_Dtransit_time ) AS d_RANK FROM T5D;

-- PEAK ORDERING HOURS--------------------------------
SELECT 
    EXTRACT(HOUR FROM order_timestamp) AS order_hour,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY EXTRACT(HOUR FROM order_timestamp)
ORDER BY order_hour ASC;

-- AVERAGE RATING ------------------------
SELECT 
AVG(rating) FROM Customer_Reviews;

-- TOTAL PROFIT----------------------
SELECT 
SUM(m.price-m.cost_to_make) FROM Menu_Items as m JOIN Orders as o ON m.item_id=o.item_id;

-- TOTAL REVENUE--------------------
SELECT 
SUM(m.price)FROM Menu_Items as m JOIN Orders as o ON m.item_id=o.item_id;
