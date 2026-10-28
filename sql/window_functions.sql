/*===========================================================
                    WINDOW FUNCTIONS
=============================================================*/

/*===========================================================
Question 1:
Rank customers based on Estimated Income.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Estimated Income`,
    RANK() OVER(ORDER BY `Estimated Income` DESC) AS Income_Rank
FROM banking;


/*===========================================================
Question 2:
Assign a unique row number based on Bank Deposits.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Bank Deposits`,
    ROW_NUMBER() OVER(ORDER BY `Bank Deposits` DESC) AS Deposit_Row_Number
FROM banking;


/*===========================================================
Question 3:
Rank customers within each occupation based on Bank Deposits.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Deposits`,
    RANK() OVER(
        PARTITION BY Occupation
        ORDER BY `Bank Deposits` DESC
    ) AS Occupation_Deposit_Rank
FROM banking;


/*===========================================================
Question 4:
Assign a dense rank based on Credit Card Balance.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Credit Card Balance`,
    DENSE_RANK() OVER(
        ORDER BY `Credit Card Balance` DESC
    ) AS Credit_Card_Rank
FROM banking;


/*===========================================================
Question 5:
Calculate the cumulative Bank Deposits.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Bank Deposits`,
    SUM(`Bank Deposits`) OVER(
        ORDER BY `Bank Deposits`
    ) AS Running_Total_Deposits
FROM banking;


/*===========================================================
Question 6:
Compare each customer's income with the previous customer's income.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Estimated Income`,
    LAG(`Estimated Income`,1)
    OVER(ORDER BY `Estimated Income`) AS Previous_Income
FROM banking;


/*===========================================================
Question 7:
Compare each customer's income with the next customer's income.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Estimated Income`,
    LEAD(`Estimated Income`,1)
    OVER(ORDER BY `Estimated Income`) AS Next_Income
FROM banking;


/*===========================================================
Question 8:
Divide customers into four income quartiles.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Estimated Income`,
    NTILE(4) OVER(
        ORDER BY `Estimated Income`
    ) AS Income_Quartile
FROM banking;


/*===========================================================
Question 9:
Display the highest deposit customer from each occupation.
===========================================================*/

SELECT *
FROM
(
    SELECT
        `Client ID`,
        Name,
        Occupation,
        `Bank Deposits`,
        ROW_NUMBER() OVER(
            PARTITION BY Occupation
            ORDER BY `Bank Deposits` DESC
        ) AS rn
    FROM banking
) t
WHERE rn = 1;


/*===========================================================
Question 10:
Show each customer's deposit along with the average deposit
of their occupation.
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Deposits`,
    ROUND(
        AVG(`Bank Deposits`)
        OVER(PARTITION BY Occupation),
        2
    ) AS Occupation_Average_Deposit
FROM banking;