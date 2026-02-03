

USE customer_churn_db;

-- 1. Overall Churn Rate

SELECT
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn;



-- 2. Churn by Subscription Type
SELECT
    subscription_type,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY subscription_type
ORDER BY churn_rate_pct DESC;

-- 3. Churn by Contract Length
SELECT
    contract_length,
    COUNT(*) AS customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY contract_length;

-- 4. Support Calls Impact
SELECT
    support_calls,
    COUNT(*) AS customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY support_calls
ORDER BY support_calls;

 -- 5. Payment Delay Impact
SELECT
    payment_delay,
    COUNT(*) AS customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY payment_delay
ORDER BY payment_delay;



-- 6. Churn by Gender
SELECT
    gender,
    COUNT(*) AS customers,
    ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY gender;

-- 7. Average Metrics (Active vs Churned)
SELECT
    churn,
    AVG(tenure) AS avg_tenure,
    AVG(total_spend) AS avg_spend,
    AVG(support_calls) AS avg_support_calls
FROM customer_churn
GROUP BY churn;



-- 8. Top 10 Most Expensive Customers

SELECT *
FROM customer_churn
ORDER BY total_spend DESC
LIMIT 10;
