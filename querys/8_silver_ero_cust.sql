insert into silver.erp_cust_az12(
cid,bdate,gen)

select 
case when cid like 'NAS%' then SUBSTRING(cid,4,len(cid))
	else cid
end cid,
case when bdate>getdate() then null
	else bdate
	end bdate,
case when upper(trim(gen)) in('F','Female') then 'Female'
	when upper(trim(gen)) in ('M','Male') then 'Male'
	when gen is null then 'N/A'
	when gen in('') then 'N/A'
	else gen
	end gen
from bronze.erp_cust_az12

--test
/*where case when cid like 'NAS%' then SUBSTRING(cid,4,len(cid))
	else cid
end not in (select distinct cst_key from silver.crm_crust_info)*/

/* select distinct gen,
case when upper(trim(gen)) in('F','Female') then 'Female'
	when upper(trim(gen)) in ('M','Male') then 'Male'
	when gen is null then 'N/A'
	when gen in('') then 'N/A'
	else gen
	end gen
from bronze.erp_cust_az12 */