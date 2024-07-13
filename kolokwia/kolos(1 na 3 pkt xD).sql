--Zadanie 1
USE Northwind

SELECT CompanyName FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID=o.CustomerID
INNER JOIN Employees AS e ON o.EmployeeID=e.EmployeeID
GROUP BY CompanyName
HAVING COUNT(e.EmployeeID)=1

--Zadanie 2
USE library

SELECT title FROM title AS t
INNER JOIN loanhist AS lh
ON t.title_no=lh.title_no
WHERE COUNT(*)>(SELECT AVG(COUNT(*)) FROM loanhist AS lh2
WHERE)

--Zadanie 3
USE Northwind

;WITH EmployeesSuppliers AS
(SELECT FirstName,LastName,CompanyName,COUNT(p.ProductID) AS 'Count'
FROM Employees AS e INNER JOIN Orders AS o
ON e.EmployeeID=o.EmployeeID
INNER JOIN [Order Details] AS od
ON o.OrderID=od.OrderID
INNER JOIN Products AS p
ON od.ProductID=p.ProductID
INNER JOIN Suppliers AS s
ON p.SupplierID=s.SupplierID
WHERE NOT EXISTS (SELECT * FROM Employees AS emp
WHERE e.EmployeeID=emp.ReportsTo)
GROUP BY FirstName,LastName,CompanyName)

SELECT FirstName,LastName,CompanyName,COUNT(p.ProductID)
FROM Employees AS e INNER JOIN Orders AS o
ON e.EmployeeID=o.EmployeeID
INNER JOIN [Order Details] AS od
ON o.OrderID=od.OrderID
INNER JOIN Products AS p
ON od.ProductID=p.ProductID
INNER JOIN Suppliers AS s
ON p.SupplierID=s.SupplierID
WHERE NOT EXISTS (SELECT * FROM Employees AS emp
WHERE e.EmployeeID=emp.ReportsTo)
GROUP BY FirstName,LastName,CompanyName
HAVING COUNT(p.ProductID)=(SELECT MAX(Count) FROM EmployeesSuppliers AS es
WHERE FirstName=es.FirstName AND LastName=es.LastName)