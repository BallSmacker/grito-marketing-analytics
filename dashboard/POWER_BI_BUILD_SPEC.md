# Power BI Dashboard Specification

## Model
Use a simple star-style model:

- `customers` → customer dimension
- `marketing_daily` → daily campaign spend/impression/click fact
- `touchpoints` → customer journey fact
- `conversions` → conversion/revenue fact

Relationships:
- customers[customer_id] 1:* touchpoints[customer_id]
- customers[customer_id] 1:* conversions[customer_id]

## Suggested Measures

```DAX
Total Spend = SUM(marketing_daily[spend])
Total Impressions = SUM(marketing_daily[impressions])
Total Clicks = SUM(marketing_daily[clicks])
Conversions = DISTINCTCOUNT(conversions[conversion_id])
Revenue = SUM(conversions[revenue])
CTR = DIVIDE([Total Clicks], [Total Impressions])
CPC = DIVIDE([Total Spend], [Total Clicks])
AOV = DIVIDE([Revenue], [Conversions])
```

For attribution, import `attribution_touchpoints.csv` and create:

```DAX
First Touch Revenue = SUMX(
    attribution_touchpoints,
    attribution_touchpoints[revenue] * attribution_touchpoints[first_touch_weight]
)

Last Touch Revenue = SUMX(
    attribution_touchpoints,
    attribution_touchpoints[revenue] * attribution_touchpoints[last_touch_weight]
)

Linear Revenue = SUMX(
    attribution_touchpoints,
    attribution_touchpoints[revenue] * attribution_touchpoints[linear_weight]
)

Position Based Revenue = SUMX(
    attribution_touchpoints,
    attribution_touchpoints[revenue] * attribution_touchpoints[position_weight]
)
```

## Pages

### 1. Executive Overview
Cards: Spend, Revenue, Conversions, CTR, CPC, Last-Touch ROAS.
Charts: monthly conversions, spend vs revenue.

### 2. Channel Performance
Matrix with channel, spend, clicks, CTR, CPC, attributed revenue and ROAS.
Slicers: date, channel, segment.

### 3. Attribution
Clustered column chart comparing first-touch, last-touch, linear and position-based revenue by channel.
Add a journey/path visual if available.

### 4. Campaign Optimization
Campaign table with spend, clicks, conversions, attributed revenue, ROAS and recommended action.

## Important analytical note
ROAS and attributed revenue are not proof of incremental lift. Budget reallocation should be validated with controlled experiments or holdouts before large-scale changes.
