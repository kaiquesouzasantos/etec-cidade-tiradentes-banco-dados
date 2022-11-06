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