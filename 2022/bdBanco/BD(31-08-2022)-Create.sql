CREATE DATABASE bdBanco
GO
USE bdBanco

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S --

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR (70)
	, cpfCliente VARCHAR (15)
);
GO

CREATE TABLE tbContaCorrente (
	codConta INT PRIMARY KEY IDENTITY (1,1)
	, numConta INT
	, saldoConta MONEY
	, codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
);
GO

CREATE TABLE tbDeposito (
	codDeposito INT PRIMARY KEY IDENTITY (1,1)
	, valorDeposito MONEY
	, codConta INT FOREIGN KEY REFERENCES tbContaCorrente(codConta)
	, dataDeposito SMALLDATETIME
);

CREATE TABLE tbSaque (
	codSaque INT PRIMARY KEY IDENTITY (1,1)
	, valorSaque MONEY
	, codConta INT FOREIGN KEY REFERENCES tbContaCorrente(codConta)
	, dataSaque SMALLDATETIME
);
GO
