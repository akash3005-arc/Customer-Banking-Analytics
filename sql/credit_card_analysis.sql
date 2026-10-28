/*===========================================================
                CREDIT CARD ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the total outstanding credit card balance?
===========================================================*/

SELECT
    ROUND(SUM(`Credit Card Balance`),2) AS Total_Credit_Card_Balance
FROM banking;


/*===========================================================
Question 2:
What is the average credit card balance of customers?
===========================================================*/

SELECT
    ROUND(AVG(`Credit Card Balance`),2) AS Average_Credit_Card_Balance
FROM banking;


/*===========================================================
Question 3:
Who are the Top 10 customers with the highest credit card balances?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Credit Card Balance`
FROM banking
ORDER BY `Credit Card Balance` DESC
LIMIT 10;


/*===========================================================
Question 4:
Which occupations have the highest average credit card balance?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Credit Card Balance`),2) AS Average_Credit_Card_Balance
FROM banking
GROUP BY Occupation
ORDER BY Average_Credit_Card_Balance DESC;


/*===========================================================
Question 5:
Which nationalities have the highest average credit card balance?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Credit Card Balance`),2) AS Average_Credit_Card_Balance
FROM banking
GROUP BY Nationality
ORDER BY Average_Credit_Card_Balance DESC;


/*===========================================================
Question 6:
Which customers have a credit card balance higher than the average?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Credit Card Balance`
FROM banking
WHERE `Credit Card Balance` >
(
    SELECT AVG(`Credit Card Balance`)
    FROM banking
)
ORDER BY `Credit Card Balance` DESC;


/*===========================================================
Question 7:
What is the total credit card balance held by each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Credit Card Balance`),2) AS Total_Credit_Card_Balance
FROM banking
GROUP BY Occupation
ORDER BY Total_Credit_Card_Balance DESC;


/*===========================================================
Question 8:
Which customers have both high estimated income and high credit card balances?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Estimated Income`,
    `Credit Card Balance`
FROM banking
WHERE
    `Estimated Income` >
    (
        SELECT AVG(`Estimated Income`)
        FROM banking
    )
AND
    `Credit Card Balance` >
    (
        SELECT AVG(`Credit Card Balance`)
        FROM banking
    )
ORDER BY `Credit Card Balance` DESC;


/*===========================================================
Question 9:
What is the average credit card balance based on loyalty classification?
===========================================================*/

SELECT
    `Loyalty Classification`,
    ROUND(AVG(`Credit Card Balance`),2) AS Average_Credit_Card_Balance
FROM banking
GROUP BY `Loyalty Classification`
ORDER BY Average_Credit_Card_Balance DESC;


/*===========================================================
Question 10:
Which occupations contribute the highest percentage of the total
credit card balance?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Credit Card Balance`),2) AS Total_Credit_Card_Balance,
    ROUND(
        SUM(`Credit Card Balance`) * 100 /
        (
            SELECT SUM(`Credit Card Balance`)
            FROM banking
        ),
    2) AS Percentage_Contribution
FROM banking
GROUP BY Occupation
ORDER BY Percentage_Contribution DESC;