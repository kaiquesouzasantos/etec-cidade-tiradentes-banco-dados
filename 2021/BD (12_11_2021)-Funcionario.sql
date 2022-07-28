CREATE DATABASE Funcionario
USE Funcionario

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tbFunc(
	CodFunc INT PRIMARY KEY NOT NULL
	,Nome_func VARCHAR(60)
	,Uf CHAR(2)
	,Idade INT
	,Qtde_filhos INT
);
GO

CREATE TABLE tbFuncional(
	CodFuncional INT PRIMARY KEY NOT NULL
	,Cargo VARCHAR(30) 
	,Salario MONEY
	,Tempo_empresa INT
	,Tempo_cargo INT
	,Sindicalizado CHAR(3)
	,CodFunc INT FOREIGN KEY REFERENCES tbFunc(CodFunc)                       
);
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S

INSERT INTO tbFunc VALUES
	(1,'Kaque','SP',15,0),
	(2,'Gustavo','SP',16,0),
	(3,'Lorena','SP',16,0),
	(4,'Lurdes','BA',48,10),
	(5,'Jairo','CE',79,5),
	(6,'Maria','MG',38,3),
	(7,'Augusto','RS',47,7),
	(8,'Pedro','PE',25,2),
	(9,'Larissa','ES',32,1),
	(10,'Mauro','PR',45,2);
GO
	
INSERT INTO tbFuncional VALUES
	(1,'Programador JR','2500.00',1,1,'NAO',1),
	(2,'Programador JR','2500.00',1,1,'NAO',2),
	(3,'Programador JR','2500.00',1,1,'NAO',3),
	(4,'Auxiliar de Limpeza','1200.00',6,3,'SIM',4),
	(5,'Porteiro','1700.00',12,12,'SIM',5), 
	(6,'Programador SR','12000.00',8,2,'NAO',6),
	(7,'Programador PL','6000.00',5,3,'NAO',7),
	(8,'Auxiliar de Limpeza','1200.00',2,2,'SIM',8),
	(9,'Programador SR','12000.00',5,5,'NAO',9),
	(10,'Seguranca','2000.00',8,6,'SIM',10);
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROPOSTA DE EXERCICIO
	
-- 1	
SELECT SUM(CodFunc) FROM tbFunc
-- 2
SELECT SUM(Idade) FROM tbFunc
-- 3
SELECT SUM(Qtde_filhos) FROM tbFunc
-- 4
SELECT SUM(Salario) FROM tbFuncional
-- 5
SELECT SUM(Tempo_empresa) FROM tbFuncional
-- 6
SELECT SUM(Tempo_cargo) FROM tbFuncional
-- 7
SELECT MAX(codFunc) FROM tbFunc
-- 8
SELECT MIN(codFunc) FROM tbFunc
-- 9
SELECT MAX(Idade) FROM tbFunc
-- 10
SELECT MIN(Idade) FROM tbFunc
-- 11
SELECT MAX(Qtde_filhos) FROM tbFunc
-- 12
SELECT MIN(Qtde_filhos) FROM tbFunc
-- 13
SELECT MAX(Salario) FROM tbFuncional
-- 14
SELECT MIN(Salario)FROM tbFuncional
-- 15
SELECT MAX(Tempo_empresa) FROM tbFuncional
-- 16
SELECT MIN(Tempo_empresa) FROM tbFuncional
-- 17
SELECT MAX(Tempo_cargo) FROM tbFuncional                                                                                                                     
-- 18
SELECT MIN(Tempo_cargo) FROM tbFuncional
-- 19
SELECT AVG(CodFunc) FROM tbFunc
-- 20
SELECT AVG(Idade) FROM tbFunc
-- 21
SELECT AVG(Qtde_filhos) FROM tbFunc
-- 22 
SELECT AVG(Salario) FROM tbFuncional
-- 23
SELECT AVG(Tempo_empresa) FROM tbFuncional
-- 24
SELECT AVG(Tempo_cargo)FROM tbFuncional
-- 25
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario > '800.00' 
-- 26
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario > '1000.00'                             
-- 27
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario < '400.00' 
-- 28
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario < '2000.00' 
-- 29
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario > '8000.00' 
-- 30
SELECT COUNT(CodFunc) FROM tbFuncional WHERE Salario < '1000.00' 

