with customer_spending as(
select 
c.customer_key,
sum(sales_amount) as total_spending ,
min(order_date) first_order,
max(order_date) last_order,
datediff(month,min(order_date),max(order_date)) as life_span
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key=f.customer_key
group by c.customer_key)

select
case when life_span >=12 and total_spending>5000 then 'VIP'
	when life_span >=12 and total_spending<=5000 then 'Regular'
	else 'new'
	end customer_segment,
count(customer_key) as total_customers
from customer_spending
group by case when life_span >=12 and total_spending>5000 then 'VIP'
	when life_span >=12 and total_spending<=5000 then 'Regular'
	else 'new'
	end

--here we can use subquery to make it presentable
