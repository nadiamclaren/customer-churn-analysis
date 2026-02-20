# Customer Churn Analysis

## Overview
My adaptation of some old uni coursework! Analysis of 7,043 telecom customers to identify churn drivers and 
at-risk segments, using SQL, R, and Tableau.

**Tools:** SQLite (DB Browser), R (tidyverse, ggplot2), Tableau Public  
**Data source:** [IBM Telco Customer Churn Dataset via Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)  
**Dashboard:** [View on Tableau Public](https://public.tableau.com/views/CustomerChurnAnalysis-Telco/CustomerChurnAnalysis?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Approach
The raw dataset was split into four relational tables (customers, 
services, billing, churn) to mimic a real data warehouse structure. 
SQL queries were written across joined tables to extract insights, 
before validating findings independently in R and visualising in Tableau.

---

## Key Findings

**1. Overall churn rate: 26.5%**  
Roughly 1 in 4 customers left within the period studied.

**2. Contract type is the strongest predictor**  
Month-to-month customers churn at 42.7% — fifteen times higher than 
two-year contract customers at 2.8%. The product appears valued when 
customers commit long term, but struggles to retain those without 
a long-term incentive.

**3. Churn is front-loaded in the first 12 months**  
Customers in their first year churn at 47%, dropping to just 9.7% 
for customers who have been with the company 48+ months. This points 
to an onboarding and early engagement problem rather than a product 
quality problem.

**4. Senior citizens are an anomaly worth investigating**  
Seniors make up 16% of customers but churn at 41.7% and pay $79.80 
per month on average vs $61.80 for non-seniors — an $18 gap. This 
raises a question about whether this group is being placed on 
appropriate plans.

**5. Higher charges correlate with higher churn**  
The distribution of monthly charges shows churned customers are 
disproportionately concentrated in the $50-$100+ range.

---

## Recommended Actions
- Introduce an incentive at the 6-month mark to convert month-to-month 
  customers to annual contracts
- Review the first 90 days onboarding journey to address early churn
- Audit senior customer plan allocation to investigate the charge gap

---

## Data Quality Notes
- 11 customers had null TotalCharges — confirmed as new customers 
  with 0 tenure, not data errors
- SeniorCitizen is encoded as 0/1 where 0 = Non-Senior and 1 = Senior

---

## Repository Structure
- `sql/` — five SQL queries covering churn rate, contract analysis, 
  tenure bands, senior anomaly, and cumulative churn
- `r-analysis/` — R scripts for data splitting and exploratory analysis
- `visuals/` — ggplot2 chart output
