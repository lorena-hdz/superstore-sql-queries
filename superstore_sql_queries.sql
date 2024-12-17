-- =======================================================
-- Superstore SQL Queries

-- Description: This file contains SQL queries for analyzing the Superstore dataset to extract
-- key insights on sales, profit, order distribution, and product performance.
-- =======================================================

-- 1️⃣ Total Sales, Profit, and Quantity for 2017
SELECT 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit, 
    SUM(Quantity) AS Total_Quantity 
FROM superstore 
WHERE YEAR(Order_Date) = 2017;

-- 2️⃣ Top 5 Products by Sales Amount
SELECT 
    Product_Name, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
GROUP BY Product_Name 
ORDER BY Total_Sales DESC 
LIMIT 5;

-- 3️⃣ Monthly Sales for 2017
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
WHERE YEAR(Order_Date) = 2017 
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m') 
ORDER BY Month;

-- 4️⃣ Profit by Product Subcategory
SELECT 
    Subcategory, 
    SUM(Profit) AS Total_Profit 
FROM superstore 
GROUP BY Subcategory 
ORDER BY Total_Profit DESC;

-- 5️⃣ Top 3 Most Profitable Subcategories
SELECT 
    Subcategory, 
    SUM(Profit) AS Total_Profit 
FROM superstore 
GROUP BY Subcategory 
ORDER BY Total_Profit DESC 
LIMIT 3;

-- 6️⃣ Percentage of Orders by Shipping Mode
SELECT 
    Shipping_Mode, 
    COUNT(Order_ID) AS Total_Orders, 
    ROUND((COUNT(Order_ID) * 100.0 / (SELECT COUNT(Order_ID) FROM superstore)), 2) AS Order_Percentage 
FROM superstore 
GROUP BY Shipping_Mode 
ORDER BY Order_Percentage DESC;

-- 7️⃣ Rank Products by Sales in 2017 (Using Window Function)
SELECT 
    Product_Name, 
    SUM(Sales) AS Total_Sales, 
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank 
FROM superstore 
WHERE YEAR(Order_Date) = 2017 
GROUP BY Product_Name 
ORDER BY Sales_Rank 
LIMIT 10;

-- 8️⃣ Find the Category with the Highest Sales in Each Region
SELECT 
    Region, 
    Category, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
GROUP BY Region, Category 
HAVING SUM(Sales) = (
    SELECT MAX(SUM(Sales)) 
    FROM superstore AS s2 
    WHERE s2.Region = superstore.Region 
    GROUP BY Category
);

-- 9️⃣ Year-over-Year Sales Growth from 2016 to 2017
SELECT 
    YEAR(Order_Date) AS Year, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
WHERE YEAR(Order_Date) IN (2016, 2017) 
GROUP BY YEAR(Order_Date) 
ORDER BY Year;

-- 🔟 Orders Shipped Same-Day vs. Other Shipping Modes
SELECT 
    CASE 
        WHEN Shipping_Mode = 'Same Day' THEN 'Same Day' 
        ELSE 'Other Modes' 
    END AS Shipping_Type, 
    COUNT(Order_ID) AS Total_Orders 
FROM superstore 
GROUP BY Shipping_Type;
