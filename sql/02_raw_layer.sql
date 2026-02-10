USE DATABASE orders_db;
USE SCHEMA raw;

CREATE OR REPLACE TABLE orders_events_raw (
    raw_event VARIANT,
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
