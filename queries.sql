-- =========================================
-- BQ1: Transaction Counts and Failure Rates
-- by Payment Method
-- =========================================

WITH payment_summary AS (
    SELECT
        payment_method,
        COUNT(*) AS total_transactions,
        SUM(
            CASE
                WHEN transaction_status = 'Failed' THEN 1
                ELSE 0
            END
        ) AS total_failed
    FROM payment_transactions
    GROUP BY payment_method
)
SELECT
    payment_method,
    total_transactions,
    total_failed,
    ROUND(
        total_failed * 100.0 / NULLIF(total_transactions, 0),
        2
    ) AS failure_rate
FROM payment_summary
ORDER BY payment_method;

-- =========================================
-- BQ2: How Do Monthly Failure Rates Vary
--  by Payment Method?
-- =========================================


SELECT
    payment_method,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 1
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 1
            ),
            0
        ),
        2
    ) AS january,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 2
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 2
            ),
            0
        ),
        2
    ) AS february,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 3
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 3
            ),
            0
        ),
        2
    ) AS march,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 4
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 4
            ),
            0
        ),
        2
    ) AS april,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 5
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 5
            ),
            0
        ),
        2
    ) AS may,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 6
              AND transaction_status = 'Failed'
        ) / NULLIF(
            COUNT(*) FILTER (
                WHERE EXTRACT(MONTH FROM transaction_date::DATE) = 6
            ),
            0
        ),
        2
    ) AS june

FROM payment_transactions
GROUP BY payment_method
ORDER BY payment_method;


-- =========================================
-- BQ3: What Is the Percentage Distribution of Failed Transaction Reasons?
-- =========================================

SELECT
    failure_reason,
    COUNT(*) AS total_transactions,
    ROUND(
        COUNT(*) * 100.0 / (
            SELECT COUNT(*)
            FROM payment_transactions
            WHERE transaction_status = 'Failed'
        ),
        2
    ) AS percentage
FROM payment_transactions
WHERE transaction_status = 'Failed'
GROUP BY failure_reason
ORDER BY percentage DESC;

-- =========================================
-- BQ4: How Do Successful, Failed, and Cancelled Transaction Rates and Transaction Volumes Vary 
-- by Hour of the Day?
-- =========================================


SELECT
    TO_CHAR((transaction_hour || ' hour')::interval, 'HH24:MI') AS transaction_hour,
    COUNT(*) AS total_transactions,

    COUNT(CASE
        WHEN transaction_status = 'Successful' THEN 1
    END) AS successful_transactions,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Successful' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS success_rate,

    COUNT(CASE
        WHEN transaction_status = 'Failed' THEN 1
    END) AS failed_transactions,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Failed' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate,

    COUNT(CASE
        WHEN transaction_status = 'Cancelled' THEN 1
    END) AS cancelled_transactions,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Cancelled' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate

FROM payment_transactions
GROUP BY transaction_hour
ORDER BY transaction_hour;

-- =========================================
-- BQ5: How Do Transaction Counts and Device Type Distributions Vary Across Merchant Categories?
-- =========================================

SELECT
    merchant_category,

    COUNT(CASE
        WHEN device_type = 'Mobile' THEN 1
    END) AS mobile_transactions,

    ROUND(
        COUNT(CASE
            WHEN device_type = 'Mobile' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS mobile_percentage,

    COUNT(CASE
        WHEN device_type = 'Web' THEN 1
    END) AS web_transactions,

    ROUND(
        COUNT(CASE
            WHEN device_type = 'Web' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS web_percentage,

    COUNT(CASE
        WHEN device_type IS NULL THEN 1
    END) AS missing_device_count,

    ROUND(
        COUNT(CASE
            WHEN device_type IS NULL THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS missing_device_percentage

FROM payment_transactions
GROUP BY merchant_category
ORDER BY merchant_category;

-- =========================================
-- BQ6: How Do Payment Method Preferences and Transaction Success and Failure Rates Vary Across Customer Segments?
-- =========================================


SELECT
    customer_segment,
    payment_method,

    COUNT(transaction_id) AS total_transactions,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Successful' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS success_rate,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Failed' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate,

    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Cancelled' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate

FROM payment_transactions
GROUP BY
    customer_segment,
    payment_method
ORDER BY
    customer_segment,
    payment_method;

-- =========================================
-- BQ7: How Does the Average Transaction Amount Vary Across Successful, Failed, and Cancelled Transactions?
-- =========================================

SELECT
    transaction_status AS transaction_status,

    TO_CHAR(
        ROUND(AVG(transaction_amount), 2),
        'FM999G999G999G990D00'
    ) AS average_transaction_amount

FROM payment_transactions
GROUP BY transaction_status
ORDER BY transaction_status;


-- =========================================
-- BQ8: How Do Transaction Counts and Success Rates Vary by City?
-- =========================================

SELECT
    city,
    COUNT(*) AS total_count,
    COUNT(CASE
        WHEN transaction_status = 'Successful' THEN 1
    END) AS total_success_count,
    ROUND(
        COUNT(CASE
            WHEN transaction_status = 'Successful' THEN 1
        END) * 100.0 / COUNT(*),
        2
    ) AS success_rate
FROM payment_transactions
GROUP BY city
ORDER BY success_rate DESC;
