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
-- 3) Criar uma função que usando o bdEstoque diga se o cpf do cliente é ou não válido.