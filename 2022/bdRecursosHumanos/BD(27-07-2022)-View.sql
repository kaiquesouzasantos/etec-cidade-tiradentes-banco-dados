USE bdRecursosHumanos

----------------------------------------------------------------------------------------------------------------------------------------------
-- VIEW'S --

-- A) Criar uma viewpara exibir a quantidade de funcion�rios por nome de departamento;

CREATE VIEW vwFuncionario_Departamento AS 
	SELECT COUNT(codFuncionario) AS 'NUM_FUNCIONARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario 
		INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
		GROUP BY nomeDepartamento
GO
SELECT * FROM vwFuncionario_Departamento

----------------------------------------------------------------------------------------------------------------------------------------------
-- B) Usando a viewanterior, exibir somente o nome do departamento que possui o menor n�mero de funcion�rios;

SELECT * FROM vwFuncionario_Departamento WHERE [NUM_FUNCIONARIOS] = (SELECT MIN([NUM_FUNCIONARIOS]) FROM vwFuncionario_Departamento);
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- C) Criar uma viewpara exibir a soma dos sal�rios por nome de departamento;

CREATE VIEW vwSalario_Departamento AS
	SELECT SUM(salarioFuncionario) AS 'SOMA_SALARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario 
		INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
		GROUP BY nomeDepartamento
GO
SELECT * FROM vwSalario_Departamento

----------------------------------------------------------------------------------------------------------------------------------------------
-- D) Utilizando a viewdo exerc�cio anterior, mostrar somente a maior soma dentre os departamentos;

SELECT * FROM vwSalario_Departamento WHERE [SOMA_SALARIOS] = (SELECT MAX([SOMA_SALARIOS]) FROM vwSalario_Departamento);

----------------------------------------------------------------------------------------------------------------------------------------------
-- E) Criar uma viewpara exibir somente o nome dos funcion�rios e o nome dos departamentos daqueles  funcion�rios que n�o possuem dependentes; 

CREATE VIEW vwFuncionario_Sem_Dependentes AS
	SELECT nomeFuncionario AS 'FUNCIONARIOS', nomeDepartamento AS 'DEPARTAMENTO' FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
		WHERE codFuncionario NOT IN (SELECT codFuncionario FROM tbDependente)
GO
SELECT * FROM vwFuncionario_Sem_Dependentes
----------------------------------------------------------------------------------------------------------------------------------------------
-- F) Criar uma viewque exiba a quantidade de dependentes por nome de funcion�rio;

CREATE VIEW vwFuncionario_Dependentes AS 
	SELECT COUNT(codDependente) AS 'NUM_DEPENDENTES', nomeFuncionario AS 'FUNCIONARIO' FROM tbFuncionario 
		INNER JOIN tbDependente ON tbDependente.codFuncionario = tbFuncionario.codFuncionario
		GROUP BY nomeFuncionario
GO
SELECT * FROM vwFuncionario_Dependentes

----------------------------------------------------------------------------------------------------------------------------------------------
-- G) Utilizando a viewanterior, mostrar somente o nome do funcion�rio que possui mais dependentes;

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
-- I) Utilizando a viewdo exerc�cios anterior, apresentar a soma geral dos dependentes;

SELECT SUM([DEPENDENTES]) AS 'TOTAL_DEPENDETES' FROM vwDependentes_Departamento 