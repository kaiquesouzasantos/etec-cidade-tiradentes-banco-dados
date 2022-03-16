USE bdEscolaIdiomas
GO

 -- Exercicio 01 
 -- Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
 SELECT nomeAluno AS ALUNO, nomeCurso AS CURSO FROM tbAluno 
 INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
 INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
 INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso

 -- Exercicio 02
 -- Apresentar a quantidade de alunos matriculados por nome do curso;
 SELECT nomeCurso AS CURSO, COUNT(tbAluno.codAluno) AS QTD_MATRICULADOS FROM tbCurso
 INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
 INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma
 INNER JOIN tbAluno ON tbAluno.codAluno = tbMatricula.codAluno
 GROUP BY nomeCurso

-- Exercicio 03
-- Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT DISTINCT nomeTurma AS TURMA, COUNT(tbAluno.nomeAluno) AS QTD_ALUNOS FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
GROUP BY nomeTurma

-- Exercicio 04
-- Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
SELECT COUNT(tbAluno.codAluno) AS QTD_ALUNOS FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
WHERE MONTH(tbMatricula.dataMatricula) = 05 AND YEAR(tbMatricula.dataMatricula) = 2016

-- Exercicio 05
-- Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas em que estão matriculados
 SELECT nomeAluno AS ALUNO, nomeTurma AS TURMA FROM tbAluno 
 INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
 INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
 ORDER BY nomeAluno ASC

-- Exercicio 06
-- Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT nomeCurso AS CURSO, horarioTurma AS HORARIO FROM tbCurso
INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso

-- Exercicio 07
-- Apresentar a quantidade de alunos nascidos por estado
SELECT naturalidadeAluno AS ESTADO, COUNT(tbAluno.codAluno) AS QTD_ALUNOS FROM tbAluno
GROUP BY naturalidadeAluno

-- Exercicio 08
-- Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno AS ALUNO, CONVERT(VARCHAR, dataMatricula,103) AS DATA_MATRICULA FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno

-- Exercicio 09
-- Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de Ingles
SELECT nomeAluno AS ALUNO FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno =  tbAluno.codAluno
INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
WHERE nomeAluno LIKE 'A%' AND nomeCurso LIKE 'Ingles'

-- Exercicio 10
-- Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(tbMatricula.codMatricula) AS QTD_MATRICULAS FROM tbMatricula 
WHERE YEAR(tbMatricula.dataMatricula) = 2016
