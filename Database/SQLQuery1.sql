USE master;
GO

CREATE DATABASE AranCommunitySupportDB;
GO

USE AranCommunitySupportDB;
GO

-- 1. Users
CREATE TABLE Users
(
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Role NVARCHAR(20) NOT NULL DEFAULT 'User',
    Password NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- 2. Emergency Requests
CREATE TABLE EmergencyRequests
(
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20) NOT NULL,
    Location NVARCHAR(150) NOT NULL,
    EmergencyType NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    RequestDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(30) NOT NULL DEFAULT 'Pending',
    Email NVARCHAR(150) NULL
);
GO

-- 3. Support Transactions
CREATE TABLE SupportTransactions
(
    SupportID INT IDENTITY(1,1) PRIMARY KEY,
    RequestID INT NULL,
    SupporterEmail NVARCHAR(150) NOT NULL,
    SupportAmount DECIMAL(10,2) NOT NULL,
    SupportDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- 4. Contact Messages
CREATE TABLE ContactMessages
(
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Subject NVARCHAR(200) NOT NULL,
    Message NVARCHAR(MAX) NOT NULL,
    MessageDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO