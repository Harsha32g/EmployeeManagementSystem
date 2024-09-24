-- Step 1: Create a New Database
CREATE DATABASE EmployeeDB;
GO

-- Step 2: Switch to the new database
USE EmployeeDB;
GO

-- Step 3: Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(50),
    Location NVARCHAR(50)
);
GO

-- Step 4: Insert data into the Departments table
INSERT INTO Departments (DepartmentName, Location)
VALUES 
('IT', 'New York'),
('Finance', 'Chicago'),
('Operations', 'San Francisco'),
('HR', 'Los Angeles');
GO

-- Step 5: Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Step 6: Insert data into the Employees table
INSERT INTO Employees (FirstName, LastName, Position, DepartmentID, Salary, HireDate)
VALUES 
('John', 'Doe', 'Software Engineer', 1, 75000, '2022-04-01'),
('Jane', 'Smith', 'Data Analyst', 2, 65000, '2021-10-15'),
('Michael', 'Johnson', 'Project Manager', 3, 85000, '2020-08-23'),
('Emily', 'Clark', 'QA Engineer', 1, 62000, '2022-11-30');
GO

-- Step 7: INNER JOIN - Get employees with department names
SELECT 
    e.FirstName,
    e.LastName,
    e.Position,
    d.DepartmentName
FROM 
    Employees e
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
GO

-- Step 8: LEFT JOIN - Get all employees with department names, including employees without departments
SELECT 
    e.FirstName,
    e.LastName,
    e.Position,
    d.DepartmentName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
GO

-- Step 9: RIGHT JOIN - Get all departments with their employees, including departments without employees
SELECT 
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM 
    Employees e
RIGHT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
GO

-- Step 10: FULL OUTER JOIN - Get all employees and all departments, matching where possible
SELECT 
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM 
    Employees e
FULL OUTER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
GO
