create database company;
select * from sales;

-- find all orders shipped via "Economy" mode with a total amount greater than 25,000
SELECT * FROM sales
WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;

-- Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01. 
SELECT * FROM sales
WHERE Category = 'Technology' AND Country = 'Ireland' AND Order_Date > '01-01-2020';

-- list the top 10 most profitable sales trnsacctions in descending order
select * from sales
order by Unit_Profit desc
limit 10;   -- top 10 transactions

select * from sales
order by Unit_Profit desc
limit 10, 20;   -- skip 10 records, showing next 20 records

-- find all customers whose name starts with 'J' and ends with 'n'. 
select Order_ID, Customer_Name from sales
where Customer_Name like 'J%n';

-- Retrieve all product names that contain 'Acco' anywhere in the name
select Order_ID, Product_Name from sales
where Product_Name like '%acco%';

-- get the top 5 cities with the highest total sales amount
select City, sum(Total_Amount) Total_Sales from sales
group by City
order by Total_Sales desc
limit 5;

-- display the second set of 10 records for Customer_Name and Total_Amount in descending order
select Customer_Name, Total_Amount from sales
order by Total_Amount desc
limit 10, 10;

-- Find the total revenue, average unit cost, and total number of orders
select sum(Total_Amount) as 'Total Revenue', avg(Unit_Cost) as 'Average unit cost', count(Order_ID) as 'total number of orders'
from sales;

-- count unique number of regions
select count(distinct(Region)) as 'unique region' from sales; 
 
 -- find the number of orders placed by each customer
 select Customer_Name, count(Order_ID) as 'order_count' from sales
 group by Customer_Name
 order by order_count desc ;
 
 -- rank 5 products based on total sales using RANK()
 SELECT Product_Name, sum(Total_Amount) as Total_Sales,
 RANK() OVER  (ORDER BY sum(Total_Amount) Desc) as Product_Sales
 from sales
 order by Product_Name
 limit 5;
