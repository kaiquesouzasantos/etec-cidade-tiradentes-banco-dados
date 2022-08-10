USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
 -- 1) Criar uma stored procedure �Busca_Aluno� que receba o c�digo do aluno e retorne seu nome e data de nascimento.

CREATE PROCEDURE spBusca_ALuno
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

CREATE PROCEDURE sp_Insere_Aluno
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
EXEC sp_Insere_Aluno 'Kaique', '03-01-2022', '15.552.478-90', 'Brasil', '669.942.230-86'

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
		IF EXISTS(SELECT nomeTurma FROM tbTurma WHERE nomeTurma = @nomeTurma) BEGIN
			SELECT tbAluno.nomeAluno FROM tbAluno, tbMatricula, tbTurma 
				WHERE tbMatricula.codAluno = tbAluno.codAluno 
					AND tbTurma.codTurma = tbMatricula.codTurma AND tbTurma.nomeTurma = @nomeTurma;
		END
		ELSE BEGIN
			PRINT('DADO INEXISTENTE!')
		END
	END
GO
EXEC spExibe_AlunosTurma '1AA'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 6) 6-Criar uma storedprocedure para inserir alunos, verificando pelo cpfse o aluno existe ou não, e informar essa condição via mensagem;

CREATE PROCEDURE sp_Insere_AlunoCPF
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

EXEC sp_Insere_AlunoCPF 'Kaique', '03-01-2022', '15.552.478-90', 'Brasil', '664.942.230-86'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 7) Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido.

CREATE PROCEDURE sp_InsereMatricula3
	@nomeCurso VARCHAR(50), @nomeAluno VARCHAR(50)
	AS BEGIN
		IF EXISTS(SELECT nomeCurso FROM tbCurso WHERE nomeCurso = @nomeCurso) BEGIN
			IF EXISTS(SELECT nomeAluno FROM tbAluno WHERE nomeAluno = @nomeAluno) BEGIN
				DECLARE @codTurma INT
				DECLARE @codAluno INT

				SET @codTurma = (
					SELECT MAX(codTurma) FROM tbTurma
						INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
						WHERE nomeCurso LIKE @nomeCurso
				);

				SET @codAluno = (
					SELECT codAluno FROM tbAluno WHERE nomeAluno LIKE @nomeAluno
				);

				INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES
					(GETDATE(), @codAluno, @codTurma)
			END
		END
		ELSE BEGIN
			PRINT('PARAMETROS INVALIDOS!')
		END
	END
GO
EXEC sp_InsereMatricula3 'Inglês', 'Kaique'
