# Databases  
A database is an organized collection of data where the data is stored and organized to serve some specific purpose.   
**Database Management System(DBMS):** collection of application programs which allow the user to restore and retrieve information about data as efficiently as possible.  
&emsp;&emsp; - MySQL, Oracle, Sybase  
**Relational Database Management System(RDBMS):** is a relational model of data that is stored in databases in separate tables with a common column.  
&emsp;&emsp; - SQL  

**3 types of relationships:**  
&emsp;&emsp; **One-to-one:** One table has a relationship with another table having the similar kind of column.  
&emsp;&emsp;&emsp; Each primary key relates to only one or no record in the related table.  
&emsp;&emsp; **One-to-many:** One table has a relationship with another table that has primary and foreign key relations.  
&emsp;&emsp;&emsp; The primary key table contains only one record that relates to none, one or many records in the related table.  
&emsp;&emsp; **Many-to-many:** Each record in both the tables can relate to many numbers of records in another table.  

**Normalization:** process of removing redundant data by splitting the table in a well-defined maner. Saves storage space.  
**De-Normalization:** process of adding up redundant data to speed up complex queries in order to acheive better performance.  

# SQL  
**What is SQL?**  
Structured Query language, SQL is an ANSI(American National Standard Institute)  
standard programming language that is designed specifically for storing and managing the data  
in the relational database management system (RDBMS) using all kinds of data operations.  

Tables are 0-indexed  
-----------------------------***SQL Commands***---------------------------------  
***Data Definition Language (DDL):*** used to define the structure that holds the data  
&emsp;&emsp; - CREATE, ALTER, TRUNCATE, DROP, RENAME  
***Data Manipulation Language (DML):***  used to modify the data of the database  
&emsp;&emsp; - INSERT, UPDATE, DELETE, MERGE  
***Data Query Language (DQL):***  used to retrieve data from a table  
&emsp;&emsp; - SELECT  
***Data Control Language (DCL):***  used to control the visability of the data in the database like revoke access permission  
&emsp;&emsp; - COMMMIT, ROLLBACK, SAVEPOINT  

***SELECT*** - extracts data from a database  
***UPDATE*** - updates data in a database  
&emsp;&emsp; UPDATE table_name  
&emsp;&emsp; SET column1 = value1, column2 = value2, ...  
&emsp;&emsp; WHERE condition;	  
***DELETE*** - deletes data from a database  
&emsp;&emsp; DELETE FROM table_name WHERE condition;	  
***INSERT INTO*** - inserts new data into a database  
&emsp;&emsp; INSERT INTO table_name (column1, column2, column3, ...)  
&emsp;&emsp; VALUES (value1, value2, value3, ...);  
***CREATE DATABASE*** - creates a new database  
***ALTER DATABASE*** - modifies a database  
***CREATE TABLE*** - creates a new table  
***ALTER TABLE*** - add, delete, or modify columns of existing table  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; can also be used to add and drop various constraints  
***DROP TABLE*** - deletes a table  
***CREATE INDEX*** - creates an index (search key)  
***DROP INDEX*** - deletes an index  
***DROP COLUMN*** - delete a column  
&emsp;&emsp; ALTER TABLE table_name  
&emsp;&emsp; DROP COLUMN column_name;  
***IN, NOT IN*** - specify multiple values in a where clause  
&emsp;&emsp; select *  
&emsp;&emsp; from table_name  
&emsp;&emsp; where column_name IN (values...)  

The ***SELECT TOP*** clause is used to specify the number of records to return.  
The ***SELECT TOP*** clause is useful on large tables with thousands of records.  
Returning a large number of records can impact performance.  
&emsp;&emsp; SELECT TOP number | percent column_name(s)  
&emsp;&emsp; FROM table_name  
&emsp;&emsp; WHERE condition;  

substring(string, value1, value2)  
&emsp; value1 = starting position  
&emsp; value2 = number of characters  

***REFERENCES*** keyword: used to define which table and column is used in a foreign key relationship  

***ON DELETE ...***  
&emsp; ***cascade:***  
&emsp;&emsp; - when creating a foreign key, it deletes the referencing rows in the child table  
&emsp;&emsp; - when the referenced row is deleted in the parent table that has a primary key  
&emsp;&emsp; - if a row is deleted, rows in constrained tables that reference that row will also be deleted  
&emsp; ***set null:*** sets the column value to NULL when a parent row goes away  
&emsp; ***restrict:*** (equivalent to NO ACTION)   
&emsp;&emsp; - causes the attempted DELETE of a parent row to fail  
&emsp;&emsp; - can not delete a parent row if a child row exists that references the value for that parent row  

***ON UPDATE ...***  
&emsp; ***cascade:*** when creating a foreign key, it updates the referencing rows in the child table  
&emsp;&emsp; &emsp; when the referenced row is updated in the parent table that has a primary key  
		
***Create view / create or replace view / drop view***  
&emsp;&emsp; - a view is a virtual table based on the result-set of an SQL statement  
&emsp;&emsp; - contains rows and columns like a real table  
&emsp;&emsp; Create view [table_name/view-name] as select ...  
&emsp;&emsp; create or replace view [table_name/view-name] as select ...  
&emsp;&emsp; drop view [view-name];  

***User-Defined Functions:***  
CREATE FUNCTION response(name varchar(40)) RETURNS varchar(200) DETERMINISTIC  
BEGIN  
	...  
	RETURN ...;  
END;   

Examples:  
CREATE FUNCTION east_or_west (@long DECIMAL(9,6)) RETURNS CHAR(4) AS   
BEGIN  
&emsp; DECLARE @return_value CHAR(4);  
&emsp;&emsp; SET @return_value = 'same';  
&emsp;&emsp; IF (@long > 0.00) SET @return_value = 'east';  
&emsp;&emsp; IF (@long < 0.00) SET @return_value = 'west';  
&emsp;&emsp; RETURN @return_value;
END;  

Returning a table:  
&emsp; CREATE FUNCTION east_from_long (@long DECIMAL(9,6)) RETURNS TABLE AS  
&emsp; RETURN  
&emsp;&emsp;&emsp; SELECT *  
&emsp;&emsp;&emsp; FROM city  
&emsp;&emsp;&emsp; WHERE city.long > @long;  
 
# MySQL   
















