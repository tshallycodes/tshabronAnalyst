-- 2. Calculate Total Sales
SELECT SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Total Sales Amount"
FROM sales;

-- 3. Sales Summary by Location
SELECT "location", SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Sales Amount"
FROM sales
GROUP BY "location"
ORDER BY "Sales Amount" DESC;

-- 4. Top 5 Locations by Sales
SELECT "location", SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Sales Amount"
FROM sales
GROUP BY "location"
ORDER BY "Sales Amount" DESC
LIMIT 5;

-- 5. Sales Summary by Month
SELECT TO_CHAR("date"::DATE, 'YYYY-MM') AS "Month", SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Monthly Sales"
FROM sales
GROUP BY TO_CHAR("date"::DATE, 'YYYY-MM')
ORDER BY "Month";

-- 6. Top 5 Locations by Items Sold
SELECT "location", SUM("total_items"::INTEGER) AS "Total Items Sold"
FROM sales
GROUP BY "location"
ORDER BY "Total Items Sold" DESC
LIMIT 5;

-- 7. Sales Summary by Month & Location
SELECT TO_CHAR("date"::DATE, 'YYYY-MM') AS "Month", "location", SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Monthly Sales"
FROM sales
GROUP BY TO_CHAR("date"::DATE, 'YYYY-MM'), "location"
ORDER BY "Month", "location";

-- 8. Average and Total Sales for Q1 (January, February, March)
SELECT
    AVG(REPLACE("total_paid", ',', '')::NUMERIC) AS "Average Sales Q1",
    SUM(REPLACE("total_paid", ',', '')::NUMERIC) AS "Total Sales Q1"
FROM sales
WHERE EXTRACT(MONTH FROM "date"::DATE) IN (1, 2, 3);
