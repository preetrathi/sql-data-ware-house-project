-- Please add a header comment at the start of each script

/*
============================================================
Create Database & Schemas
============================================================
Script Purpose:
	Create new Database and Schemas with all architecture layers
	for learning purpose
WARNING:
	Runnig this script will drop the entire 'DataWareHouse' if it exists
	Script is important for developer it self as well as other developers to understand it.
*/


-- Create Database 'DataWareHouse'

USE master;


-- Before creating any database we have to check wheater the database exist or not
IF EXISTS (SELECT 1 FROM SYS.databases WHERE name = 'DataWareHouse')
BEGIN
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE DataWareHouse

END;

-- Creating new Database
CREATE DATABASE DataWareHouse;

USE DataWareHouse;

-- Step 01: Start building Schemas, its like folder or a containers
-- As per data architecture we have 3 layers: Bronze, Silver & Gold
-- Create Schema for each layer.

-- Creating Schemas
CREATE SCHEMA bronze;
GO	-- Its like a seperator in SQL, it tells SQL first execute complete first command then go for 2nd
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO


