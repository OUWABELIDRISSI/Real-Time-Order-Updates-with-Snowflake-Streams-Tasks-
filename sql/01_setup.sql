-- Warehouse
CREATE OR REPLACE WAREHOUSE orders_wh
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

-- Database & schema
CREATE OR REPLACE DATABASE orders_db;
CREATE OR REPLACE SCHEMA orders_db.raw;
CREATE OR REPLACE SCHEMA orders_db.analytics;

-- File format (JSON Lines)
CREATE OR REPLACE FILE FORMAT orders_db.raw.jsonl_format
TYPE = JSON;

-- Internal stage
CREATE OR REPLACE STAGE orders_db.raw.orders_stage
FILE_FORMAT = jsonl_format;
