# Grito Labs — Multi-Channel Marketing Analytics & Attribution Framework

## 1. Project objective

The problem statement asks for a framework to analyze multi-channel campaign performance, customer journeys, attribution, marketing KPIs, and optimization opportunities. It specifically calls for channel-level ROI analysis, journey analysis, attribution models, KPI calculation, actionable budget recommendations, structured SQL/analysis workflows, and documentation of assumptions and attribution logic.

## 2. Dataset disclosure

**This submission uses a synthetic, reproducible dataset because the provided problem statement does not include a participant dataset.**

It must not be presented as real Grito Labs customer, campaign, revenue or performance data.

Dataset period: 2025-10-01 to 2026-09-30.

Rows:
- Customers: 5,000
- Touchpoints: 15,063
- Conversions: 714
- Marketing daily records: 4,380

## 3. KPI definitions

- CTR = Clicks / Impressions
- CPC = Spend / Clicks
- Conversion Rate = Conversions / Clicks (where the available event grain supports this denominator)
- CAC = Spend / New Customers
- ROAS = Attributed Revenue / Spend
- LTV/CLV = expected customer value over the customer relationship

Because the synthetic data contains a single conversion/revenue event per converted customer, LTV is **not** estimated as a full retention metric.

## 4. Attribution models

### First touch
100% of conversion revenue goes to the first marketing touchpoint in the conversion path.

### Last touch
100% of conversion revenue goes to the final marketing touchpoint before conversion.

### Linear
Conversion revenue is split equally across all touchpoints in the path.

### Position based
40% is assigned to the first touch, 40% to the last touch, and the remaining 20% is distributed across middle touchpoints. One-touch and two-touch paths are normalized to 100%.

## 5. Executive synthetic results

- Total spend: ₹4,253,647
- Total modeled revenue: ₹360,647
- Conversions: 714
- CTR: 2.87%
- CPC: ₹0.40
- Last-touch ROAS: 0.08x

These numbers are generated only to demonstrate the framework.

## 6. Analytical interpretation

Attribution models distribute the same conversion revenue differently. This means a channel's reported contribution can change substantially depending on the model. A channel receiving little last-touch credit may still play an important role earlier in the journey.

Budget decisions should therefore combine attribution, conversion volume, customer segment, data quality and incremental testing.

## 7. Optimization framework

- High attributed ROAS + meaningful conversion volume → candidate for controlled budget expansion.
- Moderate ROAS → optimize creative, audience, landing page and journey before increasing budget.
- Low ROAS + high CAC → investigate tracking, targeting and conversion quality before reducing spend.
- Strong first-touch/assisted contribution but weak last-touch → investigate its upper-funnel role rather than automatically cutting it.

## 8. Business recommendations

1. Optimize toward revenue and customer outcomes rather than clicks alone.
2. Compare multiple attribution models before major budget changes.
3. Segment performance by customer type and campaign intent.
4. Use experiments/holdouts to validate incremental lift.
5. Maintain one shared KPI definition layer for marketing and BI teams.
6. Track journey length and conversion delay to identify friction.

## 9. Limitations

- Synthetic dataset.
- No real Grito Labs customer or campaign data.
- Attribution is observational and does not prove causality.
- Full LTV cannot be estimated without repeat-purchase history.
- CAC requires a clearly defined acquisition cohort and customer denominator.
- Real budget decisions should account for seasonality, creative fatigue, incrementality and tracking quality.

## 10. Reproducibility

Random seed: 42.

All source data, SQL scripts, charts, dashboard specifications and presentation artifacts are included.
