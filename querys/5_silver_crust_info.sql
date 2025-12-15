
--clean duplicate and customization
--we can cleaning data and inserting it into silver table
insert into silver.crm_crust_info(cst_id,cst_key,cst_firstname,cst_lastname,cst_gndr,cst_material_status,cst_create_date)
select
cst_id,
cst_key,
trim(cst_firstname) as cst_firstname,
trim(cst_lastname) as cst_lastname,
case when upper(trim(cst_gndr))='F' then 'Female'
	 when upper(trim(cst_gndr))='M' then 'male'
	else 'n/a'
	end cst_gndr,
case when upper(trim(cst_material_status))='S' then 'single'
	 when upper(trim(cst_material_status))='M' then 'married'
	else 'n/a'
	end cst_material_status,
cst_create_date
from(
select*,
row_number() over(partition by cst_id order by cst_create_date desc) as flag_last
from bronze.crm_crust_info
where cst_id is not null
) t where flag_last=1

--

--check for nulls or dupplicates in primary key
select
cst_id,
count(*)
from bronze.crm_crust_info
group by cst_id
having count(*)>1 or cst_id is null


--check for unwanted space
select 
cst_firstname
from bronze.crm_crust_info
where cst_firstname!=trim(cst_firstname)

--check for data standardization & consistency
select distinct cst_gndr
from bronze.crm_crust_info
