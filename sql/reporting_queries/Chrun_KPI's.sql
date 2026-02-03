-- 1. Total Customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customer_churn;


-- 2. Active Customers

SELECT COUNT(*) AS active_customers
FROM customer_churn
WHERE churn = 0;


-- 3. Churned Customers

SELECT COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 1;

-- 4. Churn Rate %
SELECT 
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM customer_churn;


-- 5. Total Revenue
SELECT 
    SUM(total_spend) AS total_revenue
FROM customer_churn;


-- 6. Average Monthly Spend
SELECT 
    ROUND(AVG(total_spend / tenure), 2) AS avg_monthly_spend
FROM customer_churn
WHERE tenure > 0;



-- 7. Average Tenure
SELECT 
    ROUND(AVG(tenure), 1) AS avg_tenure_months
FROM customer_churn;


-- 8. Avg Support Calls
SELECT 
    ROUND(AVG(support_calls), 2) AS avg_support_calls
FROM customer_churn;


-- 9. Churn by Gender
SELECT 
    gender,
    COUNT(*) AS customers,
    SUM(churn) AS churned,
    ROUND(SUM(churn)*100/COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY gender;


-- 11. Churn by Contract Length
SELECT 
    contract_length,
    ROUND(SUM(churn)*100/COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY contract_length;