-- Channel-level performance
SELECT
    channel,
    SUM(spend) AS spend,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    ROUND(SUM(clicks)::numeric / NULLIF(SUM(impressions),0) * 100, 2) AS ctr_pct,
    ROUND(SUM(spend) / NULLIF(SUM(clicks),0), 2) AS cpc,
    ROUND(SUM(last_touch_revenue) / NULLIF(SUM(spend),0), 2) AS last_touch_roas
FROM campaign_performance
GROUP BY channel
ORDER BY last_touch_roas DESC;
