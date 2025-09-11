CREATE DATABASE DW_Chinook;
GO
USE DW_Chinook;

-- Dimensión Cliente
CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY PRIMARY KEY,
    CustomerId INT,
    FullName NVARCHAR(100),
    Country NVARCHAR(50),
    City NVARCHAR(50)
);

-- Dimensión Productoy
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY PRIMARY KEY,
    TrackId INT,
    TrackName NVARCHAR(200),
    Album NVARCHAR(160),
    Artist NVARCHAR(120),
    Genre NVARCHAR(120),
    MediaType NVARCHAR(120)
);

-- Dimensión Fecha
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATETIME,
    Year INT,
    Month INT,
    Day INT
);

-- Hechos de ventas
CREATE TABLE FactSales (
    SalesKey INT IDENTITY PRIMARY KEY,
    CustomerKey INT,
    ProductKey INT,
    DateKey INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Quantity * UnitPrice) PERSISTED,
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (ProductKey) REFERENCES DimProduct(ProductKey),
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey)
);
