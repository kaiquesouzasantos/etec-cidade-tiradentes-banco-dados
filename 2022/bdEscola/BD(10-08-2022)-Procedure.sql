USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
 -- 1) Criar uma stored procedure �Busca_Aluno� que receba o c�digo do aluno e retorne seu nome e data de nascimento.

CREATE PROCEDURE spBusca_Aluno
	@codALuno INT
	AS BEGIN
		IF EXISTS(SELECT codAluno FROM tbAluno WHERE codAluno = @codALuno) BEGIN
			SELECT nomeAluno AS 'NOME', dataNascAluno AS 'NASCIMENTO' FROM tbAluno 
				WHERE codAluno = @codALuno
		END
		ELSE BEGIN
			PRINT('DADO INEXISTENTE!')
		END
	END
GO
EXEC spBusca_ALuno 2

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2) Criar uma stored procedure Insere_Aluno que insira um registro na tabela de Alunos.

CREATE PROCEDURE spInsere_AlunoRG
	@nomeAluno VARCHAR(50), @dataNascAluno SMALLDATETIME
	,@rgAluno VARCHAR(15), @naturalidade VARCHAR(30), @cpf VARCHAR(15)
	AS BEGIN
		IF EXISTS(SELECT rgAluno FROM tbAluno WHERE rgAluno LIKE @rgAluno) BEGIN 
			PRINT('DADO JA EXISTENTE!')
		END
		ELSE BEGIN
			INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno, cpfAluno)
				VALUES 
					(@nomeAluno, @dataNascAluno, @rgAluno, @naturalidade, @cpf)
			PRINT('CADASTRO EFETUADO COM SUCESSO')
		END
	END
GO
EXEC spInsere_AlunoRG 'Danone', '03-01-2022', '15.552.478-95', 'Brasil', '619.972.250-21'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 3) Criar uma stored procedure Aumenta_Preco que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada.

CREATE PROCEDURE spAumenta_Preco
	@nomeCurso VARCHAR(50), @percentual DECIMAL
	AS BEGIN
		IF EXISTS(SELECT nomeCurso FROM tbCurso WHERE nomeCurso = @nomeCurso) BEGIN
			UPDATE tbCurso SET valorCurso = valorCurso + valorCurso*@percentual/100 WHERE nomeCurso = @nomeCurso
			PRINT('PRECO ATUALIZADO!')
		END
		ELSE BEGIN
			PRINT('DADO INEXISTENTE!')
		END
	END
GO
EXEC spAumenta_Preco 'Ingles', 25

----------------------------------------------------------------------------------------------------------------------------------------------
-- 4) Criar uma stored procedure �Exibe_Turma� que, dado o nome da turma exiba todas as informa��es dela.

CREATE PROCEDURE spExibe_Turma 
	@nomeTurma VARCHAR(30)
	AS BEGIN
		IF EXISTS(SELECT nomeTurma FROM tbTurma WHERE nomeTurma = @nomeTurma) BEGIN
			SELECT * FROM tbTurma WHERE nomeTurma = @nomeTurma
		END
		ELSE BEGIN
			PRINT('DADO INEXISTENTE!')
		END
	END
GO
EXEC spExibe_Turma '1AA'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 5) Criar uma stored procedure Exibe_AlunosdaTurma que, dado o nome da turma exiba os seus alunos.

CREATE PROCEDURE spExibe_AlunosTurma
	@nomeTurma VARCHAR(30)
	AS BEGIN
		IF EXISTS(SELECT nomeTurma AS 'ALUNO' FROM tbTurma WHERE nomeTurma = @nomeTurma) BEGIN
			SELECT tbAluno.nomeAluno FROM tbAluno
				INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
				INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
				WHERE tbTurma.nomeTurma = @nomeTurma;
		END
		ELSE BEGIN
			PRINT('DADO INEXISTENTE!')
		END
	END
GO
EXEC spExibe_AlunosTurma '1AA'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 6) 6-Criar uma storedprocedure para inserir alunos, verificando pelo cpfse o aluno existe ou não, e informar essa condição via mensagem;

CREATE PROCEDURE spInsere_AlunoCPF
	@nomeAluno VARCHAR(50), @dataNascAluno SMALLDATETIME
	,@rgAluno VARCHAR(15), @naturalidade VARCHAR(30), @cpf VARCHAR(15)
	AS BEGIN
		IF EXISTS(SELECT cpfAluno FROM tbAluno WHERE cpfAluno LIKE @cpf) BEGIN 
			PRINT('DADO JA EXISTENTE!')
		END
		ELSE BEGIN
			INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno, cpfAluno)
				VALUES 
					(@nomeAluno, @dataNascAluno, @rgAluno, @naturalidade, @cpf)
			PRINT('CADASTRO EFETUADO COM SUCESSO')
		END
	END
GO
EXEC spInsere_AlunoCPF 'Thay', '03-01-2022', '15.552.478-90', 'Brasil', '664.942.230-86'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 7) Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido.
CREATE PROCEDURE spInsere_Matricula
	@nomeCurso VARCHAR(50), @nomeAluno VARCHAR(50)
	AS BEGIN
		DECLARE @codTurma INT
		DECLARE @codAluno INT				
		DECLARE @nomeTurma VARCHAR(15)

		SET @codTurma = (
			SELECT MAX(codTurma) FROM tbTurma
				INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
				WHERE nomeCurso LIKE @nomeCurso
		);

		SET @codAluno = (
			SELECT codAluno FROM tbAluno WHERE nomeAluno LIKE @nomeAluno
		);

		IF EXISTS(
			SELECT nomeAluno, nomeCurso FROM tbAluno, tbCurso
				WHERE nomeAluno LIKE @nomeAluno 
					AND nomeCurso LIKE @nomeCurso 
		) AND NOT EXISTS(
			SELECT codAluno FROM tbMatricula WHERE codAluno = @codAluno
		) BEGIN
			INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES
				(GETDATE(), @codAluno, @codTurma)

			SET @nomeTurma = (SELECT nomeTurma FROM tbTurma WHERE codTurma = @codTurma)

			PRINT('ALUNO MATRICULADO COM SUCESSO NA TURMA '+@nomeTurma)
		END
		ELSE BEGIN
			PRINT('ARGUMENTOS INVALIDOS!')
		END
	END
GO
EXEC spInsere_Matricula 'Alemão', 'Danone'
