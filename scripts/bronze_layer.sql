
-- Building Bronze Layer

/*
Step 01: Analyzing (Interview source system expert)
	Before building bronze layer, we have to understand the source system. its better to get understanding of source system from source system expert
	and ask them many many questions in order to understand the nature of source system.

	some questions
		Q1: Who owns the data?
		Q2: What business process it support? e.g: Customer TRANSACTIONS, supply chain or logistics
		Q3: System & Data documentation?
		Q4: Data model & data catalog? e.g desc of columns and tables will help alot in datawarehouse, and join tables togather.
		Q5: Architecture & Technology Stack?
			* How is data stored? e.g: SQL server, Oracle, AWS, Azure etc.
			* What are the integration capibilities? e.g: API, Kafka, File Extract, DB etc.
		Q6: Extract and Load?
			* Increamental vs Full Loads?
			* Data Scope & Historical needs
			* What is the expected size of the extraction?
			* Are there any data volume limitations? e.g some old system which stuggle in performance
			* How to avoid impacting the source system's performance?
			* Authentication & Authorization?
	
Step 02: Coding (Data Ingestion)
	Find a way how to load data from source to datawarehouse. 
	

Step 03: Data Validation (Data Completeness & Schema Checks)
	Its very important in the bronze layer to check the data completeness, so we have to compare the number od records between source system and the bronze
	layer just to make sure we are not losing any data in between.
	Other check is Schema check, that make sure that the data is placed on the right position.

Step 04: Docs and Version (Data documenting & versioning in git.)
*/


-- Create DDL script for the Bronze layer
/*
	For creating tables of bronze layer, we have to understand the metadata the structure the schema of the incoming data.

	Data Profiling:
		Explore the data to identify column names & data types.

*/

USE DataWareHouse;

IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL  -- U stand for user defined
	DROP TABLE bronze.crm_cust_info 

CREATE TABLE bronze.crm_cust_info (
-- columns names should be excatly same as source system
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_martial_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);


IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info 

CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);


IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details 

CREATE TABLE bronze.crm_sales_details (
	sls_order_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id NVARCHAR(50),
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
)


IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101 

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12 

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);


IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);

