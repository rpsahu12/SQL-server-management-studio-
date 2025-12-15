with total_sales_cat as (
select
cateogory,
sum(sales_amount) total_sales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key=f.product_key
group by cateogory)

select
cateogory,
total_sales,
sum(total_sales) over() overall_sales,
concat(round((cast(total_sales as float)/sum(total_sales) over() )*100,2),'%') as percentage_of_total
from total_sales_cat
order by total_sales