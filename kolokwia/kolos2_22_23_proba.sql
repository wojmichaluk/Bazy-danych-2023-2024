/*USE Northwind

SELECT ProductName,ROUND(SUM(od.UnitPrice*Quantity*(1-Discount)),2) 
FROM Products AS p 
INNER JOIN [Order Details] AS od 
ON p.ProductID=od.ProductID
INNER JOIN Orders AS o ON od.OrderID=o.OrderID 
WHERE YEAR(OrderDate)=1996
GROUP BY ProductName
HAVING SUM(od.UnitPrice*Quantity*(1-Discount))>0
ORDER BY 2 DESC*/

/*USE library

;WITH HavingKids AS
(SELECT DISTINCT a.member_no FROM adult AS a
INNER JOIN juvenile AS j 
ON j.adult_member_no=a.member_no)

SELECT title,firstname,lastname
FROM title AS t INNER JOIN loanhist AS lh 
ON t.title_no=lh.title_no
INNER JOIN member AS m ON lh.member_no=m.member_no
WHERE m.member_no IN 
(SELECT member_no FROM HavingKids)
GROUP BY title,firstname,lastname
HAVING COUNT(m.member_no)>1
ORDER BY 1*/

/*USE Northwind

SELECT OrderID,Freight,(SELECT AVG(Freight)
FROM Orders AS o2 WHERE YEAR(o.OrderDate)=YEAR(o2.OrderDate))
AS 'AverageFreight' FROM Orders AS o
WHERE Freight>(SELECT AVG(Freight)
FROM Orders AS o2 WHERE YEAR(o.OrderDate)=YEAR(o2.OrderDate))*/