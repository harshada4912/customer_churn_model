
-- Load cleaned CSV into MySQL

USE customer_churn_db;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_churn_dataset.csv'
INTO TABLE customer_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



SHOW VARIABLES LIKE 'secure_file_priv';

-- VERIFY LOAD
SELECT COUNT(*) FROM customer_churn;

select* from customer_churn;


