USE bdBanco

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2-A) Ao ser feito um depósito atualize o saldo da conta corrente somando a quantia depositada

CREATE TRIGGER tgAtualizaSaldo
	ON tbDeposito AFTER INSERT
	AS BEGIN
		DECLACRE @valorDeposito MONEY

		SET @valorDeposito = (SELECT valorDeposito FROM INSERTED);

		UPDATE tbContaCorrente SET saldoConta = saldoConta + @valorDeposito
			WHERE numConta = (
				SELECT numConta FROM INSERTED
			);
	END
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2-B) Ao ser feito um depósito atualize o saldo da conta corrente somando a quantia depositada.

CREATE TRIGGER tgAtualizaSaldo
	ON tbSaque AFTER INSERT
	AS BEGIN
		DECLACRE  @numConta INT, @valorSaque MONEY, @valorDisponivel MONEY

		SET @numConta = (SELECT numConta FROM INSERTED);
		SET @valorSaque = (SELECT valorSaque FROM INSERTED);
		SET @valorDisponivel = (
				SELECT saldoConta FROM tbContaCorrente WHERE numConta = @numConta
			);

		IF(@valorDisponivel >= @valorSaque) BEGIN
			UPDATE tbContaCorrente SET saldoConta = saldoConta - @valorSaque
				WHERE numConta = @numConta		
		END
		ELSE BEGIN
			PRINT('VALOR INDISPONIVEL');
		END
	END
GO