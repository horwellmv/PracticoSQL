--Horwell M. Valencia
--Creacion de Db BDCursos con 3 tablas. Curso, profesor y alumno.

CREATE DATABASE BDCursos
GO

USE BDCursos
GO

CREATE TABLE CURSOS
(
	IdCurso SMALLINT IDENTITY NOT NULL PRIMARY KEY,
	Curso VARCHAR NOT NULL,
	Turno VARCHAR NOT NULL,
	Maestro VARCHAR, 
	Alumnos VARCHAR,
	CargaHoraria SMALLINT
)


CREATE TABLE PROFESOR
(
	IdProfesor SMALLINT IDENTITY NOT NULL PRIMARY KEY,
	Nombre VARCHAR NOT NULL,
	IdCurso SMALLINT NOT NULL,
	Estado BIT NOT NULL,
	CONSTRAINT FK_CURSO FOREIGN KEY (IdCurso) REFERENCES CURSOS
)

CREATE TABLE ALUMNO
(
	IdAlumno SMALLINT IDENTITY NOT NULL PRIMARY KEY,
	Nombre VARCHAR NOT NULL,
	Edad SMALLINT NOT NULL,
	Curso VARCHAR NOT NULL,
	Estado BIT NOT NULL,
	IdCurso SMALLINT,
	CONSTRAINT FK_A_CURSOS FOREIGN KEY (IdCurso) REFERENCES CURSOS
)