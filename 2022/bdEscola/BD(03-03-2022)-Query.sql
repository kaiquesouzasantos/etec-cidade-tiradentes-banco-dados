 USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
-- 01) Listar o nome, rg e data de aniversário dos alunos nascidos em SP
 
SELECT nomeAluno AS NOME,rgAluno AS RG,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE naturalidadeAluno = 'SP';

----------------------------------------------------------------------------------------------------------------------------------------------
-- 02) Listar o nome e o rg dos alunos com o nome começado com P
 
SELECT  nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE 'P%';

----------------------------------------------------------------------------------------------------------------------------------------------
-- 03) Listar o nome dos cursos cuja carga horária seja superior a 2000 horas

SELECT nomeCurso AS CURSO FROM tbCurso WHERE cargaHorariaCurso > 2000;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 04) Listar o nome e o rg de todos os alunos que possuem o sobrenome Silva

SELECT nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE '%Silva%';

----------------------------------------------------------------------------------------------------------------------------------------------
-- 05) Listar o nome dos alunos e a data de nascimento que fazem aniversário em março

SELECT nomeAluno AS NOME,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE MONTH(dataNascAluno) = 3;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 06) Listar o código dos alunos e a data de matrícula dos alunos matriculados em maio de qualquer ano

SELECT tbAluno.codAluno AS CODIGO, tbMatricula.dataMatricula AS DATA_MATRICULA FROM tbAluno, tbMatricula 
    WHERE tbAluno.codAluno = tbMatricula.codAluno AND MONTH(tbMatricula.dataMatricula) = 5;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 07) Listar o código dos alunos matriculados no curso de inglês

SELECT tbAluno.codAluno AS CODIGO FROM tbAluno, tbMatricula, tbTurma 
    WHERE tbMatricula.codAluno = tbAluno.codAluno 
        AND tbTurma.codTurma = tbMatricula.codTurma AND tbTurma.codCurso = 1;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 08) Listar o código dos alunos matriculados na turma 1AA

SELECT codAluno AS ID_ALUNO FROM tbMatricula WHERE codTurma = 3;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 09) Listar todos os dados de todos os alunos

SELECT * FROM tbAluno;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 10) Listar todos os dados de todas as turmas

SELECT * FROM tbTurma;
