-- Conversion journey length and common first/last channel paths
WITH journeys AS (
    SELECT
        c.customer_id,
        c.conversion_id,
        COUNT(*) AS touchpoints,
        MIN(t.timestamp) AS first_touch_time,
        MAX(t.timestamp) AS last_touch_time,
        MIN(t.channel) FILTER (WHERE t.touchpoint_order = 1) AS first_channel,
        MIN(t.channel) FILTER (
            WHERE t.touchpoint_order = (
                SELECT MAX(t2.touchpoint_order)
                FROM touchpoints t2
                WHERE t2.customer_id = t.customer_id
            )
        ) AS last_channel,
        c.revenue
    FROM conversions c
    JOIN touchpoints t ON t.customer_id = c.customer_id
      AND t.timestamp <= c.conversion_timestamp
    GROUP BY c.customer_id, c.conversion_id, c.revenue
)
SELECT
    first_channel,
    last_channel,
    touchpoints,
    COUNT(*) AS conversions,
    ROUND(AVG(revenue),2) AS avg_revenue
FROM journeys
GROUP BY first_channel, last_channel, touchpoints
ORDER BY conversions DESC;
