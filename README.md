# PayFlow SQL Analysis

## Project Objective

The objective of this project is to analyze PayFlow payment transaction data using basic SQL queries in PostgreSQL. The analysis focuses on transaction patterns, payment performance, customer segments, and failed transaction reasons to identify meaningful business insights.

## Dataset

Data Source: This project uses a synthetic payment transaction dataset created for analytical and educational purposes.

The dataset contains payment transaction records from January to June 2026.


### Data Granularity

Each row represents a single payment transaction.

### Key Columns

- `transaction_id`
- `transaction_date`
- `customer_segment`
- `city`
- `payment_method`
- `merchant_category`
- `transaction_amount`
- `transaction_status`
- `failure_reason`
- `device_type`
- `transaction_hour`

## Analysis Scope

This project explores the following areas:

- Transaction counts
- Transaction volumes
- Average transaction amounts
- Payment method performance
- Customer segment behavior
- City-based transaction performance
- Failed transaction reasons
- Hourly transaction patterns
- Device type distribution across merchant categories

## Key Findings

### 1. Transaction Status Distribution

The dataset contains 1,200 payment transactions. Of these, 1,090 (90.83%) were successful, 62 (5.17%) failed, and 48 (4.00%) were cancelled.

Successful transactions accounted for the majority of payment attempts, while failed and cancelled transactions represented a smaller share of the dataset.

### 2. Insufficient Funds as the Leading Failure Reason

Insufficient Funds was the most common recorded reason for failed transactions, accounting for 24 of the 62 failed transactions (38.71%).

This finding identifies insufficient funds as a key factor to consider when investigating payment failures. Further analysis could explore whether failure patterns vary by payment method or customer segment.

### 3. Average Transaction Amount by Status

Cancelled transactions had the highest average transaction amount at 2,341.03, compared with 1,989.93 for successful transactions and 1,910.99 for failed transactions.

The higher average amount among cancelled transactions suggests a potential relationship between transaction amount and cancellation status. However, average amounts alone do not establish whether higher-value transactions are more likely to be cancelled. Further analysis of cancellation rates across transaction amount ranges would be needed to investigate this relationship.
