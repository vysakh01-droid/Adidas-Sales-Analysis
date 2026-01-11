TRUNCATE TABLE adidas RESTART IDENTITY;
DROP TABLE IF EXISTS adidas
CREATE TABLE adidas (
     Order_ID SERIAL PRIMARY KEY,
	 Order_Date VARCHAR(100),
	 SKU VARCHAR(100),
	 Product_Name VARCHAR(100),
	 Category VARCHAR(100),
	 Region VARCHAR(100),
	 Store_Type VARCHAR(100),
	 Units_Sold INT,
	 Unit_Price VARCHAR(100),
	 Discount INT,
	 Revenue DECIMAL(10,2),
	 Profit DECIMAL(10,2),
	 Customer_Age INT,
	 Gender VARCHAR(100),
	 Payment_Method VARCHAR(100)
);

SELECT*FROM adidas

--1.Total Revenue by Male vs Female vs Other?
select gender, SUM(revenue) AS total_revenue
from adidas
group by gender;

--2. Average Unit price for each product catogory?
select category, AVG(unit_price::numeric) AS avg_unit_price
from adidas
group by category;

--3.Region Generate Highest Total Profit?
select region, SUM(profit) AS total_profit
from adidas
group by region
order by total_profit desc
limit 1;

--4.Units Sold for Each store Type?
select store_type, SUM(units_sold) AS total_units_sold
from adidas
group by store_type;

--5.Total Revenue and Profit for each payment method?
select payment_method, SUM(revenue) AS total_revenue, SUM(profit) AS total_profit
from adidas
group by payment_method;

--6.Which Product hasighest total revenue?
select product_name, SUM(revenue) AS total_revenue
from adidas
group by product_name
order by total_revenue desc
limit 1;

--7.list of orders were placeed by customers of each age group?
select customer_age, COUNT(order_id) AS order_count
from adidas
group by customer_age;

--8.Average discount given per Region?
select region, AVG(discount) AS avg_discount
from adidas
group by region;