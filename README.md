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
***DROP TABLE***   
***CREATE INDEX***
***DROP INDEX***  
***DROP COLUMN***  
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
FIELD():  
&emsp;&emsp; returns the index position of a value in a list of values  

weekday():   
&emsp;&emsp; - 0 = Monday, 1 = Tuesday, ... 6 = Sunday
dayofweek():  
&emsp;&emsp; - 1 = Sunday, 2 = Monday, ... 7 = Saturday 

binary (in a where clause):  
&emsp;&emsp; - converts a value to a binary string  
&emsp;&emsp; - this binary value is a series of  bytes (byte array)  

if(condition, value if true, value if false)  
&emsp;&emsp; - if statement  

if(condition, value if true, if(condition, value if true, value if false))  
&emsp;&emsp; - nested if statement  

group_concat():  
&emsp; - concatenates data from multiple rows into one field  
&emsp;&emsp; - is essentially a group by  
&emsp;&emsp; - has 3 clauses:  
&emsp;&emsp;&emsp; 1. distinct  
&emsp;&emsp;&emsp;&emsp; select group_concat(distinct column_name)  
&emsp;&emsp;&emsp;&emsp; from table_name;  
&emsp;&emsp;&emsp; 2. order by   
&emsp;&emsp;&emsp; 3. separator: automatically separates the values by operator  
&emsp;&emsp;&emsp;&emsp; select group_concat(distinct column_name order by column_name separator <'string literal'>)  

str_to_date([tring], [format]), date_format([date], [format]):  
&emsp;&emsp; - strr_to_date = returns a date based on a string and format   
&emsp;&emsp; - date_format = formats a date   
&emsp;&emsp; - format to use, can be one or a combination:    
&emsp;&emsp;&emsp; %a	Abbreviated weekday name (Sun to Sat)    
&emsp;&emsp;&emsp; %b	Abbreviated month name (Jan to Dec)    
&emsp;&emsp;&emsp; %c	Numeric month name (0 to 12)    
&emsp;&emsp;&emsp; %D	Day of the month as a numeric value, followed by suffix (1st, 2nd, 3rd, ...)    
&emsp;&emsp;&emsp; %d	Day of the month as a numeric value (01 to 31)   
&emsp;&emsp;&emsp; %e	Day of the month as a numeric value (0 to 31)   
&emsp;&emsp;&emsp; %f	Microseconds (000000 to 999999)   
&emsp;&emsp;&emsp; %H	Hour (00 to 23)   
&emsp;&emsp;&emsp; %h	Hour (00 to 12)    
&emsp;&emsp;&emsp; %I	Hour (00 to 12)                                 
&emsp;&emsp;&emsp; %i	Minutes (00 to 59)                   
&emsp;&emsp;&emsp; %j	Day of the year (001 to 366)     
&emsp;&emsp;&emsp; %k	Hour (0 to 23)    
&emsp;&emsp;&emsp; %l	Hour (1 to 12)  
&emsp;&emsp;&emsp; %M	Month name in full (January to December)    
&emsp;&emsp;&emsp; %m	Month name as a numeric value (01 to 12)  
&emsp;&emsp;&emsp; %p	AM or PM  
&emsp;&emsp;&emsp; %r	Time in 12 hour AM or PM format (hh:mm:ss AM/PM)  
&emsp;&emsp;&emsp; %S	Seconds (00 to 59)  
&emsp;&emsp;&emsp; %s	Seconds (00 to 59)  
&emsp;&emsp;&emsp; %T	Time in 24 hour format (hh:mm:ss)    
&emsp;&emsp;&emsp; %U	Week where Sunday is the first day of the week (00 to 53)  
&emsp;&emsp;&emsp; %u	Week where Monday is the first day of the week (00 to 53)  
&emsp;&emsp;&emsp; %V	Week where Sunday is the first day of the week (01 to 53). Used with %X  
&emsp;&emsp;&emsp; %v	Week where Monday is the first day of the week (01 to 53). Used with %X  
&emsp;&emsp;&emsp; %W	Weekday name in full (Sunday to Saturday)  
&emsp;&emsp;&emsp; %w	Day of the week where Sunday=0 and Saturday=6  
&emsp;&emsp;&emsp; %X	Year for the week where Sunday is the first day of the week. Used with %V  
&emsp;&emsp;&emsp; %x	Year for the week where Monday is the first day of the week. Used with %V  
&emsp;&emsp;&emsp; %Y	Year as a numeric, 4-digit value  
&emsp;&emsp;&emsp; %y	Year as a numeric, 2-digit value  

convert(<value> USING <charset>): converts a value into a specified datatype or character set  
convert(<value>, <type>)  

cast([value] as [datatype]): converts a value into a specified datetype  
&emsp;&emsp; - converts a value to another type  
&emsp;&emsp;- type/datatype:  
&emsp;&emsp;&emsp; DATE		Converts value to DATE. Format: "YYYY-MM-DD"  
&emsp;&emsp;&emsp; DATETIME	Converts value to DATETIME. Format: "YYYY-MM-DD HH:MM:SS"  
&emsp;&emsp;&emsp; DECIMAL	Converts value to DECIMAL.  
&emsp;&emsp;&emsp;Use the optional M and D parameters to specify the maximum number of digits (M) and the number of digits following the decimal point (D).  
&emsp;&emsp;&emsp;TIME	Converts value to TIME. Format: "HH:MM:SS"  
&emsp;&emsp;&emsp;CHAR	Converts value to CHAR (a fixed length string)  
&emsp;&emsp;&emsp;NCHAR	Converts value to NCHAR (like CHAR, but produces a string with the national character set)  
&emsp;&emsp;&emsp;SIGNED	Converts value to SIGNED (a signed 64-bit integer)  
&emsp;&emsp;&emsp;UNSIGNED	Converts value to UNSIGNED (an unsigned 64-bit integer)  
&emsp;&emsp;&emsp;BINARY	Converts value to BINARY (a binary string)  
&emsp;&emsp; - charset: chaacter set to convert to  
substring([string], [int1], [int2]):   
&emsp;&emsp; - extracts a substring from a string  
&emsp;&emsp;- starts at position int1, extract int2 characters  
&emsp;&emsp; - 1-indexed  
substring_index([string], [delimiter], [int]):  
&emsp;&emsp; - return a substring of a string before a specified number of delimiter occurs  
&emsp;&emsp; - int: can be positive or negative. number of times to search for the delimiter  
&emsp;&emsp;&emsp; if positive, reads the string from the left  
&emsp;&emsp;&emsp; if negative, reads the string from the right  

**Small example using while loop with declare and a set**  
declare @q int;  
set @q = 1;  

while @q <= 20  
begin  
&emsp; print replicate('* ', @q)  
&emsp; set @q += 1;  
end;  





