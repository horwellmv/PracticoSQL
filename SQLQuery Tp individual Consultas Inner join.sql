--Horwell M. Valencia
--PProfesional II

--Utilizando la base de datos vista "Northwind", realizar las siguientes consultas Inner de base de datos:

--1.	Listar todos los productos, sin que se repitan.
SELECT DISTINCT PRODUCTNAME FROM PRODUCTS

--2.	Listar todos los proveedores.

SELECT DISTINCT CompanyName FROM Suppliers

--3.	Listar los ID de los clientes de la Ciudad de México que sean dueños (Contact Title).

SELECT CustomerID FROM Customers WHERE ContactTitle ='Owner' AND Country ='Mexico'

--4.	Listar los ID de los clientes de cualquier ciudad de Alemania  o en la ciudad de Nantes.

SELECT * FROM CUSTOMERS WHERE Country = 'Germany' OR City ='Nantes'

--5.	En la tabla ‘Order Details’ calcular por cada registro el costo total del mismo en una columna aparte (antes de aplicar el descuento).

SELECT *, (UNITPRICE*QUANTITY) AS TOTAL FROM [Order Details]

--6.	Seleccionar por cada producto el nombre de cada uno y el nombre de cada proveedor.

SELECT ProductName, CompanyName FROM Products P LEFT JOIN Suppliers S ON P.SupplierID = S.SupplierID

--7.	Seleccionar por cada pedido el id del pedido, la fecha del pedido, el nombre del cliente.

SELECT OrderID, OrderDate,CompanyName, ContactName FROM Orders ORD LEFT JOIN Customers CS ON ORD.CustomerID=CS.CustomerID

--8.	Seleccionar por cada pedido el id del pedido, la fecha del pedido, el nombre del cliente y el nombre del empleado.

SELECT OrderID, OrderDate, CompanyName, FirstName+' '+LastName AS Empleado FROM Orders ORD LEFT JOIN Customers CS ON ORD.CustomerID=CS.CustomerID INNER JOIN Employees EM ON ORD.EmployeeID= EM.EmployeeID

--9.	Seleccionar por cada pedido el id del pedido, la fecha del pedido y la fecha de factura, en caso de no tener que el resultado sea nulo en ese campo.

SELECT OrderID,OrderDate,ShippedDate FROM Orders


--10.	Seleccionar por cada cliente el total de pedidos realizados por cada uno, todos los clientes seleccionados tienen que tener por lo menos un pedido.

SELECT DISTINCT (CustomerID), COUNT(OrderID) AS NumPedidos FROM OrderS GROUP BY CustomerID

--11.	Seleccionar por cada cliente el total de pedidos realizados por cada uno en caso de que tengan más de 2 pedidos.

SELECT DISTINCT (CustomerID), COUNT(OrderID) AS NumPedidos FROM OrderS GROUP BY CustomerID --sIN TERMINAR

--12.	Seleccionar todos los pedidos que tengan en el producto "Cerveza Northwind Traders" (id producto = 34) y mostrar la fecha del pedido y la cantidad pedida de ese producto.

SELECT OD.OrderID, ORD.OrderDate, PR.ProductName, PR.ProductID , OD.Quantity FROM [Order Details] OD INNER JOIN Orders ORD ON OD.OrderID=ORD.OrderID INNER JOIN Products PR ON OD.ProductID=PR.ProductID WHERE PR.ProductID=34

--13.	Seleccionar todos los pedidos, el nombre del cliente y sus totales. Ordenarlos de mayor a menor de acuerdo con el pedido con mayor importe.

SELECT   C.CompanyName, ORD.OrderID, OD.Freight 
FROM [Order Details] ORD 
INNER JOIN Orders OD ON ORD.OrderID=OD.OrderID 
INNER JOIN Customers C ON OD.CustomerID= C.CustomerID 
ORDER BY OD.Freight DESC

--14.	Seleccionar por cada cliente todos los pedidos realizados, en caso de que no tengan ningún pedido, el resultado del pedido tiene que ser vacío.

SELECT C.CustomerID, C.CompanyName, ORD.OrderID, ORD.OrderDate FROM Customers C LEFT JOIN Orders ORD ON C.CustomerID=ORD.CustomerID


--15.	Se desea conocer los empleados que han atendido una orden y en qué fecha lo hicieron.

SELECT O.OrderID, E.FirstName, E.LastName,E.Title, O.OrderDate FROM Orders O INNER JOIN Employees E ON O.EmployeeID = E.EmployeeID
