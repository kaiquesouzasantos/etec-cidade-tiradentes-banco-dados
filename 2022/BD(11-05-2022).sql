USE bdEscola
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exericicio 01
-- Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.​

CREATE VIEW vwPreco_Baixo AS 
	SELECT codCurso AS 'ID', nomeCurso AS 'CURSO', cargaHorariaCurso AS 'CARGA_HORARIA', valorCurso AS 'VALOR' FROM tbCurso 
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)
GO
SELECT * FROM vwPreco_Baixo

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 02
-- Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.​

SELECT [CURSO] FROM vwPreco_Baixo3 ORDER BY [CARGA_HORARIA] ASC

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicico 03
-- Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.​

CREATE VIEW vwAlunos_Turma AS
	SELECT nomeCurso AS 'CURSO', COUNT(tbMatricula.codMatricula) AS 'ALUNOS' FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
		INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma
		GROUP BY nomeCurso
GO
SELECT * FROM vwAlunos_Turma 

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 04
-- Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.​

SELECT * FROM vwAlunos_Turma WHERE [ALUNOS] = (
	SELECT MAX(tbMatricula.codMatricula) FROM tbMatricula
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
)

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 05
-- Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.​

CREATE VIEW vwTurma_Curso AS
	SELECT nomeCurso AS 'CURSO', COUNT(tbTurma.codTurma) AS 'TURMA' FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
		GROUP BY nomeCurso
GO
SELECT * FROM vwTurma_Curso

----------------------------------------------------------------------------------------------------------------------------------------------
-- Exercicio 06
-- Usando a visão “Turma_Curso exiba o curso com menor número de turmas.​

SELECT MIN([CURSO]) AS 'CURSO', MIN([TURMA]) AS 'TURMA' FROM vwTurma_Curso
