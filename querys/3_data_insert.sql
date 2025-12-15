--store procedure
create or alter procedure bronze.load_bronze as
begin

begin try
	declare @start_time datetime,@end_time datetime,@batch_start_time datetime,@batch_end_time datetime;
	--empty then insert
set @batch_start_time=GETDATE();

	set @start_time=GETDATE();
	truncate table bronze.crm_crust_info

	--insert
	bulk insert bronze.crm_crust_info
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

	set @start_time=GETDATE();
	truncate table bronze.crm_prd_info
	bulk insert bronze.crm_prd_info
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

	set @start_time=GETDATE();
	truncate table bronze.crm_sales_details
	bulk insert bronze.crm_sales_details
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

	set @start_time=GETDATE();
	truncate table bronze.erp_cust_az12
	bulk insert bronze.erp_cust_az12
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

	set @start_time=GETDATE();
	truncate table bronze.erp_loc_a101
	bulk insert bronze.erp_loc_a101
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

	set @start_time=GETDATE();
	truncate table bronze.erp_px_cat_g1v2
	bulk insert bronze.erp_px_cat_g1v2
	from'D:\data warehouse(SQL)\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
		firstrow=2,
		fieldterminator=',',
		tablock
	);
	SET @end_time = GETDATE();
	print'>> load durtaion:'+ cast(datediff(second,@start_time,@end_time) as varchar)+ 'sec';

set @batch_end_time=GETDATE();
print '>>load duration:'+cast(datediff(second,@batch_start_time,@batch_end_time) as varchar)+'seconds';

end try
begin catch
	print '==================='
	print 'error occured dyring load bronze layer'
	print 'error message'+cast(error_message() as varchar);
	print 'error message' + cast(error_state() as varchar); 
end catch
end
--to run stored procedure
--we just have to right exec bronze.load_bronze