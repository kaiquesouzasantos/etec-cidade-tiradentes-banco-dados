USE bdTransito

----------------------------------------------------------------------------------------------------------------------------------------------
-- 1) Criar 3 procedurespara inserir2 motoristas, 3 ve�culos e 5 multas;

CREATE PROCEDURE spInsere_Motorista
	@nomeMotorista VARCHAR(70), @dataNascMotorista DATE, 
	@cpfMotorista VARCHAR(14), @cnhMotorista VARCHAR(11)
	AS BEGIN
		IF EXISTS(SELECT cnhMotorista FROM tbMotorista WHERE cnhMotorista LIKE @cnhMotorista) BEGIN
			PRINT('MOTORISTA JA EXISTENTE!')
		END
		ELSE BEGIN
			INSERT INTO tbMotorista(nomeMotorista, dataNascMotorista, cpfMotorista, cnhMotorista, pontuacaoAcumulada) VALUES
				(@nomeMotorista, @dataNascMotorista, @cpfMotorista, @cnhMotorista, 0);
				
				PRINT('MOTORISTA CADASTRADO!')
		END
	END
GO

CREATE PROCEDURE spInsere_Veiculo
	@modeloVeiculo VARCHAR(40), @placa VARCHAR(8), @renavam VARCHAR(11)
	, @anoVeiculo INT, @codMotorista INT
	AS BEGIN
		IF EXISTS(SELECT renavam FROM tbVeiculo WHERE renavam LIKE @renavam) BEGIN
			PRINT('VEICULO JA EXISTENTE!')
		END
		ELSE BEGIN
			IF EXISTS(SELECT codMotorista FROM tbMotorista WHERE codMotorista = @codMotorista) BEGIN
				INSERT INTO tbVeiculo(modeloVeiculo, placa, renavam, anoVeiculo, codMotorista) VALUES
					(@modeloVeiculo, @placa, @renavam, @anoVeiculo, @codMotorista);

				PRINT('VEICULO CADASTRADO!')
			END
			ELSE BEGIN
				PRINT('MOTORISTA INEXISTENTE!')
			END
		END
	END
GO

CREATE PROCEDURE spInsere_Multa
	@dataMulta DATE, @horaMulta TIME, @pontosMulta INT, @codVeiculo INT
	AS BEGIN
		IF EXISTS(SELECT codVeiculo FROM tbVeiculo WHERE codVeiculo = @codVeiculo) BEGIN
			INSERT INTO tbMulta(dataMulta, horaMulta, pontosMulta, codVeiculo) VALUES
				(@dataMulta, @horaMulta, @pontosMulta, @codVeiculo);

			UPDATE tbMotorista SET pontuacaoAcumulada = pontuacaoAcumulada + @pontosMulta
				WHERE codMotorista = (
					SELECT tbMotorista.codMotorista FROM tbMotorista 
						INNER JOIN tbVeiculo ON tbVeiculo.codMotorista = tbMotorista.codMotorista
						WHERE tbVeiculo.codVeiculo = @codVeiculo
				);

			PRINT('MULTA CADASTRADA!')
		END
		ELSE BEGIN
			PRINT('ARGUMENTOS INVALIDOS!')
		END
	END
GO

-- EXEC'S

EXEC spInsere_Motorista 'Roger Mendes', '10-05-1989', '123.456.789-90', '548943264'
EXEC spInsere_Motorista 'Luiz Alcides', '08-10-1975', '748.546.895-14', '47784433'
EXEC spInsere_Motorista 'Maria Luiza Santos', '22-12-1970', '457.286.871-78', '457432841'

EXEC spInsere_Veiculo 'Civic', 'LWI-9189', '11753014217', 2022, 1
EXEC spInsere_Veiculo 'Triton L-200', 'KAC-2782', '14398314772', 2022, 2
EXEC spInsere_Veiculo 'F-150', 'MVT-1517', '69102479060', 2022, 3

EXEC spInsere_Multa '2022-08-10', '00:00:00', 10, 1
EXEC spInsere_Multa '2022-08-10', '00:00:00', 15, 1
EXEC spInsere_Multa '2022-08-10', '00:00:00', 10, 2
EXEC spInsere_Multa '2022-08-10', '00:00:00', 20, 2
EXEC spInsere_Multa '2022-08-10', '00:00:00', 10, 3
EXEC spInsere_Multa '2022-08-10', '00:00:00', 15, 3

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2) Criar uma stored procedure que ao ser colocada a placa do ve�culo apresente-se a quantidade de multas do ve�culo;

CREATE PROCEDURE spExibe_Multas
	@placa VARCHAR(8)
	AS BEGIN
		IF EXISTS(SELECT placa FROM tbVeiculo WHERE placa LIKE @placa) BEGIN
			SELECT COUNT(codMulta) AS 'TOTAL DE MULTAS' FROM tbMulta
				INNER JOIN tbVeiculo ON tbVeiculo.codVeiculo = tbMulta.codVeiculo
				WHERE placa LIKE @placa
		END
		ELSE BEGIN
			PRINT('VEICULO INEXISTENTE!')
		END
	END
GO
EXEC spExibe_Multas 'LWI-9189'

----------------------------------------------------------------------------------------------------------------------------------------------
-- 3) Criar uma procedure que receba o cpf do motorista e apresenta a sua pontua��o acumulada.

CREATE PROCEDURE spExibe_Pontuacao
	@cpfMotorista VARCHAR(14)
	AS BEGIN
		IF NOT EXISTS(SELECT cpfMotorista FROM tbMotorista WHERE cpfMotorista = @cpfMotorista) BEGIN
			PRINT('MOTORISTA INEXISTENTE!')
		END
		ELSE BEGIN
			SELECT pontuacaoAcumulada AS 'PONTOS ACUMULADOS' FROM tbMotorista WHERE cpfMotorista = @cpfMotorista
		END
	END
GO
EXEC spExibe_Pontuacao '123.456.789-90'
