# SQL-server-management-studio

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights.

---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

```
SQL-server-management-studio-
├─ datasets
│  ├─ source_crm
│  │  ├─ cust_info.csv
│  │  ├─ prd_info.csv
│  │  └─ sales_details.csv
│  └─ source_erp
│     ├─ CUST_AZ12.csv
│     ├─ LOC_A101.csv
│     └─ PX_CAT_G1V2.csv
├─ LICENSE
├─ querys
│  ├─ 10_silver_erp_px_cat.sql
│  ├─ 11_gold_dim_customer.sql
│  ├─ 12_gold_dim_product.sql
│  ├─ 13_gold_fact_sales.sql
│  ├─ 14_connection_check.sql
│  ├─ 15_database_explore.sql
│  ├─ 16_dimenesion_explore.sql
│  ├─ 17_change_over_time.sql
│  ├─ 18_cumulative_analyasis.sql
│  ├─ 19_performance_analysis.sql
│  ├─ 1_create_schemas.sql
│  ├─ 20_percent_contri.sql
│  ├─ 21_data_segmentation.sql
│  ├─ 22.classifyng_customers.sql
│  ├─ 23_full_measure.sql
│  ├─ 2_create_table_metadata.sql
│  ├─ 3_data_insert.sql
│  ├─ 4_metadata_silver.sql
│  ├─ 5_silver_crust_info.sql
│  ├─ 6_silver_prd_info.sql
│  ├─ 7_silver_crm_sales_detail.sql
│  ├─ 8_silver_ero_cust.sql
│  └─ 9_silver_erp_loc.sql
├─ README.md
├─ scripts
│  ├─ bronze
│  │  ├─ ddl_bronze.sql
│  │  └─ proc_load_bronze.sql
│  ├─ gold
│  │  └─ ddl_gold.sql
│  ├─ init_database.sql
│  └─ silver
│     ├─ ddl_silver.sql
│     └─ proc_load_silver.sql
└─ tests
   ├─ quality_checks_gold.sql
   └─ quality_checks_silver.sql

```