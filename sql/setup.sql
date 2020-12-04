CREATE TABLE Department (
  DepartmentId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
  DepartmentName NVARCHAR(50) NOT NULL,
)

CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Department (DepartmentId)
)

INSERT INTO Department (DepartmentName) 
OUTPUT INSERTED.*
VALUES (N'Dev')

INSERT INTO Employee (FirstName, LastName, DepartmentId)
OUTPUT INSERTED.*
VALUES
  (N'Eric', N'Damtoft', 1),
  (N'Eric', N'Henning', 1),
  (N'Eric', N'Giddings', 1),
  (N'Eric', N'Foertsch', 1),
  (N'Tim', N'Eisenhardt', 1),
  (N'Tim', N'Kaetzel', 1),
  (N'Jon', N'Eccker', 1),
  (N'Jon', N'Henshaw', 1),
  (N'Jacob', N'Lafond', 1),
  (N'Jacob', N'Satre', 1)
