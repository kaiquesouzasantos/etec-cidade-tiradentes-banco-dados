USE bdEscolaIdiomas

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 01
-- Criar uma consulta que retorne o nome e o pre�o dos cursos que custem abaixo do valor m�dio.

SELECT nomeCurso AS 'CURSO', valorCurso AS 'VALOR' FROM tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 02
-- Criar uma consulta que retorne o nome e o rg do aluno mais novo.

SELECT nomeAluno AS 'ALUNO', rgAluno AS 'RG' FROM tbAluno
WHERE dataNascAluno = (SELECT MAX(dataNascAluno) FROM tbAluno)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 03
-- Criar uma consulta que retorne o nome do aluno mais velho.

SELECT nomeAluno AS 'ALUNO' FROM tbAluno
WHERE dataNascAluno = (SELECT MIN(dataNascAluno) FROM tbAluno)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 04
-- Criar uma consulta que retorne o nome e o valor do curso mais caro.

SELECT nomeCurso AS 'CURSO', valorCurso AS 'VALOR' FROM tbCurso
WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 05
-- Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�cula.

-- com INNER JOIN:
SELECT nomeAluno AS 'ALUNO', nomeCurso AS 'CURSO' FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)

-- sem INNER JOIN:
SELECT nomeAluno AS 'ALUNO', nomeCurso AS 'CURSO' FROM tbAluno, tbMatricula, tbTurma, tbCurso
WHERE tbMatricula.codAluno = tbAluno.codAluno
	AND tbTurma.codTurma = tbMatricula.codTurma
	AND tbCurso.codCurso = tbTurma.codCurso
	AND dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 06
-- Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas.

-- com INNER JOIN:
SELECT nomeAluno AS 'ALUNO' FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
WHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)

-- sem INNER JOIN:
SELECT nomeAluno AS 'ALUNO' FROM tbAluno, tbMatricula
WHERE tbMatricula.codAluno = tbAluno.codAluno 
	AND dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 07
-- Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de ingl�s.

-- com INNER JOIN:
SELECT nomeAluno AS 'ALUNO', rgAluno AS 'RG', dataNascAluno AS 'NASCIMENTO' FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
WHERE nomeCurso IN (SELECT nomeCurso FROM tbCurso WHERE nomeCurso LIKE 'Ingl�s')

-- sem INNER JOIN:
SELECT nomeAluno AS 'ALUNO', rgAluno AS 'RG', dataNascAluno AS 'NASCIMENTO' FROM tbAluno, tbCurso, tbMatricula, tbTurma
WHERE tbMatricula.codAluno = tbAluno.codAluno 
	AND tbTurma.codTurma = tbMatricula.codTurma 
	AND tbCurso.codCurso = tbTurma.codCurso
	AND nomeCurso IN (SELECT nomeCurso FROM tbCurso WHERE nomeCurso LIKE 'Ingl�s')