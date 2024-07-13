--???
/*USE library

;WITH loans AS
(SELECT member_no,out_date AS Date FROM loan
UNION
SELECT member_no,out_date AS Date FROM loanhist)

SELECT firstname+' '+lastname AS Name,
street+city+state+zip AS Address,'juvenile',
YEAR(l.Date),MONTH(l.Date),
ISNULL(COUNT(l.Date),0)
FROM juvenile AS j INNER JOIN
member AS m ON j.member_no=m.member_no
INNER JOIN adult AS a ON
j.adult_member_no=a.member_no
LEFT OUTER JOIN loans AS l ON j.member_no=l.member_no
GROUP BY firstname,lastname,street,city,
zip,state,YEAR(l.Date),MONTH(l.Date)
UNION
SELECT firstname+' '+lastname AS Name,
street+city+state+zip AS Address,'adult',
YEAR(l.Date),MONTH(l.Date),
ISNULL(COUNT(l.Date),0)
FROM adult AS a INNER JOIN
member AS m ON a.member_no=m.member_no
LEFT OUTER JOIN loans AS l ON a.member_no=l.member_no
GROUP BY firstname,lastname,street,city,
zip,state,YEAR(l.Date),MONTH(l.Date)*/

/*USE Northwind

SELECT OrderID,Freight FROM Orders AS o1
WHERE Freight>(SELECT AVG(Freight) FROM Orders AS o2 
WHERE YEAR(o2.OrderDate)=YEAR(o1.OrderDate))*/

--USE Northwind

--1.wersja
/*SELECT CustomerID FROM Customers
EXCEPT
SELECT DISTINCT c.CustomerID FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID=o.CustomerID
INNER JOIN [Order Details] AS od 
ON o.OrderID=od.OrderID
INNER JOIN Products AS p ON p.ProductID=od.ProductID
INNER JOIN Categories AS cat 
ON cat.CategoryID=p.CategoryID
WHERE CategoryName='Seafood'
GROUP BY c.CustomerID*/

--2.wersja
/*;WITH CustCats AS
(SELECT DISTINCT c.CustomerID FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID=o.CustomerID
INNER JOIN [Order Details] AS od 
ON o.OrderID=od.OrderID
INNER JOIN Products AS p ON p.ProductID=od.ProductID
INNER JOIN Categories AS cat 
ON cat.CategoryID=p.CategoryID
WHERE CategoryName='Seafood'
GROUP BY c.CustomerID)

SELECT CustomerID FROM Customers
WHERE CustomerID NOT IN
(SELECT CustomerID FROM CustCats)*/

--3.wersja
/*SELECT CustomerID FROM Customers
WHERE CustomerID NOT IN
(SELECT c.CustomerID FROM Customers AS c
WHERE CustomerID IN
(SELECT CustomerID FROM Orders AS o
WHERE OrderID IN 
(SELECT OrderID FROM [Order Details] 
WHERE ProductID IN
(SELECT ProductID FROM Products 
WHERE CategoryID IN
(SELECT CategoryID FROM Categories
WHERE CategoryName='Seafood')))))*/

USE Northwind

--1. wersja
/*;WITH Subquery AS 
(SELECT c.CustomerID,CategoryName,COUNT(*) AS ordered
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID=o.CustomerID
INNER JOIN [Order Details] AS od 
ON o.OrderID=od.OrderID
INNER JOIN Products AS p ON p.ProductID=od.ProductID
INNER JOIN Categories AS cat 
ON cat.CategoryID=p.CategoryID
GROUP BY c.CustomerID,CategoryName)

SELECT CustomerID,CategoryName,ordered FROM subquery AS s
WHERE ordered=(SELECT MAX(ordered) FROM Subquery AS s2
WHERE s.CustomerID=s2.CustomerID)*/

--???
--2. wersja
