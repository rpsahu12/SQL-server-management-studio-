
select distinct country from gold.dim_customers

select distinct cateogory, subcateogory, product_name from gold.dim_products
group by cateogory, subcateogory, product_name

--date explore
select min(order_date) first_order_date,
max(order_date) last_order_date,
DATEDIFF(MONTH,min(order_date),max(order_date)) as order_range_months
from gold.fact_sales

--analyse measure
select count(customer_key) as total_customers from gold.dim_customers;
select count(distinct customer_key) as total_customer_orders from gold.fact_sales

--genarte report
select 'total_sales' as mesaure_name,sum(sales_amount) as measure_value from gold.fact_sales
union all
select 'total_quantity' as mesaure_name,sum(quantity) as measure_value from gold.fact_sales


--top spender
select
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
group by c.customer_key,c.first_name,c.last_name
order by total_revenue desc

--rank 
select *
from(
	select
	p.product_name,
	sum(f.sales_amount) total_revenue,
	ROW_NUMBER() over(order by sum(f.sales_amount) desc ) as rank_products
	from gold.fact_sales f
	left join gold.dim_products p
	on p.product_key=f.product_key
	group by p.product_name)t
where rank_products<=5
