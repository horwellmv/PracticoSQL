--Horwell Murillo Valencia 
--Practica Profesional - Tp Individual  Consultas simples. Clase 27 de Sep 2021

--1.	Una lista de todos los detalles de la tabla de empleados.
SELECT * FROM Employees 

--2.	Una lista de los nombres y apellidos de todos los empleados.
SELECT FirstName, LastName FROM Employees

--3.	Una lista de todos los nombres de las ciudades que aparecen en la tabla de empleados.
SELECT DISTINCT City FROM Employees

--4.	En la tabla productos: Una lista de los nombres de productos y precios unitarios.
SELECT ProductName, UnitPrice FROM Products

--5.	En la tabla de empleados: una lista de los detalles completos de los empleados que viven en EE.UU.
SELECT * FROM Employees WHERE Country = 'USA'

--6.	A partir de la tabla Pedidos, listar todos los pedidos que tienen un gasto de envio > 50.
SELECT ShipName, ShipCity, ShipCountry, Freight FROM Orders WHERE Freight > 50 ORDER BY Freight

--7.	De la tabla de clientes: listar nombre de la empresa de todos los clientes donde el cargo es igual a Propietario.
SELECT * FROM Customers WHERE ContactTitle = 'OWNER'

--8.	A partir de los clientes una lista de todos donde el nombre del cliente comienza con la letra "A”.
SELECT ContactName, ContactTitle, City FROM Customers WHERE ContactName LIKE ('A%')

--9.	Una lista de todos los productos, ordenado por precio unitario (el más barato primero).
SELECT ProductName, UnitPrice FROM Products ORDER BY UnitPrice

--10.	Una lista de todos los productos, ordenado por precio unitario (el más caro primero).
SELECT ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC

--11.	Insertar el cliente nuevo completando todos los campos de la tabla.
INSERT INTO Customers VALUES('AAA','The Simpsons', 'Bartholomew J. Simpson','Son Owner','Evergreen Terrace 742','Springfield','Oregon','0000','USA','764-84377',NULL)

--12.	Actualizar el nombre del nuevo cliente.
UPDATE Customers SET ContactName='Homero Jay Simpson' WHERE CustomerID='AAA'
SELECT * FROM Customers WHERE CustomerID='AAA' --PARA REVISAR EL CAMBIO

--13.	Eliminar el cliente insertado en el punto 16.
DELETE FROM Customers WHERE CustomerID='AAA'
