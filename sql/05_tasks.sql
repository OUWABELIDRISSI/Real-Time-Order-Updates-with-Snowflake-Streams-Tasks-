USE DATABASE orders_db;

CREATE OR REPLACE TASK process_orders_events
WAREHOUSE = orders_wh
SCHEDULE = '1 MINUTE'
WHEN
    SYSTEM$STREAM_HAS_DATA('raw.orders_events_stream')
AS
INSERT INTO analytics.orders_events_clean
SELECT
    raw_event:event_id::STRING,
    raw_event:order_id::STRING,
    raw_event:customer_id::STRING,
    raw_event:event_type::STRING,
    raw_event:order_amount::FLOAT,
    raw_event:order_currency::STRING,
    raw_event:event_timestamp::TIMESTAMP,
    CURRENT_TIMESTAMP()
FROM raw.orders_events_stream;
