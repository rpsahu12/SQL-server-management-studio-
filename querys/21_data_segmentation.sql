
select
cost_range,
count(product_key) as total_products
from(
select
product_key,
product_name,
product_cost,
case when product_cost<100 then 'below 100'
	when product_cost between 100 and 500 then '100-500'
	when product_cost between 500 and 1000 then '500-1000'
	else 'above 1000'
	end cost_range
from gold.dim_products)t
group by cost_range
order by total_products desc