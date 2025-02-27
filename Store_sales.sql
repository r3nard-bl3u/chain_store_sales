CREATE DATABASE store_sales;


USE store_sales;

 
CREATE TABLE sales_data (
Row_ID INT,
Order_ID VARCHAR(50),
Order_Date DATE,
Ship_Date DATE,
Ship_Mode VARCHAR(50),
Customer_ID VARCHAR(50),
Customer_Name VARCHAR(50),
Segment VARCHAR(50),
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Postal_Code VARCHAR(20),
Region VARCHAR(10),
Product_ID VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(300),
Sales DECIMAL(10,2)
);


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\train.csv' INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT SUM(Sales) AS Total_Sales FROM Sales_data;

SELECT AVG(Sales) AS average_sales_per_order FROM Sales_data;


SELECT YEAR(Order_Date) AS Year, SUM(Sales) AS Total_Sales
FROM Sales_data
GROUP BY YEAR(Order_Date)
ORDER BY Year;


SELECT 
    YEAR(Order_Date) AS Year, 
    MONTHNAME(Order_Date) AS Month, 
    SUM(Sales) AS Total_Sales
FROM 
    Sales_data
GROUP BY 
    YEAR(Order_Date), 
    MONTH(Order_Date), 
    MONTHNAME(Order_Date)  -- Add MONTHNAME to GROUP BY
ORDER BY 
    Year, 
    MONTH(Order_Date);


SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category;


SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region;


SELECT State, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY State;


SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;


SELECT Segment, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Segment;


SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;


SELECT Customer_Name, COUNT(Order_ID) AS Order_Count
FROM sales_data
GROUP BY Customer_Name
ORDER BY Order_Count DESC;
