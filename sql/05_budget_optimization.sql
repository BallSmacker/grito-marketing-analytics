-- Quantitative budget review using last-touch ROAS.
-- In a real environment, add confidence intervals / incremental lift before reallocating spend.
WITH perf AS (
    SELECT
        channel,
        SUM(spend) AS spend,
        SUM(last_touch_revenue) AS revenue
    FROM campaign_performance
    GROUP BY channel
)
SELECT
    channel,
    ROUND(spend,2) AS spend,
    ROUND(revenue,2) AS last_touch_revenue,
    ROUND(revenue / NULLIF(spend,0),2) AS roas,
    CASE
        WHEN revenue / NULLIF(spend,0) >= 2.0 THEN 'Scale / test additional budget'
        WHEN revenue / NULLIF(spend,0) >= 1.0 THEN 'Optimize and validate incrementality'
        ELSE 'Reduce or redesign'
    END AS action
FROM perf
ORDER BY roas DESC;
