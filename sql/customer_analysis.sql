/*===========================================================
                    CUSTOMER ANALYSIS
=============================================================*/

ALTER TABLE banking
CHANGE COLUMN `Client ID` `Client ID` TEXT;

/*===========================================================
Question 1:
How many customers are present in the banking dataset?
===========================================================*/

SELECT COUNT(*) AS Total_Customers
FROM banking;


/*===========================================================
Question 2:
What is the average age of customers?
===========================================================*/

SELECT
    ROUND(AVG(Age), 2) AS Average_Age
FROM banking;


/*===========================================================
Question 3:
What are the youngest and oldest customer ages?
===========================================================*/

SELECT
    MIN(Age) AS Youngest_Customer,
    MAX(Age) AS Oldest_Customer
FROM banking;


/*===========================================================
Question 4:
How many customers belong to each nationality?
===========================================================*/

SELECT
    Nationality,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY Nationality
ORDER BY Total_Customers DESC;


/*===========================================================
Question 5:
How many customers belong to each occupation?
===========================================================*/

SELECT
    Occupation,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY Occupation
ORDER BY Total_Customers DESC;


/*===========================================================
Question 6:
How many customers fall under each loyalty classification?
===========================================================*/

SELECT
    `Loyalty Classification`,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY `Loyalty Classification`
ORDER BY Total_Customers DESC;


/*===========================================================
Question 7:
How many customers are there under each fee structure?
===========================================================*/

SELECT
    `Fee Structure`,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY `Fee Structure`
ORDER BY Total_Customers DESC;


/*===========================================================
Question 8:
What is the average age of customers for each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(Age),2) AS Average_Age
FROM banking
GROUP BY Occupation
ORDER BY Average_Age DESC;


/*===========================================================
Question 9:
Who are the Top 10 oldest customers?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Age,
    Occupation,
    Nationality
FROM banking
ORDER BY Age DESC
LIMIT 10;


/*===========================================================
Question 10:
Who are the Top 10 youngest customers?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Age,
    Occupation,
    Nationality
FROM banking
ORDER BY Age ASC
LIMIT 10;


/*===========================================================
Question 11:
How many customers joined the bank in each year?
===========================================================*/

SELECT
    YEAR(STR_TO_DATE(`Joined Bank`, '%d-%m-%Y')) AS Joined_Year,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY Joined_Year
ORDER BY Joined_Year;


/*===========================================================
Question 12:
What is the average estimated income by nationality?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY Nationality
ORDER BY Average_Income DESC;