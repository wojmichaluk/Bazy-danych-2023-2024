/*USE Northwind

SELECT TOP 1 p.ProductID,ProductName
FROM Products AS p INNER JOIN [Order Details] AS od
ON p.ProductID=od.ProductID
INNER JOIN Orders AS o ON od.OrderID=o.OrderID
WHERE YEAR(OrderDate)=1996
GROUP BY p.ProductID,ProductName
HAVING SUM(od.UnitPrice*Quantity*(1-Discount))>0
ORDER BY SUM(od.UnitPrice*Quantity*(1-Discount))*/

/*USE library

(SELECT firstname+lastname AS Name,
street+city+state+zip AS Address,
'juvenile' AS 'juvenile/adult?',
NULL AS 'Number of kids'
FROM juvenile As j INNER JOIN member AS m
ON j.member_no=m.member_no
INNER JOIN adult AS a ON 
j.adult_member_no=a.member_no
WHERE NOT EXISTS
(SELECT * FROM loan AS l
WHERE l.member_no=m.member_no)
AND NOT EXISTS (SELECT * FROM loanhist AS lh
WHERE lh.member_no=m.member_no)
GROUP BY firstname,lastname,street,city,state,zip
UNION
SELECT firstname+lastname AS Name,
street+city+state+zip AS Address,
'adult' AS 'juvenile/adult?',
COUNT(j.member_no) AS 'Number of kids'
FROM adult AS a INNER JOIN member AS m
ON a.member_no=m.member_no
LEFT OUTER JOIN juvenile AS j ON 
a.member_no=j.adult_member_no
WHERE NOT EXISTS
(SELECT * FROM loan AS l
WHERE l.member_no=m.member_no)
AND NOT EXISTS (SELECT * FROM loanhist AS lh
WHERE lh.member_no=m.member_no)
GROUP BY firstname,lastname,street,city,state,zip)*/

/*USE Northwind;

WITH OrderSums AS
(SELECT e.EmployeeID,FirstName,LastName,
ROUND(SUM(Quantity*UnitPrice*(1-Discount))+SUM(Freight),2)
AS Suma FROM Employees AS e INNER JOIN
Orders AS o ON e.EmployeeID=o.EmployeeID
INNER JOIN [Order Details] AS od
ON o.OrderID=od.OrderID
WHERE YEAR(OrderDate)=1997 AND MONTH(OrderDate)=2
GROUP BY e.EmployeeID,FirstName,LastName)

SELECT e.FirstName,e.LastName,ISNULL(os.Suma,0) 
FROM OrderSums AS os RIGHT OUTER JOIN Employees AS e
ON os.EmployeeID=e.EmployeeID
ORDER BY 3 DESC*/
