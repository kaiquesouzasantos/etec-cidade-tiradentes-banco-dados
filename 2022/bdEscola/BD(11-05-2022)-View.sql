USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
-- 01) Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.​

CREATE VIEW vwPreco_Baixo AS 
	SELECT codCurso AS 'ID', nomeCurso AS 'CURSO', cargaHorariaCurso AS 'CARGA_HORARIA', valorCurso AS 'VALOR' FROM tbCurso 
		WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)
GO
SELECT * FROM vwPreco_Baixo

----------------------------------------------------------------------------------------------------------------------------------------------
-- 02) Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.​

SELECT [CURSO] FROM vwPreco_Baixo ORDER BY [CARGA_HORARIA] ASC

----------------------------------------------------------------------------------------------------------------------------------------------
-- 03) Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.​

CREATE VIEW vwAlunos_Turma AS
	SELECT nomeCurso AS 'CURSO', COUNT(tbMatricula.codMatricula) AS 'ALUNOS' FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
		INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma
		GROUP BY nomeCurso
GO
SELECT * FROM vwAlunos_Turma 

-- solucao alternativa:
CREATE VIEW vwAlunos_Turma_Alternativa AS
	SELECT nomeTurma AS 'TURMA', COUNT(tbMatricula.codMatricula) AS 'ALUNOS' FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
		INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma
		GROUP BY nomeTurma
GO
SELECT * FROM vwAlunos_Turma_Alternativa 

----------------------------------------------------------------------------------------------------------------------------------------------
-- 04) Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.​

SELECT * FROM vwAlunos_Turma WHERE [ALUNOS] = (SELECT MAX([ALUNOS]) FROM vwAlunos_Turma)

-- solucao altenativa correspondente:
SELECT * FROM vwAlunos_Turma_Alternativa WHERE [ALUNOS] = (SELECT MAX([ALUNOS]) FROM vwAlunos_Turma_Alternativa)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 05) Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.​

CREATE VIEW vwTurma_Curso AS
	SELECT nomeCurso AS 'CURSO', COUNT(tbTurma.codTurma) AS 'TURMA' FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
		GROUP BY nomeCurso
GO
SELECT * FROM vwTurma_Curso

----------------------------------------------------------------------------------------------------------------------------------------------
-- 06) Usando a visão “Turma_Curso exiba o curso com menor número de turmas.​

SELECT * FROM vwTurma_Curso WHERE [TURMA] = (SELECT MIN([TURMA]) FROM vwTurma_Curso)
