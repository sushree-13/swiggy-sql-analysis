<div align="[center](https://thebrandhopper.com/wp-content/uploads/2020/11/swiggy_lfd_3.jpg)">
<div align="center">
<img src="images/swiggy-logo.png" width="180" alt="Swiggy Logo">

# Swiggy SQL Data Analysis Project

### Restaurant Data Analysis Using MySQL

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![SQL](https://img.shields.io/badge/Language-SQL-orange)
![Project](https://img.shields.io/badge/Project-Data%20Analysis-green)

</div>

---

## 📌 Project Overview

This project focuses on analysing Swiggy restaurant data using MySQL to uncover meaningful business insights.

The objective is to analyse restaurant distribution, popular cuisines, restaurant ratings, pricing patterns, and city-wise performance using SQL queries.

This project demonstrates how SQL can be used to clean, analyse, and interpret real-world datasets to support data-driven business decisions.

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- GitHub

## 📂 Dataset Description

The dataset contains information about Swiggy restaurants, including:

- Restaurant Names
- Cities
- Ratings
- Rating Counts
- Cost for Two
- Cuisines
- Restaurant Addresses

**Dataset:** `swiggy.csv`

---

# 📊 SQL Analysis & Business Questions

## Q1. How many restaurants are listed per city?

**Objective:** Identify the cities with the highest number of restaurants.

```sql
SELECT
    city,
    COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC
LIMIT 10;
```

**Business Insight:** Helps identify cities with the highest restaurant concentration.

**Result:** Add your query output here.

---

## Q2. What are the most popular cuisines across India?

**Objective:** Identify the most frequently listed cuisines.

```sql
SELECT
    cuisine,
    COUNT(*) AS total_count
FROM swiggy
WHERE cuisine IS NOT NULL
GROUP BY cuisine
ORDER BY total_count DESC
LIMIT 10;
```

**Business Insight:** Helps understand customer food preferences and popular cuisine categories.

**Result:** Add your query output here.

---

## Q3. Which restaurant chains have the most branches?

**Objective:** Identify restaurant brands with the highest number of branches.

```sql
SELECT
    name AS restaurant_name,
    COUNT(*) AS branches
FROM swiggy
WHERE name IS NOT NULL
GROUP BY name
ORDER BY branches DESC
LIMIT 10;
```

**Business Insight:** Helps identify restaurant brands with a strong presence across locations.

**Result:** Add your query output here.

---

## Q4. Which cities have the highest average restaurant ratings?

**Objective:** Find the top 5 cities based on average restaurant ratings, considering cities with more than 50 restaurants.

```sql
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
```

**Business Insight:** Helps identify cities with better-rated restaurant options.

**Result:** Add your query output here.

---

## Q5. What is the average cost for two across cities?

**Objective:** Compare restaurant pricing across different cities.

```sql
SELECT
    city,
    ROUND(
        AVG(CAST(REPLACE(cost, ',', '') AS DECIMAL(10,2))),
        0
    ) AS avg_cost
FROM swiggy
WHERE cost IS NOT NULL
GROUP BY city
ORDER BY avg_cost DESC
LIMIT 10;
```

**Business Insight:** Helps understand restaurant pricing differences across cities.

**Result:** Add your query output here.

---

## Q6. Which cuisines have the highest average ratings?

**Objective:** Identify highly rated cuisines with more than 100 restaurants.

```sql
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
```

**Business Insight:** Helps identify cuisines associated with higher customer satisfaction.

**Result:** Add your query output here.

---

## Q7. Which restaurants have ratings above 4.5 and more than 1,000 ratings?

**Objective:** Identify highly rated restaurants with a significant number of customer ratings.

```sql
SELECT
    name,
    city,
    rating,
    rating_count,
    cost
FROM swiggy
WHERE CAST(rating AS FLOAT) > 4.5
AND CAST(REPLACE(rating_count, '+', '') AS DECIMAL) >= 1000
ORDER BY rating DESC
LIMIT 20;
```

**Business Insight:** Helps identify restaurants with strong customer ratings and engagement.

**Result:** Add your query output here.

---

## Q8. Which cities offer the best value for money?

**Objective:** Compare average restaurant ratings and average costs to identify cities offering good value.

```sql
SELECT
    city,
    ROUND(AVG(CAST(rating AS FLOAT)), 2) AS avg_rating,
    ROUND(
        AVG(CAST(REPLACE(cost, ',', '') AS DECIMAL(10,2))),
        0
    ) AS avg_cost
FROM swiggy
WHERE rating NOT IN ('NEW', '--')
AND rating IS NOT NULL
AND cost IS NOT NULL
GROUP BY city
HAVING COUNT(*) > 30
ORDER BY avg_rating DESC, avg_cost ASC
LIMIT 10;
```

**Business Insight:** Helps compare restaurant quality and affordability across cities.

**Result:** Add your query output here.

---

# 📈 Key Findings

The following findings will be updated after executing the SQL queries.

| Business Metric | Result |
|---|---|
| City with the most restaurants | To be updated |
| Most popular cuisine | To be updated |
| Restaurant chain with maximum branches | To be updated |
| Best-rated city | To be updated |
| Most expensive city | To be updated |
| Cheapest city | To be updated |
| Best value-for-money city | To be updated |

---

# 💡 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- LIMIT
- COUNT()
- AVG()
- ROUND()
- CAST()
- REPLACE()
- TRIM()
- Aggregate Functions
- Data Cleaning
- Data Type Conversion

---

# 📁 Project Structure

```text
Swiggy-SQL-Data-Analysis/
│
├── Swiggy_Analysis.sql
├── README.md
├── swiggy.csv
│
└── images/
    └── swiggy-logo.png
```

---

# 🚀 How to Run This Project

1. Clone or download this GitHub repository.
2. Open MySQL Workbench.
3. Create a database.
4. Import the `swiggy.csv` dataset.
5. Create or verify the table named `swiggy`.
6. Open `Swiggy_Analysis.sql`.
7. Execute the SQL queries.
8. Review the results and business insights.

---

# 🎯 Conclusion

This project demonstrates the practical application of SQL in analysing restaurant data and generating meaningful business insights.

By solving eight business questions, this analysis explores restaurant distribution, cuisine popularity, restaurant ratings, pricing trends, and city-wise performance.

It helped strengthen my understanding of SQL querying, data cleaning, aggregation, filtering, and analytical thinking.

---

# 👨‍💻 Author

**Your Name**

Aspiring Data Analyst

Skills: SQL | MySQL | Excel | Power BI

---

⭐ If you find this project useful, feel free to star the repository!
