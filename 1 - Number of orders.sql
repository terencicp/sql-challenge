-- NUMBER OF ORDERS

-- view_table('orders', 5)
SELECT *
FROM orders
LIMIT 5;


-- orders_per_day
SELECT
    DATE(order_purchase_timestamp) AS day,
    COUNT(*) AS order_count
FROM orders
GROUP BY day;


-- orders_per_day_of_the_week_and_hour
SELECT
    -- Extract day of the week from timestamps
    CASE CAST(strftime('%w', order_purchase_timestamp) AS INTEGER)
    	WHEN 1 THEN 'Mon'
        WHEN 2 THEN 'Tue'
        WHEN 3 THEN 'Wed'
        WHEN 4 THEN 'Thu'
        WHEN 5 THEN 'Fri'
        WHEN 6 THEN 'Sat'
        WHEN 0 THEN 'Sun'
        END AS day_of_week,
    -- Count of orders for each hour
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 0 THEN 1 END) AS "0",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 1 THEN 1 END) AS "1",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 2 THEN 1 END) AS "2",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 3 THEN 1 END) AS "3",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 4 THEN 1 END) AS "4",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 5 THEN 1 END) AS "5",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 6 THEN 1 END) AS "6",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 7 THEN 1 END) AS "7",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 8 THEN 1 END) AS "8",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 9 THEN 1 END) AS "9",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 10 THEN 1 END) AS "10",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 11 THEN 1 END) AS "11",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 12 THEN 1 END) AS "12",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 13 THEN 1 END) AS "13",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 14 THEN 1 END) AS "14",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 15 THEN 1 END) AS "15",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 16 THEN 1 END) AS "16",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 17 THEN 1 END) AS "17",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 18 THEN 1 END) AS "18",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 19 THEN 1 END) AS "19",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 20 THEN 1 END) AS "20",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 21 THEN 1 END) AS "21",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 22 THEN 1 END) AS "22",
    COUNT(CASE WHEN CAST(strftime("%H", order_purchase_timestamp) AS INTEGER) = 23 THEN 1 END) AS "23"
FROM orders
GROUP BY day_of_week
ORDER BY
    CASE day_of_week
        WHEN 'Sun' THEN 7
        ELSE CAST(strftime('%w', order_purchase_timestamp) AS INTEGER)
        END;


-- view_table('customers', 5)
SELECT *
FROM customers
LIMIT 5;


-- orders_per_city_reversed
SELECT *
FROM (
	SELECT 
	    customer_city AS customer_city,
	    UPPER(customer_city) AS city,
	    COUNT(orders.order_id) as city_order_count
	FROM 
	    customers
	    JOIN orders USING (customer_id)
	GROUP BY customer_city
	ORDER BY city_order_count DESC
	LIMIT 10
)
ORDER BY city_order_count;
