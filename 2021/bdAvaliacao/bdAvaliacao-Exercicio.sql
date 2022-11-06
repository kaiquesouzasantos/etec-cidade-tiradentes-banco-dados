USE bdAvaliacao

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROPOSTA DE EXERCICIO

UPDATE tbFuncionario SET nomeFuncionario = 'Thayani Pereira',dataNascFuncionario = '1990-12-16' WHERE codFuncionario = 1;
UPDATE tbFuncionario SET nomeFuncionario = 'Junior Santos',dataNascFuncionario = '1982-05-11' WHERE codFuncionario = 2;

CREATE PROCEDURE procTabelas
AS BEGIN
	SELECT * FROM tbFornecedor
	SELECT * FROM tbSorvetes
	SELECT * FROM tbFuncionario
	SELECT * FROM tbOrdemdeServico
END
EXEC procTabelas