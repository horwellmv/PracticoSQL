--Práctica Profesional 2 “B”
--Primer Parcial
--Horwell M. Valencia

--Utilizando la base de datos vista "Northwind", realizar las siguientes consultas. 

--1.	Listar los países de los clientes sin que se repitan.
SELECT DISTINCT Country FROM Customers

--2.	Seleccionar los 10 productos con mayor cantidad en Stock, ordenados por ese campo (UnitsInStock) de manera descendente.

SELECT TOP 10 ProductName, UnitsInStock FROM Products ORDER BY UnitsInStock DESC

--3.	Seleccionar todos los productos que tengan menos de 10 unidades en Stock.

SELECT  ProductName, UnitsInStock FROM Products WHERE UnitsInStock<10 ORDER BY UnitsInStock

--4.	Seleccionar las órdenes cuyo costo de envío NO se encuentre entre 50 y 80.

SELECT * FROM Orders WHERE Freight < 50 OR Freight > 80 ORDER BY Freight -- USANDO OPERADOR LOGICO
SELECT * FROM Orders WHERE Freight NOT BETWEEN 50 AND 80 ORDER BY Freight -- USANDO FUNT NOT-BETWEEN

--5.	Seleccionar las órdenes cuyo costo de envío SI se encuentre entre 50 y 80.

SELECT * FROM Orders WHERE Freight > 50 AND Freight < 80 ORDER BY Freight -- USANDO OPERADOR LOGICO
SELECT * FROM Orders WHERE Freight BETWEEN  50 AND  80 ORDER BY Freight -- USANDO FUNT BETWEEN

--6.	¿Qué diferencia hay entre “IN” y “AND”? escribe un ejemplo con cada una.

-- IN Regresa los campos con los que encuetra una coincidencia. 
SELECT OrderID, ShipName, ShipCity, Freight FROM Orders WHERE ShipCity IN ('Madrid','London')

-- AND Regresa los campos que cumplen TODAS las condiciones logicas, es decri, deben ser verdaderas, como por ejemplo dos condiciones IN.
SELECT OrderID, ShipName, ShipCity, Freight FROM Orders WHERE ShipCity IN ('Madrid','London') AND ShipName IN ('Romero y tomillo', 'Seven Seas Imports')


--7.	Calcular el valor que hay en Stock de cada producto discontinuado del que hayan quedado unidades en una columna aparte llamada “Disc_Value”

SELECT ProductName, UnitPrice, UnitsInStock, UnitPrice*UnitsInStock AS Valor FROM Products WHERE Discontinued = 1

--8.	Seleccionar los Productos y sus categorías. 

SELECT ProductName, C.CategoryID, CategoryName FROM Products P INNER JOIN Categories C ON P.CategoryID = C.CategoryID ORDER BY CategoryName

--9.	Seleccionar por cada Producto la compañía que lo provee. 

SELECT ProductID, ProductName, CompanyName AS Proveedor FROM Products P LEFT JOIN Suppliers S ON P.ProductID= S.SupplierID -- INCLUYE AQUELLOS QUE NO TIENEN PROVEEDOR

--10.	Listar todos los nombres de los Empleados cuyos nombres comiencen con “A”.

SELECT FirstName AS Nombre, LastName AS Apellido FROM Employees WHERE FirstName LIKE ('A%')

--11.	Listar todos los nombres de los Empleados cuyos nombres terminen con “N”.

SELECT FirstName AS Nombre, LastName AS Apellido FROM Employees WHERE FirstName LIKE ('%N')

--12.	Agregar un registro nuevo en una de las tablas completando todos los campos.

INSERT INTO Products VALUES('Cafe de Colombia','8','5','10Kg bags','20,00','100','80','30','0') -- CAMPO PRODUCT.ID NO HACE FALTA PORQUE ES AUTO INCREMENTABLE

SELECT * FROM Products -- PARA CONSULTAR LA TABLA Y VERIFICAR EL CAMBIO

--13.	Eliminar el registro creado en el campo anterior.

DELETE FROM Products WHERE ProductID=78
