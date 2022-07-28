CREATE DATABASE bdAvaliacao
GO
USE bdAvaliacao

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY NOT NULL
	,nomeFornecedor VARCHAR(60)
	,contatoFornecedor VARCHAR(60)
);

CREATE TABLE tbFuncionario(
	codFuncionario INT PRIMARY KEY NOT NULL
	,nomeFuncionario VARCHAR(60)
	,cpfFuncionario VARCHAR(14)
	,dataNascFuncionario DATE
	,ruaFuncionario VARCHAR(60)
	,numeroFuncionario INT
	,bairroFuncionario VARCHAR(60)
	,cidadeFuncionario VARCHAR(60)
);
GO

CREATE TABLE tbSorvetes(
	codSorvete INT PRIMARY KEY NOT NULL
	,nomeSorvete VARCHAR(60)
	,valorSorvete MONEY
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);

CREATE TABLE tbOrdemdeServico(
	codOS INT PRIMARY KEY NOT NULL
	,observacaoOS VARCHAR (100)
	,codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);
GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S

INSERT INTO tbFornecedor
VALUES 
	(1,'Kibon','Bruna Rubia'),
	(2,'Nestle','Carlos Drummond'),
	(3,'Jundiá','Fernenda Ribeiro');
GO

INSERT INTO	tbSorvetes
VALUES
	(1,'Cremosíssimo','10.00',1),
	(2,'Galak','20.00',2),
	(3,'Grego','15.50',3);
GO

INSERT INTO tbFuncionario(codFuncionario,nomeFuncionario,cpfFuncionario,ruaFuncionario,numeroFuncionario,dataNascFuncionario)
VALUES
	(1,'Stev Jobs','123.456.789.10','California',2000,'1970-04-10'),
	(2,'Maria Rosa','','São Paulo',130,'1981-05-11');
GO

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