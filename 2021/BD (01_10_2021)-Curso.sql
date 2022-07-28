CREATE DATABASE bdCurso
GO
USE bdCurso

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY NOT NULL
	,nomeAluno VARCHAR(30)
	,dataNascAluno DATE
	,rgAluno VARCHAR (15)
	,naturalAluno VARCHAR (30)
);

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY NOT NULL
	,nomeCurso VARCHAR(30)
	,cargaHoraCurso VARCHAR(8)
	,valorCurso VARCHAR(10)
);
GO

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY NOT NULL
	,nomeTurma VARCHAR (30)
	,horarioTurma TIME
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
);
GO

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY NOT NULL
	,dataMatricula DATE
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S

INSERT INTO tbAluno
VALUES 	(1,'Kaique','2006-02-12','0228789289-58','Brasil-S�o Paulo-SP'),
		(2,'Done','1997-03-18','4451252369-68','Brasil-S�o Paulo-SP'),
		(3,'Thayane','1990-05-18','434343545-58','Brasil-S�o Paulo-SP'),
		(4,'Mauricio','1973-07-23','14415666289-88','Brasil-S�o Paulo-SP'),
		(5,'Francisco','1975-01-13','8885589289-9','Brasil-S�o Paulo-SP'),
		(6,'Clayton','1965-07-05','3931783228-76','Brasil-S�o Paulo-SP'),
		(7,'Everson','1988-06-28','7130398613-58','Brasil-S�o Paulo-SP'),
		(8,'Rodrigo','1989-12-31','713472378613-94','Brasil-S�o Paulo-SP'),
		(9,'Robson','1988-08-13','8599212113-29','Brasil-S�o Paulo-SP'),
		(10,'Wellida','1985-06-28','432984763613-09','Brasil-S�o Paulo-SP');

INSERT INTO tbCurso
VALUES 	(1,'Python','60h','R$800.00'),
		(2,'JavaScript','40h','R$700.00'),
		(3,'Java','40h','R$900.00'),
		(4,'Java EE','50h','R$1200.00'),
		(5,'Java Apache','80h','R$1100.00'),
		(6,'Java Spring Boot','70h','R$1500.00'),
		(7,'L�gica de Programa��o','14h','R$200.00'),
		(8,'TIC','14h','R$200.00'),
		(9,'Modelagem de BD','20h','R$300.00'),
		(10,'REST APIs com Spring','50h','R$900.00');
GO

INSERT INTO tbTurma
VALUES	(1,'1�A','12:00:00',1),
		(2,'1�B','15:00:00',2),
		(3,'1�C','18:00:00',3),
		(4,'2�A','12:00:00',4),
		(5,'2�B','15:00:00',5),
		(6,'2�C','18:00:00',6),
		(7,'3�A','12:00:00',7),
		(8,'3�B','15:00:00',8),
		(9,'3�C','18:00:00',9),
		(10,'T-ESP','20:00:00',10);
GO

INSERT INTO tbMatricula
VALUES	(1,'2021-02-08',1,10),
		(2,'2021-06-08',2,9),
		(3,'2021-06-08',3,8),
		(4,'2020-06-08',4,7),
		(5,'2020-02-08',5,6),
		(6,'2020-02-08',6,5),
		(7,'2019-06-08',7,4),
		(8,'2019-02-08',8,3),
		(9,'2019-06-08',9,2),	
		(10,'2017-02-08',10,1);	
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE'S

-- ALUNO
UPDATE tbAluno SET nomeAluno = 'Wellida' WHERE codAluno = 1;
UPDATE tbAluno SET nomeAluno = 'Robson' WHERE codAluno = 2;
UPDATE tbAluno SET nomeAluno = 'Rodrigo' WHERE codAluno = 3;
UPDATE tbAluno SET nomeAluno = 'Everson' WHERE codAluno = 4;
UPDATE tbAluno SET nomeAluno = 'Clayton' WHERE codAluno = 5;
UPDATE tbAluno SET nomeAluno = 'Francisco' WHERE codAluno = 6;
UPDATE tbAluno SET nomeAluno = 'Mauricio' WHERE codAluno = 7;
UPDATE tbAluno SET nomeAluno = 'Thayane' WHERE codAluno = 8;
UPDATE tbAluno SET nomeAluno = 'Done' WHERE codAluno = 9;
UPDATE tbAluno SET nomeAluno = 'Kaique' WHERE codAluno = 10;

-- CURSO
UPDATE tbCurso SET valorCurso = 'R$1000.00' WHERE codCurso = 1;
UPDATE tbCurso SET valorCurso = 'R$750.00' WHERE codCurso = 2;
UPDATE tbCurso SET valorCurso = 'R$800.00' WHERE codCurso = 3;
UPDATE tbCurso SET valorCurso = 'R$1300.00' WHERE codCurso = 4;
UPDATE tbCurso SET valorCurso = 'R$1000.00' WHERE codCurso = 5;
UPDATE tbCurso SET valorCurso = 'R$1700.00' , cargaHoraCurso = '120h' WHERE codCurso = 6;
UPDATE tbCurso SET valorCurso = 'R$350.00' WHERE codCurso = 7;
UPDATE tbCurso SET valorCurso = 'R$250.00' WHERE codCurso = 8;
UPDATE tbCurso SET valorCurso = 'R$400.00' WHERE codCurso = 9;
UPDATE tbCurso SET valorCurso = 'R$1200.00' , cargaHoraCurso = '90h'WHERE codCurso = 10;

-- TURMA
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 1;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 2;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 3;
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 4;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 5;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 6;
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 7;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 8;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 9;
UPDATE tbTurma SET horarioTurma = '18:00:00' WHERE codTurma = 10;

-- MATRICULA
UPDATE tbMatricula SET codTurma = 1 WHERE codMatricula = 1;
UPDATE tbMatricula SET codTurma = 2 WHERE codMatricula = 2;
UPDATE tbMatricula SET codTurma = 3 WHERE codMatricula = 3;
UPDATE tbMatricula SET codTurma = 4 WHERE codMatricula = 4;
UPDATE tbMatricula SET codTurma = 5 WHERE codMatricula = 5;
UPDATE tbMatricula SET codTurma = 6 WHERE codMatricula = 6;
UPDATE tbMatricula SET codTurma = 7 WHERE codMatricula = 7;
UPDATE tbMatricula SET codTurma = 8 WHERE codMatricula = 8;
UPDATE tbMatricula SET codTurma = 9 WHERE codMatricula = 9;
UPDATE tbMatricula SET codTurma = 10 WHERE codMatricula = 10;

----------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT -> PROCEDURE

CREATE PROCEDURE prodTabelas
AS BEGIN 
	SELECT * FROM tbAluno
	SELECT * FROM tbTurma
	SELECT * FROM tbMatricula
	SELECT * FROM tbCurso
END
EXEC prodTabelas