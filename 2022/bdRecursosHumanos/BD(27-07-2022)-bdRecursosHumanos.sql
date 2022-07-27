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

----------------------------------------------------------------------------------------------------------------------------------------------
-- VIEW'S --

-- A) Criar uma viewpara exibir a quantidade de funcionários por nome de departamento;

CREATE VIEW vwFuncionario_Departamento AS 
	SELECT COUNT(codFuncionario) AS 'NUM_FUNCIONARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario 
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY nomeDepartamento
GO
SELECT * FROM vwFuncionario_Departamento

----------------------------------------------------------------------------------------------------------------------------------------------
-- B) Usando a viewanterior, exibir somente o nome do departamento que possui o menor número de funcionários;

SELECT * FROM vwFuncionario_Departamento WHERE [NUM_FUNCIONARIOS] = (SELECT MIN([NUM_FUNCIONARIOS]) FROM vwFuncionario_Departamento);
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- C) Criar uma viewpara exibir a soma dos salários por nome de departamento;

CREATE VIEW vwSalario_Departamento AS
	SELECT SUM(salarioFuncionario) AS 'SOMA_SALARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario 
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY nomeDepartamento
GO
SELECT * FROM vwSalario_Departamento

----------------------------------------------------------------------------------------------------------------------------------------------
-- D) Utilizando a viewdo exercício anterior, mostrar somente a maior soma dentre os departamentos;

SELECT * FROM vwSalario_Departamento WHERE [SOMA_SALARIOS] = (SELECT MAX([SOMA_SALARIOS]) FROM vwSalario_Departamento);

----------------------------------------------------------------------------------------------------------------------------------------------
-- E) Criar uma viewpara exibir somente o nome dos funcionários e o nome dos departamentos daqueles  funcionários que não possuem dependentes; 

CREATE VIEW vwFuncionario_Sem_Dependentes AS
	SELECT nomeFuncionario AS 'FUNCIONARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	WHERE codFuncionario NOT IN (SELECT codFuncionario FROM tbDependente)
GO
SELECT * FROM vwFuncionario_Sem_Dependentes
----------------------------------------------------------------------------------------------------------------------------------------------
-- F) Criar uma viewque exiba a quantidade de dependentes por nome de funcionário;

CREATE VIEW vwFuncionario_Dependentes AS 
	SELECT COUNT(codDependente) AS 'NUM_DEPENDENTES', nomeFuncionario AS 'FUNCIONARIO' FROM tbFuncionario 
	INNER JOIN tbDependente ON tbDependente.codFuncionario = tbFuncionario.codFuncionario
	GROUP BY nomeFuncionario
GO
SELECT * FROM vwFuncionario_Dependentes

----------------------------------------------------------------------------------------------------------------------------------------------
-- G) Utilizando a viewanterior, mostrar somente o nome do funcionário que possui mais dependentes;

SELECT * FROM vwFuncionario_Dependentes WHERE [NUM_DEPENDENTES] = (SELECT MAX([NUM_DEPENDENTES]) FROM vwFuncionario_Dependentes);

----------------------------------------------------------------------------------------------------------------------------------------------
-- H) Criar uma viewpara exibir a quantidade de dependentes por departamento;

CREATE VIEW vwDependentes_Departamento AS 
	SELECT COUNT(codDependente) AS 'DEPENDENTES', nomeDepartamento AS 'DEPARTAMENTO' FROM tbDependente
	INNER JOIN tbFuncionario ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY nomeDepartamento
GO
SELECT * FROM vwDependentes_Departamento

----------------------------------------------------------------------------------------------------------------------------------------------
-- I) Utilizando a viewdo exercícios anterior, apresentar a soma geral dos dependentes;

SELECT SUM([DEPENDENTES]) AS 'TOTAL_DEPENDETES' FROM vwDependentes_Departamento 