USE bdEstoque

----------------------------------------------------------------------------------------------------------------------------------------------
-- 1) Criar uma função que retorne o dia de semana da venda (no formato segunda, terça, etc) ao lado do código da venda, valor total da venda e sua data.

CREATE FUNCTION funcDiaSemanaCodValor(@codVenda INT)
	RETURNS VARCHAR(120)
	AS BEGIN
		DECLARE @informacoesVenda VARCHAR(120)
		
		IF NOT EXISTS(SELECT codVenda FROM tbVenda WHERE codVenda = @codVenda) BEGIN
			SET @informacoesVenda = 'VENDA NAO ENCONTRADA';
		END
		ELSE BEGIN
			DECLARE @data DATE, @dataFormatada VARCHAR(10), @diaSemana VARCHAR(15), @valorVenda MONEY

			SET @data = (
				SELECT dataVenda FROM tbVenda WHERE codVenda = @codVenda
			);
			SET @valorVenda = (
				SELECT valorTotalVenda FROM tbVenda WHERE codVenda = @codVenda
			);
			SET @dataFormatada = dbo.funcFormataData(@data);
			SET @diaSemana = dbo.funcDiaSemana(@data);

			SET @informacoesVenda = 
				@diaSemana + ' | ' + 
				CAST(@codVenda AS VARCHAR(10)) + ' | R$' + 
				CAST(@valorVenda AS VARCHAR(10)) + ' | ' +
				@dataFormatada
		END

		RETURN @informacoesVenda
	END

CREATE FUNCTION funcFormataData(@data DATE)
	RETURNS VARCHAR(10)
	AS BEGIN
		DECLARE @dataFormatada VARCHAR(10)
		SET @dataFormatada = 
			CAST(DATEPART(DAY, @data) AS VARCHAR(2)) + '/' + 
			CAST(DATEPART(MONTH, @data) AS VARCHAR(2)) + '/' + 
			CAST(DATEPART(YEAR, @data) AS VARCHAR(4))
		RETURN @dataFormatada
	END

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
-- 2) Criar uma função que receba o código do cliente e retorne o total de vendas que o cliente já realizou.

CREATE FUNCTION funcVendasCliente(@codCliente INT)
	RETURNS INT
	AS BEGIN
		DECLARE @vendasCliente INT
		
		IF NOT EXISTS(SELECT codCliente FROM tbCliente WHERE codCliente = @codCliente) BEGIN
			SET @vendasCliente = 'CLIENTE NAO ENCONTRADO';
		END
		ELSE BEGIN
			SET @vendasCliente = (SELECT COUNT(codCliente) FROM tbVenda WHERE codCliente = @codCliente);
		END

		RETURN @vendasCliente;
	END

----------------------------------------------------------------------------------------------------------------------------------------------
-- 3) Criar uma função que receba o código de um vendedor(cliente) e o mês e informe o total de vendas no mês informado

CREATE FUNCTION funcVendasMes(@codCliente INT, @mes INT)
	RETURNS MONEY
	AS BEGIN
		DECLARE @totalVendas MONEY

		IF NOT EXISTS(SELECT codCliente FROM tbCliente WHERE codCliente = @codCliente) BEGIN
			SET @totalVendas = '0';
		END
		ELSE BEGIN
			SET @totalVendas = (
					SELECT SUM(valorTotalVenda) FROM tbVenda
						WHERE 
							codCliente = @codCliente AND
							DATEPART(MONTH, dataVenda) = @mes
				);

			IF(@totalVendas IS NULL) BEGIN
				SET @totalVendas = '0';
			END
		END

		RETURN @totalVendas;
	END
	
----------------------------------------------------------------------------------------------------------------------------------------------
-- 4) Criar uma função que usando o bdEstoque diga se o cpf do cliente é ou não válido.

CREATE FUNCTION funcValidaCPF(@Nr_Documento VARCHAR(11))
	RETURNS VARCHAR(10)
	AS BEGIN
		DECLARE
			@Contador_1 INT,
			@Contador_2 INT,
			@Digito_1 INT,
			@Digito_2 INT,
			@Nr_Documento_Aux VARCHAR(11),
			@Resposta VARCHAR(10)

		-- Remove espaços em branco
		SET @Nr_Documento_Aux = LTRIM(RTRIM(@Nr_Documento))
		SET @Digito_1 = 0

		-- Remove os números que funcionam como validação para CPF, pois eles "passam" pela regra de validação
		IF (@Nr_Documento_Aux IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999', '12345678909'))
			RETURN 0

		-- Verifica se possui apenas 11 caracteres
		IF (LEN(@Nr_Documento_Aux) <> 11) BEGIN
			SET @Resposta = 'INVALIDO'
		END
		ELSE BEGIN
			-- Cálculo do segundo dígito
			SET @Nr_Documento_Aux = SUBSTRING(@Nr_Documento_Aux, 1, 9)
			SET @Contador_1 = 2

			WHILE (@Contador_1 < = 10) BEGIN 
				SET @Digito_1 = @Digito_1 + (@Contador_1 * CAST(SUBSTRING(@Nr_Documento_Aux, 11 - @Contador_1, 1) as int))
				SET @Contador_1 = @Contador_1 + 1
			END 

			SET @Digito_1 = @Digito_1 - (@Digito_1/11)*11

			IF (@Digito_1 <= 1) BEGIN
				SET @Digito_1 = 0
			END
			ELSE BEGIN 
				SET @Digito_1 = 11 - @Digito_1
			END

			SET @Nr_Documento_Aux = @Nr_Documento_Aux + CAST(@Digito_1 AS VARCHAR(1))

			IF (@Nr_Documento_Aux <> SUBSTRING(@Nr_Documento, 1, 10)) BEGIN
				SET @Resposta = 'INVALIDO'
			END
			ELSE BEGIN 
				-- Cálculo do segundo dígito
				SET @Digito_2 = 0
				SET @Contador_2 = 2

				WHILE (@Contador_2 < = 11) BEGIN 
					SET @Digito_2 = @Digito_2 + (@Contador_2 * CAST(SUBSTRING(@Nr_Documento_Aux, 12 - @Contador_2, 1) AS INT))
					SET @Contador_2 = @Contador_2 + 1
				END 

				SET @Digito_2 = @Digito_2 - (@Digito_2/11)*11

				IF (@Digito_2 < 2) BEGIN
					SET @Digito_2 = 0
				END
				ELSE BEGIN
					SET @Digito_2 = 11 - @Digito_2
				END

				SET @Nr_Documento_Aux = @Nr_Documento_Aux + CAST(@Digito_2 AS VARCHAR(1))

				IF (@Nr_Documento_Aux <> @Nr_Documento) BEGIN
					SET @Resposta = 'INVALIDO'
				END
				ELSE BEGIN 
					SET @Resposta = 'VALIDO'
				END
			END
		END 
    
		RETURN @Resposta
	END
