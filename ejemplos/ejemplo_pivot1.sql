SELECT * FROM 
(
SELECT YEAR(SOH.OrderDate) as SalesYear,
        SOH.SubTotal as TotalSales
 FROM sales.SalesOrderHeader SOH
     JOIN sales.SalesOrderDetail SOD ON SOH.SalesOrderId = SOD.SalesOrderId
) AS Sales
PIVOT (SUM(TotalSales)
FOR SalesYear IN ([2011],[2012],[2013],[2014]))
as PVT