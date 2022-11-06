CREATE DATABASE bdClinica
GO
USE bdClinica

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tbPaciente(
	codPaciente INT NOT NULL PRIMARY KEY
	,nomPaciente VARCHAR(30)
	,convenioPaciente VARCHAR (30) 
	,rgPaciente VARCHAR (30)
);

CREATE TABLE tbMedico(
	codMedico INT NOT NULL PRIMARY KEY
	,nomeMedico VARCHAR (30)
	,crmMedico VARCHAR (30)
	,rgMedico VARCHAR (30)
);
GO

CREATE TABLE tbTelefone(
	codTelefone INT NOT NULL PRIMARY KEY 
	,numeroTelefone VARCHAR (30)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbEndereco(
	codEndereco INT NOT NULL PRIMARY KEY
	,logradouroEndereco VARCHAR(60)
	,numeroEndereco VARCHAR (30)
	,cepEndereco VARCHAR (30)
	,bairroEndereco VARCHAR (30)
	,cidedeEndereco VARCHAR (30)
	,estadoEndereco VARCHAR (30)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbConsulta(
	codConsulta INT NOT NULL PRIMARY KEY
	,dataConsulta DATE 
	,horaConsulta TIME
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
	,codMedico INT FOREIGN KEY REFERENCES tbMedico(codMedico)
);
GO