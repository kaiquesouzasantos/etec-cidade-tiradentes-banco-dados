USE bdDespesas

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROPOSTA DE EXERCICIO
/*
    – Crie a tabela de dados ao lado;
    – Em seguida, crie uma procedure que traga a somatória dos valores gastos por uma categoria;
    – Crie um tratamento de erros com try cath para acumular os erros que ocorreram ao longo do tempo em uma tabela
        de erros, essa tabela deve guardar – número do erro, sua severidade, mensagem do erro.
    – Crie 10 erros diferentes para testar o funcionamento do registro dos erros.
*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROCEDURE --

CREATE PROCEDURE pdExibeSomaGastos(@categoria VARCHAR(50))
    AS BEGIN
        SELECT 'R$ ' + CAST(SUM(valor) AS VARCHAR) AS 'Soma dos Gastos' FROM tbDespesas 
            WHERE categoria LIKE @categoria
    END

CREATE PROCEDURE pdSomaGastos(@categoria VARCHAR(50))
    AS BEGIN
        BEGIN TRY
            EXEC pdExibeSomaGastos(@categoria)
        END TRY
        BEGIN CATCH
            INSERT INTO tbErros
		        VALUES (ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_MESSAGE())
            SELECT * FROM tbErros
        END CATCH
    END

EXEC pdSomaGastos('Transporte')