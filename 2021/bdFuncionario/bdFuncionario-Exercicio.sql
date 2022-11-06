USE bdFuncionario

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