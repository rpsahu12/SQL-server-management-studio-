create view gold.dim_products as

SELECT ROW_NUMBER() over(order by pn.prd_start_dt,pn.prd_key) as product_key,
       [prd_id] as product_id
      ,[prd_key] as product_number
      ,[prd_nm] as product_name
      ,[cat_id] as category_id
      ,pc.cat as cateogory
      ,pc.subcat as subcateogory
      ,pc.maintenance
      ,[prd_cost] as product_cost
      ,[prd_line] as product_line
      ,[prd_start_dt] as start_date
  FROM [silver].[crm_prd_info] pn
  left join silver.erp_px_cat_g1v2 pc
  on pn.cat_id=pc.id
  where  prd_end_dt is null --filtyer out all histrocial data


