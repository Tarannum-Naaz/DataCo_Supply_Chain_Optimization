/*-- Total Sales
SELECT 
    ROUND(SUM(sales)::NUMERIC,2) AS total_sales
FROM supply_chain;

-- Total Profit
SELECT 
    ROUND(SUM(order_profit_per_order)::NUMERIC,2) AS total_profit
FROM supply_chain;

-- Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM supply_chain;

-- Total Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM supply_chain;

-- Total Products
SELECT 
    COUNT(DISTINCT product_card_id) AS total_products
FROM supply_chain;
*/


SELECT
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_card_id) AS total_products
FROM supply_chain;


-- Sales by Category
SELECT
    category_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY category_name
ORDER BY total_sales DESC;

-- Sales by Market
SELECT
    market,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY market
ORDER BY total_sales DESC;


--Monthly Sales Trend
SELECT
    EXTRACT(YEAR FROM order_date_dateorders) AS order_year,
    EXTRACT(MONTH FROM order_date_dateorders) AS order_month,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY
    EXTRACT(YEAR FROM order_date_dateorders),
    EXTRACT(MONTH FROM order_date_dateorders)
ORDER BY
    order_year,
    order_month;


--Sales by Customer Segment
SELECT
    customer_segment,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY customer_segment
ORDER BY total_sales DESC;

-- 2.5 Top 10 Products by Sales
SELECT
    product_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--Profit by Category
SELECT
    category_name,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit
FROM supply_chain
GROUP BY category_name
ORDER BY total_profit DESC;

--Late Delivery Analysis
SELECT
    delivery_status,
    COUNT(*) AS total_orders,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM supply_chain
GROUP BY delivery_status
ORDER BY total_orders DESC;

--Late Delivery Risk by Shipping Mode
SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(
        100.0 * SUM(late_delivery_risk) / COUNT(*),
        2
    ) AS late_delivery_rate
FROM supply_chain
GROUP BY shipping_mode
ORDER BY late_delivery_rate DESC;

--Average Delivery Time by Shipping Mode
SELECT
    shipping_mode,
    ROUND(AVG(days_for_shipping_real), 2) AS avg_delivery_days,
    ROUND(AVG(days_for_shipment_scheduled), 2) AS avg_scheduled_days
FROM supply_chain
GROUP BY shipping_mode
ORDER BY avg_delivery_days;

--Late Delivery by Market
SELECT
    market,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(
        100.0 * SUM(late_delivery_risk) / COUNT(*),
        2
    ) AS late_delivery_rate
FROM supply_chain
GROUP BY market
ORDER BY late_delivery_rate DESC;

--Orders by Order Status
SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders
FROM supply_chain
GROUP BY order_status
ORDER BY total_orders DESC;

--Sales and Profit by Region
SELECT
    order_region,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit
FROM supply_chain
GROUP BY order_region
ORDER BY total_sales DESC;

--Profit Margin by Category
SELECT
    category_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit,
    ROUND(
        (100.0 * SUM(order_profit_per_order) / NULLIF(SUM(sales), 0))::numeric,
        2
    ) AS profit_margin
FROM supply_chain
GROUP BY category_name
ORDER BY profit_margin DESC;

--Top 10 Customers by Sales
SELECT
    customer_id,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;

--Top 10 Products by Profit
SELECT
    product_name,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit
FROM supply_chain
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

--Average Profit per Order by Market
SELECT
    market,
    ROUND(AVG(order_profit_per_order)::numeric, 2) AS avg_profit_per_order
FROM supply_chain
GROUP BY market
ORDER BY avg_profit_per_order DESC;

--Discount Analysis by Market
SELECT
    market,
    ROUND(AVG(order_item_discount)::numeric, 2) AS avg_discount,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM supply_chain
GROUP BY market
ORDER BY avg_discount DESC;

--Sales by Shipping Mode
SELECT
    shipping_mode,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM supply_chain
GROUP BY shipping_mode
ORDER BY total_sales DESC;

--Orders by Shipping Mode
SELECT
    shipping_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(days_for_shipping_real)::numeric, 2) AS avg_delivery_days
FROM supply_chain
GROUP BY shipping_mode
ORDER BY total_orders DESC;

--Final Business Summary
SELECT
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(order_profit_per_order)::numeric, 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_card_id) AS total_products,
    ROUND(AVG(days_for_shipping_real)::numeric, 2) AS avg_delivery_days,
    ROUND(
        (100.0 * SUM(late_delivery_risk) / COUNT(*))::numeric,
        2
    ) AS late_delivery_rate
FROM supply_chain;