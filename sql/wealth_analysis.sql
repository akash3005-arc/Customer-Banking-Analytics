/*===========================================================
                    WEALTH ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the total wealth managed by the bank?
(Deposits + Savings + Checking + Foreign Currency Accounts)
===========================================================*/

SELECT
    ROUND(
        SUM(
            `Bank Deposits`
            + `Checking Accounts`
            + `Saving Accounts`
            + `Foreign Currency Account`
        ),
    2) AS Total_Managed_Wealth
FROM banking;


/*===========================================================
Question 2:
Who are the Top 10 wealthiest customers based on total assets?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    (
        `Bank Deposits`
        + `Checking Accounts`
        + `Saving Accounts`
        + `Foreign Currency Account`
    ) AS Total_Assets
FROM banking
ORDER BY Total_Assets DESC
LIMIT 10;


/*===========================================================
Question 3:
Which occupations have the highest average total assets?
===========================================================*/

SELECT
    Occupation,
    ROUND(
        AVG(
            `Bank Deposits`
            + `Checking Accounts`
            + `Saving Accounts`
            + `Foreign Currency Account`
        ),
    2) AS Average_Total_Assets
FROM banking
GROUP BY Occupation
ORDER BY Average_Total_Assets DESC;


/*===========================================================
Question 4:
Which nationalities have the highest average total assets?
===========================================================*/

SELECT
    Nationality,
    ROUND(
        AVG(
            `Bank Deposits`
            + `Checking Accounts`
            + `Saving Accounts`
            + `Foreign Currency Account`
        ),
    2) AS Average_Total_Assets
FROM banking
GROUP BY Nationality
ORDER BY Average_Total_Assets DESC;


/*===========================================================
Question 5:
Which customers own the highest foreign currency balances?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Foreign Currency Account`
FROM banking
ORDER BY `Foreign Currency Account` DESC
LIMIT 10;


/*===========================================================
Question 6:
What is the average foreign currency balance by occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Foreign Currency Account`),2) AS Average_Foreign_Currency
FROM banking
GROUP BY Occupation
ORDER BY Average_Foreign_Currency DESC;


/*===========================================================
Question 7:
Which customers have total assets greater than the overall average?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    (
        `Bank Deposits`
        + `Checking Accounts`
        + `Saving Accounts`
        + `Foreign Currency Account`
    ) AS Total_Assets
FROM banking
WHERE
(
    `Bank Deposits`
    + `Checking Accounts`
    + `Saving Accounts`
    + `Foreign Currency Account`
)
>
(
    SELECT AVG(
        `Bank Deposits`
        + `Checking Accounts`
        + `Saving Accounts`
        + `Foreign Currency Account`
    )
    FROM banking
)
ORDER BY Total_Assets DESC;


/*===========================================================
Question 8:
What is the average superannuation savings by occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Superannuation Savings`),2) AS Average_Superannuation
FROM banking
GROUP BY Occupation
ORDER BY Average_Superannuation DESC;


/*===========================================================
Question 9:
Which customers have the highest superannuation savings?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Superannuation Savings`
FROM banking
ORDER BY `Superannuation Savings` DESC
LIMIT 10;


/*===========================================================
Question 10:
Which occupations contribute the highest share of the bank's
total managed wealth?
===========================================================*/

SELECT
    Occupation,
    ROUND(
        SUM(
            `Bank Deposits`
            + `Checking Accounts`
            + `Saving Accounts`
            + `Foreign Currency Account`
        ),
    2) AS Total_Assets,
    ROUND(
        SUM(
            `Bank Deposits`
            + `Checking Accounts`
            + `Saving Accounts`
            + `Foreign Currency Account`
        ) * 100
        /
        (
            SELECT
                SUM(
                    `Bank Deposits`
                    + `Checking Accounts`
                    + `Saving Accounts`
                    + `Foreign Currency Account`
                )
            FROM banking
        ),
    2) AS Percentage_Contribution
FROM banking
GROUP BY Occupation
ORDER BY Percentage_Contribution DESC;