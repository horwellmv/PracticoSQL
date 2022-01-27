--IFTS N° 18, 2 B, PRACTICA PROFESIONAL 2
--Alumno: Horwell M. Valencia
--Profesora: TIRADO, Melina

CREATE DATABASE Instituto

Use Instituto

CREATE TABLE Asignaturas
(
ID_Asignatura int not null primary key,
NombreAsignatura varchar(25) not null
)

CREATE TABLE Alumnos
(
DNI int not null primary key, 
Nombre varchar(50) not null, 
Apellido varchar(50) not null,  
Direccion varchar(50) not null,
FechaNacimiento date not null
)

CREATE TABLE Profesores
(
ID_Profesor int not null primary key,
Nombre varchar(50) not null, 
Apellido varchar(50) not null, 
Direccion varchar(50) not null,
FechaNacimiento date not null,
NivelAcademico varchar(50) not null,
)

CREATE TABLE Inscripcion
(
ID_Inscripcion int not null primary key,
IDAsignatura int not null,
IDAlumno int not null,
IDProfesor int not null,
FechaInscripcion date not null,
FOREIGN KEY (IDAsignatura) references Asignaturas(ID_Asignatura), --Claves foráneas para relacionar las tablas
FOREIGN KEY (IDAlumno) references Alumnos (DNI),
FOREIGN KEY (IDProfesor) references Profesores(ID_Profesor),
)

Insert into Alumnos Values(0001,'Armando Esteban','Quito','Ruta 66 al 1200','1966-06-06')
Insert into Alumnos Values(0002,'L-Gante','Keloke','Zona Oeste picante','2001-08-13')
Insert into Alumnos Values(0003,'Sebastián','Battaglia','La Boca','1984-11-08')
Insert into Alumnos Values(0004,'Jazmín','Pineda','Charcas 1250','1996-05-07')
Insert into Alumnos Values(0005,'Matías','Piña','Valentín Gomez 3068','1992-08-24')
Insert into Alumnos Values(0006,'Horwell','Murillo','Calle Falsa 123','1988-08-20')
Insert into Alumnos Values(0007,'Fermín','Tiscornia','Mario Bravo 867','1988-09-14')
Insert into Alumnos Values(0008,'Luis Alberto','Spinetta','Utopía 321','1960-04-04')
Insert into Alumnos Values(0009,'Susana','Gimenez','Barrio Top','1954-11-12')
Insert into Alumnos Values(0010,'Alberto','Fernandez','Olivos','1952-05-07')
Insert into Alumnos Values(0011,'Carlos Alberto','Garcia','Coronel Diaz 1111','1962-08-03')
Insert into Alumnos Values(0012,'Aquiles','Cuento','Wenseslao Villafañe 1268','1978-01-01')

INSERT INTO Asignaturas VALUES(01,'Matematica')
INSERT INTO Asignaturas VALUES(02,'Biologia')
INSERT INTO Asignaturas VALUES(03,'Ingles')
INSERT INTO Asignaturas VALUES(04,'Literatura')

Insert into Profesores Values('001','Graciela','Numeral','Paradigmas 314','1977-02-02','Ingeniero')
Insert into Profesores Values('002','Bartolome','Calavera','Carbono 14','1944-04-04','Doctor')
Insert into Profesores Values('003','Whitney','Houston','Palmolive 8745','1993-05-06','Profesor')
Insert into Profesores Values('004','José','Hernández','El Matadero 1200','1959-09-14','Licenciado')

--HASTA AQUÍ LA CREACIÓN DE LA BASE DE DATOS, TABLAS Y REGISTROS
								
INSERT INTO Inscripcion VALUES (100,01,004,001,'2021-02-27')
INSERT INTO Inscripcion VALUES (101,03,004,003,'2021-02-27')

INSERT INTO Inscripcion VALUES (102,02,001,002,'2021-02-27')
INSERT INTO Inscripcion VALUES (103,01,001,001,'2021-02-27')

INSERT INTO Inscripcion VALUES (104,04,005,004,'2021-02-25')
INSERT INTO Inscripcion VALUES (105,03,005,003,'2021-02-25')

INSERT INTO Inscripcion VALUES (106,02,002,002,'2021-02-25')
INSERT INTO Inscripcion VALUES (107,04,002,004,'2021-02-25')

INSERT INTO Inscripcion VALUES (108,01,010,001,'2021-02-24')
INSERT INTO Inscripcion VALUES (109,02,010,002,'2021-02-24')

INSERT INTO Inscripcion VALUES (110,02,007,002,'2021-02-24')
INSERT INTO Inscripcion VALUES (111,04,007,004,'2021-02-24')

INSERT INTO Inscripcion VALUES (112,01,003,001,'2021-02-24')
INSERT INTO Inscripcion VALUES (113,04,003,004,'2021-02-24')

INSERT INTO Inscripcion VALUES (114,01,006,001,'2021-02-20')
INSERT INTO Inscripcion VALUES (115,02,006,002,'2021-02-20')
INSERT INTO Inscripcion VALUES (116,03,006,003,'2021-02-20')
INSERT INTO Inscripcion VALUES (117,04,006,004,'2021-02-20')

INSERT INTO Inscripcion VALUES (118,01,008,001,'2021-02-20')
INSERT INTO Inscripcion VALUES (119,04,008,004,'2021-02-20')

--HASTA AQUÍ LAS INSCRIPCIONES

--1.	Realizar una consulta que muestre cuántos alumnos tiene cada profesor.

SELECT IDProfesor, COUNT (*) FROM Inscripcion GROUP BY IDProfesor

--2.	Realizar una consulta que muestro las asignaturas en las que están inscriptos los alumnos.

SELECT ID_Inscripcion, Nombre+' '+Apellido AS Alumnx, NombreAsignatura FROM Inscripcion I INNER JOIN Alumnos A ON I.IDAlumno=A.DNI
INNER JOIN Asignaturas M ON I.IDAsignatura = M.ID_Asignatura ORDER BY Alumnx

--3.	Realizar una consulta que muestre todos los alumnos que tengan entre 20 y 30 años.
SELECT DNI, Nombre+' '+Apellido AS Alumnx FROM Alumnos WHERE (year(getdate())-year(FechaNacimiento)) BETWEEN 20 AND 30

--4.	Realizar una consulta que muestre los alumnos de los profesores que tengan nivel académico universitario.
--Aclaración: En el punto 4, consideramos como "Universitarios" a los profesores y profesoras
--que tienen títulos de Licenciado, Ingeniero y Doctorado. 

SELECT A.Nombre+' '+A.Apellido AS Alumnx, P.Apellido FROM Inscripcion I INNER JOIN Alumnos A ON I.IDAlumno=A.DNI
INNER JOIN Profesores P ON I.IDProfesor = P.ID_Profesor WHERE NivelAcademico IN ('Ingeniero','Licenciado','Doctor')
ORDER BY P.Apellido ASC

--5.	Listar el Nombre y Apellido de los alumnos que estén inscriptos en las 3 asignaturas.
SELECT A.Nombre+' '+A.Apellido AS Alumnx,COUNT(IDAsignatura) AS Cant_Materias FROM
Inscripcion I INNER JOIN Alumnos A ON I.IDAlumno=A.DNI
GROUP BY IDAlumno,A.Nombre+' '+A.Apellido HAVING COUNT(IDAsignatura) >=3

--6.	Agregar en la tabla qué corresponda un campo llamado Nota (que corresponde a la nota final de la materia)
ALTER TABLE Inscripcion ADD Nota int

--7.	Actualizar la tabla y cargar una nota por asignatura y alumno.
UPDATE Inscripcion SET Nota= 5 WHERE ID_Inscripcion = 100
UPDATE Inscripcion SET Nota= 9 WHERE ID_Inscripcion = 101
UPDATE Inscripcion SET Nota= 4 WHERE ID_Inscripcion = 102
UPDATE Inscripcion SET Nota= 10 WHERE ID_Inscripcion = 103
UPDATE Inscripcion SET Nota= 7 WHERE ID_Inscripcion = 104
UPDATE Inscripcion SET Nota= 7 WHERE ID_Inscripcion = 105
UPDATE Inscripcion SET Nota= 6 WHERE ID_Inscripcion = 106
UPDATE Inscripcion SET Nota= 8 WHERE ID_Inscripcion = 107
UPDATE Inscripcion SET Nota= 1 WHERE ID_Inscripcion = 108
UPDATE Inscripcion SET Nota= 8 WHERE ID_Inscripcion = 109
UPDATE Inscripcion SET Nota= 4 WHERE ID_Inscripcion = 110
UPDATE Inscripcion SET Nota= 9 WHERE ID_Inscripcion = 111
UPDATE Inscripcion SET Nota= 2 WHERE ID_Inscripcion = 112
UPDATE Inscripcion SET Nota= 1 WHERE ID_Inscripcion = 113
UPDATE Inscripcion SET Nota= 7 WHERE ID_Inscripcion = 114
UPDATE Inscripcion SET Nota= 8 WHERE ID_Inscripcion = 115
UPDATE Inscripcion SET Nota= 10 WHERE ID_Inscripcion = 116
UPDATE Inscripcion SET Nota= 9 WHERE ID_Inscripcion = 117
UPDATE Inscripcion SET Nota= 10 WHERE ID_Inscripcion = 118
UPDATE Inscripcion SET Nota= 10 WHERE ID_Inscripcion = 119

--8.	Mostrar el nombre, apellido y la nota de todos los Alumnos que hayan aprobado Matemática, 
--teniendo en cuenta que se aprueba con 6. (pueden usar para la consulta el ID de la materia) 
-- No realizar subconsultas.

SELECT A.Nombre+' '+A.Apellido AS Alumnx, Nota FROM Inscripcion I INNER JOIN Alumnos A ON I.IDAlumno=A.DNI
INNER JOIN Asignaturas M ON I.IDAsignatura = M.ID_Asignatura WHERE IDAsignatura = 1 AND Nota >= 6

--9.	Realizar una consulta que muestre el promedio de las calificaciones por asignatura.

SELECT NombreAsignatura, AVG(Nota) AS Promedio_Materia FROM Inscripcion I INNER JOIN Asignaturas A ON I.IDAsignatura=A.ID_Asignatura
GROUP BY IDAsignatura, NombreAsignatura

--10.	Realizar una consulta que muestre los alumnos cuyo promedio
--sea superior al promedio de la asignatura Inglés (pueden usar el ID de la misma)

SELECT IDAlumno,Nombre+' '+Apellido AS Alumnx FROM Inscripcion I INNER JOIN Alumnos A ON I.IDAlumno=A.DNI
GROUP BY IDAlumno, Nombre, Apellido HAVING AVG(Nota) > (SELECT AVG(Nota) FROM Inscripcion WHERE IDAsignatura=3)










