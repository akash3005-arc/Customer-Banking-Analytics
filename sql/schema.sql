/*=============================================================================
                  BANKING CUSTOMER ANALYTICS - DDL SCHEMA
=============================================================================*/
-- Database creation (MySQL / PostgreSQL compatible)
-- Database: banking_analytics

CREATE TABLE IF NOT EXISTS banking (
    Client ID                  VARCHAR(32) PRIMARY KEY,
    Name                       VARCHAR(128) NOT NULL,
    Age                        INT NOT NULL,
    Location ID                INT NOT NULL,
    Joined Bank                VARCHAR(32) NOT NULL,
    Banking Contact            VARCHAR(128) NOT NULL,
    Nationality                VARCHAR(64) NOT NULL,
    Occupation                 VARCHAR(128) NOT NULL,
    Fee Structure              VARCHAR(32) NOT NULL,
    Loyalty Classification     VARCHAR(32) NOT NULL,
    Estimated Income           DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Superannuation Savings     DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Amount of Credit Cards     INT NOT NULL DEFAULT 0,
    Credit Card Balance        DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Bank Loans                 DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Bank Deposits              DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Checking Accounts          DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Saving Accounts            DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Foreign Currency Account   DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Business Lending           DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    Properties Owned           INT NOT NULL DEFAULT 0,
    Risk Weighting             INT NOT NULL DEFAULT 1,
    BRId                       INT NOT NULL,
    GenderId                   INT NOT NULL,
    IAId                       INT NOT NULL
);

-- Recommended Performance Indexes for Analytical Queries
CREATE INDEX idx_banking_occupation ON banking (Occupation);
CREATE INDEX idx_banking_nationality ON banking (Nationality);
CREATE INDEX idx_banking_loyalty ON banking (Loyalty Classification);
CREATE INDEX idx_banking_risk ON banking (Risk Weighting);
CREATE INDEX idx_banking_income ON banking (Estimated Income);
CREATE INDEX idx_banking_deposits ON banking (Bank Deposits);
