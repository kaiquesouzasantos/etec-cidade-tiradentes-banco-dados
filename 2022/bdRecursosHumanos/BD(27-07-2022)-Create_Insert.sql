CREATE DATABASE bdRecursosHumanos
GO
USE bdRecursosHumanos

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S --

CREATE TABLE tbDepartamento(
	codDepartamento INT PRIMARY KEY NOT NULL IDENTITY(1,1)
	,nomeDepartamento VARCHAR(50)
);

CREATE TABLE tbFuncionario(
	codFuncionario INT PRIMARY KEY NOT NULL IDENTITY(1,1)
	, nomeFuncionario VARCHAR(50)
	, cpfFuncionario VARCHAR(11)
	, sexoFuncionario VARCHAR(2)
	, dataNascFuncionario SMALLDATETIME
	, salarioFuncionario MONEY
	, codDepartamento INT FOREIGN KEY REFERENCES tbDepartamento(codDepartamento)
);

CREATE TABLE tbDependente(
	codDependente INT PRIMARY KEY NOT NULL IDENTITY(1,1)
	, nomeDependente VARCHAR(50)
	, dataNascDependente DATE
	, sexoDependente VARCHAR(2)
	, codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
);

----------------------------------------------------------------------------------------------------------------------------------------------
 -- INSERT'S --

INSERT INTO tbDepartamento(nomeDepartamento) VALUES 
	('COMPRAS'), ('Vendas'), ('TI'), ('Marketing');
GO

INSERT INTO tbFuncionario(nomeFuncionario, cpfFuncionario, sexoFuncionario, dataNascFuncionario, salarioFuncionario, codDepartamento)
VALUES 
	('Maria Luisa Moura', '12345678911', 'F', '1990-02-10 00:00:00', 3400, 1)
	, ('Mariana Goulart', '12345678911', 'F', '1991-04-08 00:00:00', 2800, 1)
	, ('Pedro Paulo Vidgal', '12345678911', 'M', '1994-05-07 00:00:00', 5400, 2)
	, ('Carlos Calixto', '12345678911', 'M', '1965-03-03 00:00:00', 8900, 2)
	, ('Viviane Martins', '12345678911', 'F', '1976-06-06 00:00:00', 4300, 3)
	, ('Analice Mendes', '12345678911', 'F', '1981-09-09 00:00:00', 6800, 3)
	, ('Patricia Ishikawa', '12345678911', 'F', '1978-05-05 00:00:00', 4900, 4);
GO

INSERT INTO tbDependente(nomeDependente, dataNascDependente, sexoDependente, codFuncionario)
VALUES 
	('Lucas Moura', '2015-01-10', 'M', 1)
	, ('Carlos Calixto Jr', '2000-06-08', 'M', 4)
	, ('Michele Costa Calixto', '2003-09-09', 'F', 4)
	, ('Silvana Costa Calixto', '2006-04-04', 'F', 4)
	, ('Arthur Mendes Silva', '2010-07-07', 'M', 6)
GO