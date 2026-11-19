USE practice;

-- STEP 1: Check total records
SELECT COUNT(*) AS total_records
FROM swiggy;

-- STEP 2: Check NULL values in important columns
SELECT
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_names,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_cities
FROM swiggy;

-- STEP 3: Check unique rating values
SELECT DISTINCT rating
FROM swiggy;

-- STEP 4: Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- STEP 5: Remove restaurants with NEW or -- ratings
DELETE FROM swiggy
WHERE UPPER(TRIM(rating)) IN ('NEW', '--');

-- STEP 6: Replace invalid and empty ratings with NULL
UPDATE swiggy
SET rating = NULL
WHERE rating IS NULL
   OR TRIM(rating) = ''
   OR TRIM(rating) NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

-- STEP 7: Convert rating into numeric format
ALTER TABLE swiggy
MODIFY COLUMN rating DECIMAL(3,1) NULL;

-- STEP 8: Enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- STEP 9: Check cleaned records
SELECT *
FROM swiggy;

-- STEP 10: Check total records after cleaning
SELECT COUNT(*) AS total_records_after_cleaning
FROM swiggy;

-- STEP 11: Check rating values
SELECT DISTINCT rating
FROM swiggy;

-- STEP 12: Check final table structure
DESCRIBE swiggy;

-- Q1: How many restaurants are listed per city?
SELECT
    city,
    COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 10;


-- Q2: What are the most popular cuisines across India?
SELECT
    cuisine,
    COUNT(*) AS total_count
FROM swiggy
WHERE cuisine IS NOT NULL
GROUP BY cuisine
ORDER BY total_count DESC
LIMIT 10;

-- Q3: Which restaurant chains have the most branches?
SELECT
    name AS restaurant_name,
    COUNT(*) AS branches
FROM swiggy
WHERE name IS NOT NULL
GROUP BY name
ORDER BY branches DESC
LIMIT 10;


-- Q4: Top 5 cities with highest average restaurant rating
SELECT
    city,
    ROUND(AVG(rating), 2) AS avg_rating,
    COUNT(*) AS total_restaurants
FROM swiggy
WHERE rating IS NOT NULL
  AND city IS NOT NULL
GROUP BY city
HAVING COUNT(*) > 50
ORDER BY avg_rating DESC
LIMIT 5;


-- Q5: What is the average cost for two across cities?
SELECT city,
       ROUND(AVG(CAST(REPLACE(cost, ',', '') AS DECIMAL)), 0) AS avg_cost
FROM swiggy
WHERE cost IS NOT NULL
GROUP BY city
ORDER BY avg_cost DESC
LIMIT 10;


-- Q6: Which cuisines have the highest average rating?
SELECT
    cuisine,
    ROUND(AVG(rating), 2) AS avg_rating,
    COUNT(*) AS restaurant_count
FROM swiggy
WHERE rating IS NOT NULL
  AND cuisine IS NOT NULL
GROUP BY cuisine
HAVING COUNT(*) > 100
ORDER BY avg_rating DESC
LIMIT 10;


-- Q7: Restaurants with rating above 4.5
-- and more than 1000 ratings
SELECT name, city, rating, rating_count, cost
FROM swiggy
WHERE CAST(rating AS FLOAT) >= 4.5
  AND CAST(REPLACE(rating_count, '+', '') AS DECIMAL) >= 1000
ORDER BY rating DESC
LIMIT 20;


-- Q8: Which city has the best value for money?
-- High rating and low average cost
SELECT city,
       ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
       ROUND(AVG(CAST(REPLACE(cost, ',', '') AS DECIMAL)), 0) AS avg_cost
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
GROUP BY city
HAVING COUNT(*) > 30
ORDER BY avg_rating DESC, avg_cost ASC
LIMIT 10;
