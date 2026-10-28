/*===========================================================
                    DEPOSIT ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the total amount deposited by all customers?
===========================================================*/

SELECT
    ROUND(SUM(`Bank Deposits`),2) AS Total_Bank_Deposits
FROM banking;


/*===========================================================
Question 2:
What is the average bank deposit per customer?
===========================================================*/

SELECT
    ROUND(AVG(`Bank Deposits`),2) AS Average_Bank_Deposit
FROM banking;


/*===========================================================
Question 3:
Who are the Top 10 customers with the highest bank deposits?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Deposits`
FROM banking
ORDER BY `Bank Deposits` DESC
LIMIT 10;


/*===========================================================
Question 4:
Which occupations have the highest average bank deposits?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Bank Deposits`),2) AS Average_Deposit
FROM banking
GROUP BY Occupation
ORDER BY Average_Deposit DESC;


/*===========================================================
Question 5:
Which nationalities have the highest average bank deposits?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Bank Deposits`),2) AS Average_Deposit
FROM banking
GROUP BY Nationality
ORDER BY Average_Deposit DESC;


/*===========================================================
Question 6:
What is the total bank deposit held by each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Bank Deposits`),2) AS Total_Deposits
FROM banking
GROUP BY Occupation
ORDER BY Total_Deposits DESC;


/*===========================================================
Question 7:
Which customers have bank deposits higher than the overall average?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Deposits`
FROM banking
WHERE `Bank Deposits` >
(
    SELECT AVG(`Bank Deposits`)
    FROM banking
)
ORDER BY `Bank Deposits` DESC;


/*===========================================================
Question 8:
What is the average checking account balance?
===========================================================*/

SELECT
    ROUND(AVG(`Checking Accounts`),2) AS Average_Checking_Balance
FROM banking;


/*===========================================================
Question 9:
What is the average saving account balance?
===========================================================*/

SELECT
    ROUND(AVG(`Saving Accounts`),2) AS Average_Saving_Balance
FROM banking;


/*===========================================================
Question 10:
Which customers have the highest checking account balances?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Checking Accounts`
FROM banking
ORDER BY `Checking Accounts` DESC
LIMIT 10;


/*===========================================================
Question 11:
Which customers have the highest saving account balances?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Saving Accounts`
FROM banking
ORDER BY `Saving Accounts` DESC
LIMIT 10;


/*===========================================================
Question 12:
What percentage of total deposits is contributed by each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Bank Deposits`),2) AS Total_Deposits,
    ROUND(
        SUM(`Bank Deposits`) * 100 /
        (SELECT SUM(`Bank Deposits`) FROM banking),
        2
    ) AS Percentage_Contribution
FROM banking
GROUP BY Occupation
ORDER BY Percentage_Contribution DESC;