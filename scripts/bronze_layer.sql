
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
						
