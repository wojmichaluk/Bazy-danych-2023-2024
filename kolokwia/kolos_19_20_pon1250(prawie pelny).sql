--???
/*USE Northwind

SELECT YEAR(OrderDate) AS 'Year', 
MONTH(OrderDate) AS 'Month', 
CompanyName,SUM(Freight) 
FROM Suppliers AS s INNER JOIN 
Products AS p ON s.SupplierID=p.SupplierID
INNER JOIN [Order Details] AS od
ON p.ProductID=od.ProductID
INNER JOIN Orders AS o
ON od.OrderID=o.OrderID
GROUP BY YEAR(OrderDate),MONTH(OrderDate),CompanyName*/

/*USE library

;WITH loans AS
(SELECT member_no FROM loan
UNION
SELECT member_no FROM loanhist)

SELECT firstname+' '+lastname AS 'Name',
street+' '+city+' '+zip+' '+state AS Address,'juvenile'
FROM juvenile AS j INNER JOIN member AS m
ON j.member_no=m.member_no
INNER JOIN adult AS a ON
j.adult_member_no=a.member_no
WHERE j.member_no NOT IN
(SELECT member_no FROM loans)
UNION
SELECT firstname+' '+lastname AS 'Name',
street+' '+city+' '+zip+' '+state AS Address,'adult'
FROM adult AS a INNER JOIN member AS m
ON a.member_no=m.member_no
WHERE NOT EXISTS
(SELECT * FROM loans AS l
WHERE a.member_no=l.member_no)*/

-- +/-
/*USE Northwind

;WITH CustCats AS
(SELECT c.CustomerID,CategoryName,
ISNULL(COUNT(*),0) AS 'Chosen' FROM Customers AS c
LEFT OUTER JOIN Orders AS o 
ON c.CustomerID=o.CustomerID
LEFT OUTER JOIN [Order Details] AS od
ON o.OrderID=od.OrderID
LEFT OUTER JOIN Products AS p ON od.ProductID=p.ProductID
LEFT OUTER JOIN Categories AS cat
ON p.CategoryID=cat.CategoryID
WHERE YEAR(OrderDate)=1997
GROUP BY c.CustomerID,CategoryName)

SELECT CustomerID,CategoryName,Chosen
FROM CustCats AS cc
WHERE Chosen=(SELECT MAX(Chosen)
FROM CustCats AS cc2
WHERE cc.CustomerID=cc2.CustomerID)
GROUP BY CustomerID,CategoryName,Chosen
ORDER BY 1*/

/*USE library

;WITH loans AS
(SELECT member_no FROM loan
UNION
SELECT member_no FROM loanhist)

SELECT firstname+' '+lastname AS 'Name',
ISNULL(COUNT(l1.member_no),0)+
ISNULL(COUNT(l2.member_no),0) AS 'Loaned'
FROM adult AS a INNER JOIN member AS m
ON a.member_no=m.member_no
INNER JOIN juvenile AS j ON
j.adult_member_no=a.member_no
LEFT OUTER JOIN loans AS l1
ON l1.member_no=a.member_no
LEFT OUTER JOIN loans AS l2
ON l2.member_no=j.member_no
WHERE state='AZ'
GROUP BY firstname,lastname
HAVING COUNT(j.member_no)>2
UNION
SELECT firstname+' '+lastname AS 'Name',
ISNULL(COUNT(l1.member_no),0)+
ISNULL(COUNT(l2.member_no),0) AS 'Loaned'
FROM adult AS a INNER JOIN member AS m
ON a.member_no=m.member_no
INNER JOIN juvenile AS j ON
j.adult_member_no=a.member_no
LEFT OUTER JOIN loans AS l1
ON l1.member_no=a.member_no
LEFT OUTER JOIN loans AS l2
ON l2.member_no=j.member_no
WHERE state='CA'
GROUP BY firstname,lastname
HAVING COUNT(j.member_no)>3*/