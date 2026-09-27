# Grito Labs — Marketing Analytics & Attribution Framework

## What this project contains

This project implements the Grito Labs problem statement:

- Multi-channel performance and ROI analysis
- Customer journey analysis
- First-touch, last-touch, linear and position-based attribution
- Marketing KPI analysis
- SQL workflow
- Python analysis
- Power BI-ready data model and dashboard specification
- Business recommendations and optimization framework

## Important dataset disclosure

The problem statement does not provide a participant dataset. Therefore, the included dataset is synthetic and reproducible. It is for demonstrating the analytical framework and must not be represented as actual Grito Labs campaign/customer data.

## Folder structure

```text
data/          CSV source tables
sql/           PostgreSQL schema and analysis queries
notebooks/     Python analysis notebook
dashboard/     Charts + Power BI build specification
docs/          Methodology, assumptions and recommendations
presentation/  Final presentation
```

## Suggested submission order

1. SQL files
2. Jupyter notebook
3. Dashboard screenshots / Power BI implementation
4. Documentation
5. Final presentation

## Tech stack

- PostgreSQL-compatible SQL
- Python / Pandas / Matplotlib
- Power BI
- Git/GitHub

## SQL execution order

1. `00_schema.sql`
2. Load CSV data into the tables
3. Load `attribution_touchpoints.csv`
4. Run `06_campaign_performance_view.sql`
5. Run `01`–`05` analytical queries.
