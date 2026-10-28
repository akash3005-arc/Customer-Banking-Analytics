/*===========================================================
                    RISK ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the average risk weighting of all customers?
===========================================================*/

SELECT
    ROUND(AVG(`Risk Weighting`),2) AS Average_Risk_Weighting
FROM banking;


/*===========================================================
Question 2:
Who are the Top 10 highest-risk customers?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Risk Weighting`
FROM banking
ORDER BY `Risk Weighting` DESC
LIMIT 10;


/*===========================================================
Question 3:
Which occupations have the highest average risk weighting?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Risk Weighting`),2) AS Average_Risk
FROM banking
GROUP BY Occupation
ORDER BY Average_Risk DESC;


/*===========================================================
Question 4:
Which nationalities have the highest average risk weighting?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Risk Weighting`),2) AS Average_Risk
FROM banking
GROUP BY Nationality
ORDER BY Average_Risk DESC;


/*===========================================================
Question 5:
How many customers fall into each risk category?
===========================================================*/

SELECT
    CASE
        WHEN `Risk Weighting` < 200 THEN 'Low Risk'
        WHEN `Risk Weighting` BETWEEN 200 AND 500 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS Risk_Category,
    COUNT(*) AS Total_Customers
FROM banking
GROUP BY Risk_Category
ORDER BY Total_Customers DESC;


/*===========================================================
Question 6:
Which customers have both high loans and high risk weighting?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Loans`,
    `Risk Weighting`
FROM banking
WHERE
    `Bank Loans` >
    (
        SELECT AVG(`Bank Loans`)
        FROM banking
    )
AND
    `Risk Weighting` >
    (
        SELECT AVG(`Risk Weighting`)
        FROM banking
    )
ORDER BY `Risk Weighting` DESC;


/*===========================================================
Question 7:
What is the average risk weighting based on loyalty classification?
===========================================================*/

SELECT
    `Loyalty Classification`,
    ROUND(AVG(`Risk Weighting`),2) AS Average_Risk
FROM banking
GROUP BY `Loyalty Classification`
ORDER BY Average_Risk DESC;


/*===========================================================
Question 8:
Which occupations have the highest average business lending risk?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Business Lending`),2) AS Average_Business_Lending,
    ROUND(AVG(`Risk Weighting`),2) AS Average_Risk
FROM banking
GROUP BY Occupation
ORDER BY Average_Risk DESC;


/*===========================================================
Question 9:
Which customers own more than one property and have above-average
risk weighting?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    `Properties Owned`,
    `Risk Weighting`
FROM banking
WHERE
    `Properties Owned` > 1
AND
    `Risk Weighting` >
    (
        SELECT AVG(`Risk Weighting`)
        FROM banking
    )
ORDER BY `Risk Weighting` DESC;


/*===========================================================
Question 10:
Which occupations contribute the highest share of the bank's
overall risk exposure?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Risk Weighting`),2) AS Total_Risk,
    ROUND(
        SUM(`Risk Weighting`) * 100 /
        (
            SELECT SUM(`Risk Weighting`)
            FROM banking
        ),
    2) AS Risk_Contribution_Percentage
FROM banking
GROUP BY Occupation
ORDER BY Risk_Contribution_Percentage DESC;