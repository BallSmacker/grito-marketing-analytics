-- Reusable campaign-performance view for the analytical queries.
CREATE OR REPLACE VIEW campaign_performance AS
WITH attribution AS (
    SELECT
        a.campaign_id,
        SUM(a.revenue * a.first_touch_weight) AS first_touch_revenue,
        SUM(a.revenue * a.last_touch_weight) AS last_touch_revenue,
        SUM(a.revenue * a.linear_weight) AS linear_revenue,
        SUM(a.revenue * a.position_weight) AS position_revenue
    FROM attribution_touchpoints a
    GROUP BY a.campaign_id
)
SELECT
    m.campaign_id,
    MAX(m.channel) AS channel,
    SUM(m.spend) AS spend,
    SUM(m.impressions) AS impressions,
    SUM(m.clicks) AS clicks,
    SUM(m.clicks)::numeric / NULLIF(SUM(m.impressions),0) AS ctr,
    SUM(m.spend) / NULLIF(SUM(m.clicks),0) AS cpc,
    COALESCE(MAX(a.first_touch_revenue),0) AS first_touch_revenue,
    COALESCE(MAX(a.last_touch_revenue),0) AS last_touch_revenue,
    COALESCE(MAX(a.linear_revenue),0) AS linear_revenue,
    COALESCE(MAX(a.position_revenue),0) AS position_revenue
FROM marketing_daily m
LEFT JOIN attribution a ON a.campaign_id = m.campaign_id
GROUP BY m.campaign_id;
