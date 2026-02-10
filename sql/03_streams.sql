USE DATABASE orders_db;
USE SCHEMA raw;

CREATE OR REPLACE STREAM orders_events_stream
ON TABLE orders_events_raw
APPEND_ONLY = TRUE;
