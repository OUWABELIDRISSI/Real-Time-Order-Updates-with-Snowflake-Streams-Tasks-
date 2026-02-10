USE DATABASE orders_db;

-- Total revenue per day
SELECT
    DATE(event_timestamp) AS order_date,
    SUM(order_amount) AS total_revenue
FROM analytics.orders_events_clean
WHERE event_type = 'ORDER_CREATED'
GROUP BY order_date
ORDER BY order_date;

-- Revenue per customer
SELECT
    customer_id,
    SUM(order_amount) AS customer_revenue
FROM analytics.orders_events_clean
WHERE event_type = 'ORDER_CREATED'
GROUP BY customer_id
ORDER BY customer_revenue DESC;

-- Order lifecycle events
SELECT
    order_id,
    ARRAY_AGG(event_type) WITHIN GROUP (ORDER BY event_timestamp) AS order_events
FROM analytics.orders_events_clean
GROUP BY order_id;

-- Late-arriving events check
SELECT *
FROM analytics.orders_events_clean
WHERE event_timestamp < ingestion_timestamp - INTERVAL '5 MINUTE';
