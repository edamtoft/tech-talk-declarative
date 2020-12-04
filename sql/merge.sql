DECLARE @DeclaredEmployees TABLE (FirstName NVARCHAR(50), LastName NVARCHAR(50), DepartmentId INT);

INSERT INTO @DeclaredEmployees
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

MERGE Employee t
USING @DeclaredEmployees s
  ON t.FirstName = s.FirstName
  AND t.LastName = s.LastName
WHEN MATCHED
  THEN UPDATE SET t.DepartmentId = s.DepartmentId
WHEN NOT MATCHED BY TARGET
  THEN INSERT (FirstName, LastName, DepartmentId) VALUES (s.FirstName, s.LastName, s.DepartmentId)
WHEN NOT MATCHED BY SOURCE
  THEN DELETE;