USE DATABASE orders_db;
USE SCHEMA analytics;

CREATE OR REPLACE TABLE orders_events_clean (
    event_id STRING,
    order_id STRING,
    customer_id STRING,
    event_type STRING,
    order_amount FLOAT,
    order_currency STRING,
    event_timestamp TIMESTAMP,
    ingestion_timestamp TIMESTAMP
);
