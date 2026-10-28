/*===========================================================
                    INCOME ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the average estimated income of all customers?
===========================================================*/

SELECT
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking;


/*===========================================================
Question 2:
What are the minimum and maximum estimated incomes?
===========================================================*/

SELECT
    MIN(`Estimated Income`) AS Minimum_Income,
    MAX(`Estimated Income`) AS Maximum_Income
FROM banking;


/*===========================================================
Question 3:
Who are the Top 10 highest income customers?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    Nationality,
    `Estimated Income`
FROM banking
ORDER BY `Estimated Income` DESC
LIMIT 10;


/*===========================================================
Question 4:
Who are the Top 10 lowest income customers?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    Nationality,
    `Estimated Income`
FROM banking
ORDER BY `Estimated Income`
LIMIT 10;


/*===========================================================
Question 5:
What is the average estimated income for each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY Occupation
ORDER BY Average_Income DESC;


/*===========================================================
Question 6:
Which occupations have the highest total estimated income?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Estimated Income`),2) AS Total_Income
FROM banking
GROUP BY Occupation
ORDER BY Total_Income DESC;


/*===========================================================
Question 7:
What is the average estimated income by nationality?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY Nationality
ORDER BY Average_Income DESC;


/*===========================================================
Question 8:
How many customers fall into different income brackets?
===========================================================*/

SELECT
    CASE
        WHEN `Estimated Income` < 30000 THEN 'Below 30K'
        WHEN `Estimated Income` BETWEEN 30000 AND 60000 THEN '30K - 60K'
        WHEN `Estimated Income` BETWEEN 60001 AND 100000 THEN '60K - 100K'
        ELSE 'Above 100K'
    END AS Income_Bracket,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY Income_Bracket
ORDER BY Total_Customers DESC;


/*===========================================================
Question 9:
What is the average estimated income based on loyalty classification?
===========================================================*/

SELECT
    `Loyalty Classification`,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY `Loyalty Classification`
ORDER BY Average_Income DESC;


/*===========================================================
Question 10:
What is the average estimated income for each fee structure?
===========================================================*/

SELECT
    `Fee Structure`,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY `Fee Structure`
ORDER BY Average_Income DESC;


/*===========================================================
Question 11:
Which customers have an estimated income higher than the overall average income?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Estimated Income`
FROM banking
WHERE `Estimated Income` >
(
    SELECT AVG(`Estimated Income`)
    FROM banking
)
ORDER BY `Estimated Income` DESC;


/*===========================================================
Question 12:
Which occupations have an average income greater than the overall average income?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Estimated Income`),2) AS Average_Income
FROM banking
GROUP BY Occupation
HAVING AVG(`Estimated Income`) >
(
    SELECT AVG(`Estimated Income`)
    FROM banking
)
ORDER BY Average_Income DESC;