-- Campaign performance
SELECT
    campaign_id,
    channel,
    spend,
    impressions,
    clicks,
    ROUND(ctr * 100, 2) AS ctr_pct,
    ROUND(cpc, 2) AS cpc,
    ROUND(last_touch_revenue, 2) AS last_touch_revenue,
    ROUND(last_touch_revenue / NULLIF(spend,0), 2) AS last_touch_roas,
    ROUND(linear_revenue / NULLIF(spend,0), 2) AS linear_roas
FROM campaign_performance
ORDER BY last_touch_roas DESC;
