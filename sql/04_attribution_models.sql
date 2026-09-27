-- Compare first-touch, last-touch, linear and position-based attribution.
WITH ordered AS (
    SELECT
        c.conversion_id,
        c.customer_id,
        c.revenue,
        t.channel,
        t.campaign_id,
        t.touchpoint_order,
        COUNT(*) OVER (PARTITION BY c.conversion_id) AS path_length
    FROM conversions c
    JOIN touchpoints t
      ON t.customer_id = c.customer_id
     AND t.timestamp <= c.conversion_timestamp
)
SELECT
    channel,
    ROUND(SUM(CASE WHEN touchpoint_order = 1 THEN revenue ELSE 0 END),2) AS first_touch_revenue,
    ROUND(SUM(CASE WHEN touchpoint_order = path_length THEN revenue ELSE 0 END),2) AS last_touch_revenue,
    ROUND(SUM(revenue / path_length),2) AS linear_revenue,
    ROUND(SUM(
        CASE
            WHEN path_length = 1 THEN revenue
            WHEN path_length = 2 THEN revenue * 0.5
            WHEN touchpoint_order IN (1, path_length) THEN revenue * 0.4
            ELSE revenue * (0.2 / NULLIF(path_length - 2,0))
        END
    ),2) AS position_based_revenue
FROM ordered
GROUP BY channel
ORDER BY linear_revenue DESC;
