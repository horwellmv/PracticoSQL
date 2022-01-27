--Práctica Profesional 2 “B”
--Horwell Murillo Valencia

--Utilizando la base de datos vista  "Northwind", realizar las siguientes consultas de base de datos:

--1.	Mostrar el costo promedio de envío en un campo llamado Prom_envio.

SELECT AVG(Freight) AS PROM_ENVIO FROM Orders

--2.	Mostrar el costo Máximo de envío en un campo llamado Max_envio

SELECT MAX(Freight) AS MAX_ENVIO FROM Orders

--3.	Mostrar el costo Mínimo de envío en un campo llamado Min_envio

SELECT MIN(Freight) AS MINIMO FROM Orders

--4.	Mostrar la suma de todos los costos de envío en un campo llamado Sum_envio.

SELECT SUM(Freight) AS SUMA_ENVIOS FROM Orders

--5.	Realizar una consulta que cuente todos los registros de la tabla Orders

SELECT COUNT(*) AS TOTAL_REGISTROS FROM Orders

--6.	Realizar una consulta que cuente todas las fechas de envío de la tabla Orders (Sin contar los valores nulos)

SELECT COUNT (ShippedDate) AS FECHAS_DE_ENVIO FROM Orders

--7.	Realizar una consulta que muestre la suma de todos los costos de envío agrupada por empleado Siempre que sea mayor a 5000.

SELECT EmployeeID ,SUM(Freight) AS SUMA_ENVIOS FROM Orders GROUP BY EmployeeID HAVING SUM(Freight)>5000

--8.	Realizar la misma consulta que en el punto anterior, pero mostrando el nombre del empleado.

SELECT O.EmployeeID, E.FirstName ,SUM(Freight) AS SUMA_ENVIOS FROM Orders O INNER JOIN Employees E ON O.EmployeeID=E.EmployeeID GROUP BY O.EmployeeID, E.FirstName HAVING SUM(Freight)>5000
--LO QUE HAYA EN EL SELECT DEBE ESTAR EN EL ORDER BY

--9.	Realizar una consulta que muestre el promedio de todos los costos de envío por cliente siempre que sea menor a 60

SELECT C.CustomerID, AVG(O.Freight) FROM Orders O INNER JOIN Customers C ON O.CustomerID= C.CustomerID GROUP BY C.CustomerID HAVING AVG(O.Freight)<60 

--10.	Realizar la misma consulta que en el punto anterior, pero colocando el nombre de la compañía.

SELECT C.CustomerID, C.CompanyName, AVG(O.Freight) AS "Promedio Envio" FROM Orders O INNER JOIN Customers C ON O.CustomerID= C.CustomerID GROUP BY C.CustomerID, C.CompanyName HAVING AVG(O.Freight)<60 


--11.	Realizar una consulta que muestre por cada orden el monto total de la misma antes de aplicar el descuento ordenada de manera descendente

SELECT OrderID, SUM(UnitPrice* Quantity) AS PRECIO_TOTAL FROM [Order Details] GROUP BY OrderID ORDER BY PRECIO_TOTAL DESC

--12.	Realizar una consulta que muestre por cada orden el monto total de la misma después de aplicar el descuento ordenada de manera descendente.

SELECT OrderID,ROUND(SUM (UnitPrice* Quantity - UnitPrice*Quantity*Discount),2) AS PRECIO_TOTAL FROM [Order Details] GROUP BY OrderID ORDER BY PRECIO_TOTAL DESC

--13. CONSULTA MAS COMPLETA DE TODAS.
SELECT C.CustomerID, C.ContactName , AVG(O.Freight) AS 'Pomedio Cost Envios' 
FROM Orders O INNER JOIN Customers C ON O.CustomerID= C.CustomerID 
WHERE NOT C.CustomerID='ALFKI' 
GROUP BY C.CustomerID,C.ContactName , O.Freight  
HAVING AVG(O.Freight)<60 
ORDER BY O.Freight DESC, C.CustomerID
