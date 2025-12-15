create view gold.dim_customers as
SELECT
       ROW_NUMBER() over(order by cst_id) as customer_key,
       [cst_id] as customer_id
      ,[cst_key] as customer_number
      ,[cst_firstname] as first_name
      ,[cst_lastname] as last_name
      ,la.cntry as country
      ,[cst_material_status] as marital_status,
      case when ci.cst_gndr!='n/a' then ci.cst_gndr
        else coalesce(ca.gen,'n/a')
        end gender,
        ca.bdate as birthdate,
        ci.cst_create_date as create_date
  FROM [silver].[crm_crust_info] as ci
left join silver.erp_cust_az12 as ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid

/*select distinct 
ci.cst_gndr,
ca.gen,
case when ci.cst_gndr!='n/a' then ci.cst_gndr
    else coalesce(ca.gen,'n/a')
    end new_gen
 FROM [silver].[crm_crust_info] as ci
left join silver.erp_cust_az12 as ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid
order by 1,2*/
