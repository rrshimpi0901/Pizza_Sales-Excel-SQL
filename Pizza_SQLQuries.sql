select sum(total_price) as Total_Revenue from dbo.pizza_sales

select * from dbo.pizza_sales

select sum(total_price) / count(distinct order_id) as AVG_Order_Value from dbo.pizza_sales

select sum(quantity) as Total_pizza_sold from dbo.pizza_sales

select count(distinct order_id) as Total_Orders from dbo.pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) 
	/ CAST(COUNT(DISTINCT order_id) 
		AS DECIMAL(10,2)) 
		as DECIMAL(10,2))
		as AVG_PIZZAS_PER_ORDER from dbo.pizza_sales\

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales WHERE MONTH(order_date)=1 )) AS PCT
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category


SELECT pizza_size, cast(SUM(total_price) as decimal (10,2)) as total_sales, cast(sum(total_price) *100 / 
(select SUM(total_price) from pizza_sales) as decimal (10,2)) AS PCT
from pizza_sales
GROUP BY pizza_size
ORDER BY PCT desc

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
--WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


select distinct pizza_category as pizza_category from dbo.pizza_sales
select sum(total_price) as pizza_category_price from dbo.pizza_sales

select pizza_category , cast(sum(total_price) AS DECIMAL(10,2)) as total_revenue from dbo.pizza_sales
group by pizza_category

select pizza_category , sum(total_price) as total_revenue from dbo.pizza_sales
group by pizza_category

select pizza_category , sum(quantity) as total_quanity from dbo.pizza_sales
group by pizza_category