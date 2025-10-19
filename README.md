# Weekly Subscription Retention Analysis

## Project Description
This project analyzes subscription churn through weekly retention cohorts. The PM identified that monthly retention data might miss critical early churn insights. The goal was to calculate weekly retention rates for user cohorts and monitor activity over 6 weeks to uncover patterns and inform strategic decisions.

[URL to spreadsheet](https://docs.google.com/spreadsheets/d/1Ud475bs00X0tn-7WE20XPvwzR1_QgaHloUOJ1lQ-O4U/edit?gid=2010630371#gid=2010630371)

## Problem
High early churn and poorly understood retention trends reduce revenue and hinder marketing effectiveness.

## Solution
- Performed SQL cohort analysis on `turing_data_analytics.subscriptions`.
- Built a Google Sheets dashboard to track weekly retention, calculate churn, and visualize customer drop-off patterns.

## Methodology
1. Data exploration and cleaning.
2. Cohort definition by subscription start week.
3. Weekly retention calculation from Week 0 through Week 6.
4. Visualization via heatmaps and line charts to identify trends and actionable insights.

## Key Findings
- Week 1 retention is a strong predictor of long-term retention.
- Largest drop-offs occur in Week 1 (~5%) and Week 2 (~3%).
- Retention stabilizes after Week 2, averaging ~1% drop per week.
- High user volume does not necessarily imply lower retention.
