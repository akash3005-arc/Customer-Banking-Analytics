/*===========================================================
                    LOAN ANALYSIS
=============================================================*/

/*===========================================================
Question 1:
What is the total amount of bank loans issued?
===========================================================*/

SELECT
    ROUND(SUM(`Bank Loans`),2) AS Total_Bank_Loans
FROM banking;


/*===========================================================
Question 2:
What is the average bank loan amount per customer?
===========================================================*/

SELECT
    ROUND(AVG(`Bank Loans`),2) AS Average_Bank_Loan
FROM banking;


/*===========================================================
Question 3:
Who are the Top 10 customers with the highest bank loans?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Loans`
FROM banking
ORDER BY `Bank Loans` DESC
LIMIT 10;


/*===========================================================
Question 4:
Which occupations have the highest average bank loans?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Bank Loans`),2) AS Average_Loan
FROM banking
GROUP BY Occupation
ORDER BY Average_Loan DESC;


/*===========================================================
Question 5:
Which nationalities have the highest average bank loans?
===========================================================*/

SELECT
    Nationality,
    ROUND(AVG(`Bank Loans`),2) AS Average_Loan
FROM banking
GROUP BY Nationality
ORDER BY Average_Loan DESC;


/*===========================================================
Question 6:
What is the total business lending amount by occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Business Lending`),2) AS Total_Business_Lending
FROM banking
GROUP BY Occupation
ORDER BY Total_Business_Lending DESC;


/*===========================================================
Question 7:
Which customers have bank loans greater than the average bank loan?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Bank Loans`
FROM banking
WHERE `Bank Loans` >
(
    SELECT AVG(`Bank Loans`)
    FROM banking
)
ORDER BY `Bank Loans` DESC;


/*===========================================================
Question 8:
What is the average business lending amount by occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Business Lending`),2) AS Average_Business_Lending
FROM banking
GROUP BY Occupation
ORDER BY Average_Business_Lending DESC;


/*===========================================================
Question 9:
Which customers own the highest number of properties?
===========================================================*/

SELECT
    `Client ID`,
    Name,
    Occupation,
    `Properties Owned`
FROM banking
ORDER BY `Properties Owned` DESC
LIMIT 10;


/*===========================================================
Question 10:
What is the average number of properties owned by customers in each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(AVG(`Properties Owned`),2) AS Average_Properties
FROM banking
GROUP BY Occupation
ORDER BY Average_Properties DESC;


/*===========================================================
Question 11:
Which occupations contribute the highest total bank loans?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Bank Loans`),2) AS Total_Bank_Loans
FROM banking
GROUP BY Occupation
ORDER BY Total_Bank_Loans DESC;


/*===========================================================
Question 12:
What percentage of the total loan portfolio belongs to each occupation?
===========================================================*/

SELECT
    Occupation,
    ROUND(SUM(`Bank Loans`),2) AS Total_Loans,
    ROUND(
        SUM(`Bank Loans`) * 100 /
        (SELECT SUM(`Bank Loans`) FROM banking),
        2
    ) AS Loan_Portfolio_Percentage
FROM banking
GROUP BY Occupation
ORDER BY Loan_Portfolio_Percentage DESC;