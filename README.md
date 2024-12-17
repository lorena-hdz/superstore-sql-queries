# superstore-sql-queries
A collection of SQL queries analyzing the Superstore dataset to extract business insights.
# 📊 Superstore SQL Queries  

This repository contains a collection of SQL queries designed to analyze and generate insights from the Superstore dataset. The queries showcase a range of SQL concepts, including data aggregation, filtering, window functions, and subqueries.  

## 📋 **Dataset Overview**  
The dataset contains sales, profit, and order data for a fictional superstore, covering product categories, subcategories, shipping modes, and customer orders. The analysis focuses on performance for the year 2017 with comparisons to previous years.  

## 🎯 **Objectives**  
This project demonstrates proficiency in SQL by:  
- Extracting key performance metrics such as profit, sales, and quantity.  
- Analyzing product performance by subcategory and identifying top-performing items.  
- Evaluating shipping mode efficiency and order distribution.  
- Using advanced SQL techniques to identify trends and patterns for business insights.  

## 💡 **SQL Concepts Demonstrated**  
1. **Data Aggregation**: Summing sales, profits, and quantities.  
2. **Grouping and Filtering**: Grouping by product category, subcategory, and shipping modes.  
3. **Window Functions**: Ranking products by sales using `RANK()`.  
4. **Subqueries**: Identifying categories with the highest sales in each region.  
5. **Conditional Logic**: Using `CASE` statements for custom groupings.  

## 📂 **Featured SQL Queries**  
### 🔹 **Total Sales, Profit, and Quantity for 2017**  
(```sql
SELECT 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit, 
    SUM(Quantity) AS Total_Quantity 
FROM superstore 
WHERE YEAR(Order_Date) = 2017);

### 🔹 **Top 5 Products by Sales**
(```sql
SELECT 
    Product_Name, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
GROUP BY Product_Name 
ORDER BY Total_Sales DESC 
LIMIT 5);

### 🔹 **Year-over-Year Sales Growth**
(```sql
SELECT 
    YEAR(Order_Date) AS Year, 
    SUM(Sales) AS Total_Sales 
FROM superstore 
WHERE YEAR(Order_Date) IN (2016, 2017) 
GROUP BY YEAR(Order_Date) 
ORDER BY Year);

### 🔹 **Orders Shipped Same-Day vs. Other Shipping Modes**
(```sql
SELECT 
    CASE 
        WHEN Shipping_Mode = 'Same Day' THEN 'Same Day' 
        ELSE 'Other Modes' 
    END AS Shipping_Type, 
    COUNT(Order_ID) AS Total_Orders 
FROM superstore 
GROUP BY Shipping_Type);

## 🚀 **How to Use**  
1. **Download the SQL file**: Click on the `superstore_sql_queries.sql` file and select "Download."  
2. **Run the queries in your SQL environment**: Use a platform like MySQL, PostgreSQL, or SQL Server.  
3. **View the results**: The queries will display key insights like total sales, profit, and product performance for 2017.  

If you don't have access to a SQL environment, you can review the SQL queries directly in this repository.  

## 🛠️ **Skills Highlighted**  
- Proficiency in SQL for data analysis and business intelligence.  
- Expertise in crafting complex queries for real-world datasets.  
- Clear and efficient data visualization and interpretation.  

## 📢 **About**  
This project is part of a broader portfolio showcasing data analytics and visualization skills. The same dataset has been visualized in **[Tableau](https://public.tableau.com/views/SuperstoreSales_17321429271930/SuperstorePerformance?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**, where key metrics and trends are highlighted in an interactive dashboard.  
