USE bdTransito

----------------------------------------------------------------------------------------------------------------------------------------------
/* 1) 
	Criar umtrigger que ao ve�culo tomar uma multa os pontosda multa sejam  atualizados na tabela do motorista no campo pontuacaoAcumulada. 
	Caso o motorista alcance 20 pontos informar via mensagem que o mesmo poder� ter sua habilita��o suspensa.
*/

CREATE TRIGGER tgAdicionaPontuacao 
	ON tbMulta AFTER INSERT 
	AS BEGIN
		DECLARE @pontosMulta INT, @codVeiculo INT, @codMotorista INT, @pontosAcumulados INT

		SET @codVeiculo = (SELECT codVeiculo FROM INSERTED);
		SET @pontosMulta = (SELECT pontosMulta FROM INSERTED);

		SET @codMotorista = (
			SELECT tbMotorista.codMotorista FROM tbMotorista 
					INNER JOIN tbVeiculo ON tbVeiculo.codMotorista = tbMotorista.codMotorista
					WHERE tbVeiculo.codVeiculo = @codVeiculo
			);

		SET @pontosAcumulados = (
			SELECT pontuacaoAcumulada FROM tbMotorista 
				WHERE codMotorista = @codMotorista
			);

		UPDATE tbMotorista SET pontuacaoAcumulada = pontuacaoAcumulada + @pontosMulta
				WHERE codMotorista = @codMotorista

		IF (@pontosAcumulados + @pontosMulta) >= 20 BEGIN
			PRINT('HABILITA��O PODERA SER SUSPENSA POR PONTUA��O LIMITE EXCEDIDA!')
		END
	END
GO
