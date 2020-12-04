SELECT Employee.*, DepartmentName
FROM Employee
JOIN Department ON Employee.DepartmentId = Department.DepartmentId
WHERE FirstName = N'Eric'