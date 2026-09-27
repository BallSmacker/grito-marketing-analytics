-- PostgreSQL schema for Grito Labs Marketing Analytics project
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  segment VARCHAR(30),
  acquisition_date DATE
);

CREATE TABLE marketing_daily (
  date DATE,
  campaign_id VARCHAR(60),
  channel VARCHAR(40),
  spend NUMERIC(14,2),
  impressions BIGINT,
  clicks BIGINT
);

CREATE TABLE touchpoints (
  touchpoint_id BIGINT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  timestamp TIMESTAMP,
  segment VARCHAR(30),
  channel VARCHAR(40),
  campaign_id VARCHAR(60),
  touchpoint_order INT
);

CREATE TABLE conversions (
  conversion_id BIGINT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  conversion_timestamp TIMESTAMP,
  segment VARCHAR(30),
  revenue NUMERIC(14,2)
);

CREATE TABLE attribution_touchpoints (
  conversion_id BIGINT,
  customer_id INT REFERENCES customers(customer_id),
  channel VARCHAR(40),
  campaign_id VARCHAR(60),
  revenue NUMERIC(14,2),
  first_touch_weight NUMERIC(10,6),
  last_touch_weight NUMERIC(10,6),
  linear_weight NUMERIC(10,6),
  position_weight NUMERIC(10,6)
);
