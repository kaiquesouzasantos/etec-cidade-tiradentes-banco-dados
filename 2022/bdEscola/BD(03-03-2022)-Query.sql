 USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 01 
 
SELECT nomeAluno AS NOME,rgAluno AS RG,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE naturalidadeAluno = 'SP';

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 02
 
SELECT  nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE 'P%';

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 03

SELECT nomeCurso AS CURSO FROM tbCurso WHERE cargaHorariaCurso > 2000;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 04

SELECT nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE '%Silva%';

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 05

SELECT nomeAluno AS NOME,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE MONTH(dataNascAluno) = 3;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 06

SELECT tbAluno.codAluno AS CODIGO, tbMatricula.dataMatricula AS DATA_MATRICULA FROM tbAluno, tbMatricula 
    WHERE tbAluno.codAluno = tbMatricula.codAluno AND MONTH(tbMatricula.dataMatricula) = 5;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 07

SELECT tbAluno.codAluno AS CODIGO FROM tbAluno, tbMatricula, tbTurma 
    WHERE tbMatricula.codAluno = tbAluno.codAluno 
        AND tbTurma.codTurma = tbMatricula.codTurma AND tbTurma.codCurso = 1;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 08

SELECT codAluno AS ID_ALUNO FROM tbMatricula WHERE codTurma = 3;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 09

SELECT * FROM tbAluno;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 10

SELECT * FROM tbTurma;