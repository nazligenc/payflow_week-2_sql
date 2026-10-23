# PayFlow SQL Insights

**Payment Analytics | PostgreSQL | January–June 2026**

---

## Key Metrics

| Metric | Result |
|---|---:|
| Total Transactions | 1,200 |
| Successful Transactions | 1,090 (90.83%) |
| Failed Transactions | 62 (5.17%) |
| Cancelled Transactions | 48 (4.00%) |

---

## Key Findings

- **Payment Methods:** Bank Transfer had the highest failure rate at **10.78%**.
- **Failure Reasons:** Insufficient Funds accounted for **38.71%** of failed transactions.
- **Peak Activity:** **19:00** was the busiest hour, with 125 transactions.
- **Customer Segments:** Premium customers using Credit Card had the lowest failure rate at **1.46%**.
- **Transaction Amounts:** Cancelled transactions had the highest average amount at **2,341.03**.
- **Geographic Performance:** İzmir had the lowest observed city-level success rate, at approximately **87%**.

---

## Business Question 1 — Payment Method Performance

**Business Question:** What are the transaction counts and failure rates by payment method?

| Metric | Result |
|---|---:|
| Bank Transfer Transactions | 102 |
| Bank Transfer Failure Rate | 10.78% |
| Lowest Failure Rate | Digital Wallet |

**Key Insight:** Bank Transfer had the highest failure rate despite having fewer transactions than the other payment methods. Investigating the reasons behind these failures may help improve payment reliability.

---

## Business Question 2 — Monthly Failure Trends

**Business Question:** How Do Monthly Failure Rates Vary by Payment Method?

**Key Finding:** The highest monthly failure rate observed was **17.39% for Bank Transfer in March**.

**Key Insight:** Failure rates varied across months and payment methods. Bank Transfer showed noticeable fluctuations throughout the six-month period. Further investigation into failure reasons could help identify possible explanations for these changes.

---

## Business Question 3 — Failure Reason Distribution

**Business Question:** What Is the Percentage Distribution of Failed Transaction Reasons?

| Failure Reason | Share of Failed Transactions |
|---|---:|
| Insufficient Funds | 38.71% |
| Technical Error | 14.52% |
| Bank Timeout | 11.29% |
| Limit Exceeded | 11.29% |

**Key Insight:** Insufficient Funds was the leading reason for failed transactions, accounting for 24 of the 62 failures. Technical errors were the second most common reason. Investigating technical failures may reveal opportunities to reduce preventable payment issues.

---

## Business Question 4 — Hourly Transaction Activity

**Business Question:** How Do Successful, Failed, and Cancelled Transaction Rates and Transaction Volumes Vary by Hour of the Day?

| Metric | Result |
|---|---:|
| Busiest Hour | 19:00 |
| Total Transactions at 19:00 | 125 |
| Successful Transactions | 116 |
| Failed Transactions | 7 |
| Cancelled Transactions | 2 |
| Lowest-Activity Hour | 03:00 |

**Key Insight:** Transaction activity peaked at 19:00 and was lowest at 03:00. Understanding these hourly patterns may help with system capacity planning and payment performance monitoring during busy periods.

---

## Business Question 5 — Merchant Categories and Device Types

**Business Question:** How Do Transaction Counts and Device Type Distributions Vary Across Merchant Categories?

**Key Finding:** Mobile usage was higher than web usage in most merchant categories.

**Key Insight:** Mobile transactions represented a larger share of activity across most categories. Maintaining a smooth mobile payment experience may therefore be important. Missing device type and merchant category values should also be investigated to improve data quality.

---

## Business Question 6 — Customer Segments and Payment Methods

**Business Question:** How Do Payment Method Preferences and Transaction Success and Failure Rates Vary Across Customer Segments?

| Metric | Customer Segment and Payment Method | Rate |
|---|---|---:|
| Lowest Failure Rate | Premium + Credit Card | 1.46% |
| Highest Failure Rate | New + Bank Transfer | 13.33% |
| Highest Cancellation Rate | Standard + Bank Transfer | 9.62% |

**Key Insight:** Transaction outcomes varied across customer segments and payment methods. Bank Transfer transactions in the New and Standard segments had relatively high failure or cancellation rates and may warrant further investigation. The reasons behind these differences cannot be established from transaction rates alone.

---

## Business Question 7 — Average Transaction Amount by Status

**Business Question:** How Does the Average Transaction Amount Vary Across Successful, Failed, and Cancelled Transactions?

| Transaction Status | Average Transaction Amount |
|---|---:|
| Cancelled | 2,341.03 |
| Successful | 1,989.93 |
| Failed | 1,910.99 |

**Key Insight:** Cancelled transactions had the highest average amount, exceeding the average for successful transactions. This suggests a possible relationship worth investigating, but averages alone do not establish whether higher-value transactions are more likely to be cancelled.

---

## Business Question 8 — City-Level Performance

**Business Question:** How Do Transaction Counts and Success Rates Vary by City?

**Key Findings:**
- **Ankara:** Ranked among the cities with higher success rates.
- **İzmir:** Had the lowest observed success rate, at approximately 87%.
- **Missing City Data:** The group with missing city information had the highest observed success rate.

**Key Insight:** City-level success rates varied across the dataset. İzmir's lower rate may justify further investigation, but transaction counts should also be considered before comparing cities. Records with missing city information should be investigated before drawing conclusions about geographic performance.

---

## Conclusion

This analysis highlights differences in payment performance across methods, months, customer segments, merchant categories, transaction hours, and cities. Bank Transfer failures, insufficient funds, and variations in cancellation amounts emerged as useful areas for further investigation.

These findings are descriptive rather than causal. Additional analysis would be needed to identify the underlying reasons for the observed patterns and evaluate potential improvements.
