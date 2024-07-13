/*USE library

SELECT firstname+lastname AS 'Name',
street+city+zip+state AS 'Address' FROM juvenile AS j
INNER JOIN member AS m ON j.member_no=m.member_no
INNER JOIN adult AS a ON j.adult_member_no=a.member_no
INNER JOIN loanhist AS lh ON m.member_no=lh.member_no
INNER JOIN title AS t ON lh.title_no=t.title_no
WHERE in_date='3/6/98' AND title='Last of the Mohicans'*/

/*USE Northwind

SELECT FirstName+' '+LastName AS 'Name',ISNULL(COUNT(o.OrderID),0) AS 'Liczba zamówień',
ISNULL(ROUND(SUM(UnitPrice*Quantity*(1-Discount))+SUM(Freight),2),0) AS 'Wartość zamówień'
FROM Employees AS e RIGHT OUTER JOIN Orders AS o ON e.EmployeeID=o.EmployeeID
LEFT OUTER JOIN [Order Details] AS od ON o.OrderID=od.OrderID
WHERE YEAR(OrderDate)=1997 AND MONTH(OrderDate)=2
GROUP BY FirstName,LastName ORDER BY 3 DESC*/

/*USE Northwind

;WITH CategoriesIncome AS
(SELECT CategoryName AS 'Name',MONTH(OrderDate) AS 'Month',
ROUND(SUM(od.UnitPrice*Quantity*(1-Discount)),2) AS 'Przychód'
FROM Categories AS c INNER JOIN Products AS p ON c.CategoryID=p.CategoryID
INNER JOIN [Order Details] AS od ON p.ProductID=od.ProductID
INNER JOIN Orders AS o ON od.OrderID=o.OrderID 
WHERE YEAR(OrderDate)=1997
GROUP BY CategoryName,MONTH(OrderDate))

SELECT ci.Name,ci.Month,ci.Przychód FROM CategoriesIncome AS ci
GROUP BY ci.Name
HAVING SUM(ci.Przychód)=(SELECT MAX(SUM(Przychód)) FROM CategoriesIncome
GROUP BY Name)*/ 
