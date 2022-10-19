USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
-- 1) Crie uma fun��o que informada uma data da matr�cula , retorne o dia da semana.

CREATE FUNCTION funcDiaSemana(@data DATE)
	RETURNS VARCHAR(15)
	AS BEGIN
		DECLARE @diaSemana VARCHAR(15)
		DECLARE @dia INT

		SET @dia = DATEPART(DW, @data);

		SET @diaSemana = 
			CASE @dia
				WHEN 1 THEN 'DOMINGO'
				WHEN 2 THEN 'SEGUNDA-FEIRA'
				WHEN 3 THEN 'TERCA-FEIRA'
				WHEN 4 THEN 'QUARTA-FEIRA'
				WHEN 5 THEN 'QUINTA-FEIRA'
				WHEN 6 THEN 'SEXTA-FEIRA'
				ELSE 'SABADO'
			END

		RETURN @diaSemana
	END

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2) Crie uma fun��o que de acordo com a carga hor�ria do curso exiba curso r�pido ou curso extenso. (R�pido menos de 1000 horas).

CREATE FUNCTION funcVelocidadeCurso(@cargaHoraria INT)
	RETURNS VARCHAR(15)
	AS BEGIN
		DECLARE @velocidadeCurso VARCHAR(15)
		
		IF (@cargaHoraria < 1000) BEGIN
			SET @velocidadeCurso = 'CURSO RAPIDO';
		END
		ELSE BEGIN
			SET @velocidadeCurso = 'CURSO EXTENSO';
		END

		RETURN @velocidadeCurso
	END

----------------------------------------------------------------------------------------------------------------------------------------------
-- 3) Crie uma fun��o que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400).

CREATE FUNCTION funcValorCurso(@valorCurso INT)
	RETURNS VARCHAR(15)
	AS BEGIN
		DECLARE @classificacaoCurso VARCHAR(15)
		
		IF (@valorCurso > 400) BEGIN
			SET @classificacaoCurso = 'CURSO CARO';
		END
		ELSE BEGIN
			SET @classificacaoCurso = 'CURSO BARATO';
		END

		RETURN @classificacaoCurso
	END

----------------------------------------------------------------------------------------------------------------------------------------------
-- 4) Criar uma fun��o que informada a data da matr�cula converta-a no formato dd/mm/aaaa.

CREATE FUNCTION funcFormataData(@dataMatricula DATE)
	RETURNS VARCHAR(10)
	AS BEGIN
		DECLARE @dataFormatada VARCHAR(10)
		SET @dataFormatada = 
			CAST(DATEPART(DAY, @dataMatricula) AS VARCHAR(2)) + '/' + 
			CAST(DATEPART(MONTH, @dataMatricula) AS VARCHAR(2)) + '/' + 
			CAST(DATEPART(YEAR, @dataMatricula) AS VARCHAR(4))
		RETURN @dataFormatada
	END

SELECT mina = dbo.funcFormataData('2022-10-19')