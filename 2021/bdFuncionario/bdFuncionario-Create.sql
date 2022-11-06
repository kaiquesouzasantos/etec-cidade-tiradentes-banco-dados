CREATE DATABASE bdFuncionario
GO
USE bdFuncionario

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