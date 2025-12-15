with yearly_product_sales as (
select
datetrunc(year,order_date) as order_year,
pr.product_name,
sum(sales_amount) as current_sales
from gold.fact_sales fc
left join gold.dim_products pr
on pr.product_key=fc.product_key
where order_date is not null
group by datetrunc(year,order_date),product_name
)

select 
order_year,
product_name,
current_sales,
avg(current_sales) over(partition by product_name) avg_sales,
current_sales-avg(current_sales) over(partition by product_name) as diff_avg,
case when current_sales-avg(current_sales) over(partition by product_name)>0 then 'above'
	else 'below'
	end indicator,
lag(current_sales) over(partition by product_name order by order_year) as prev_sales,
current_sales-lag(current_sales) over(partition by product_name order by order_year) as diff_py
from yearly_product_sales
order by product_name,order_year