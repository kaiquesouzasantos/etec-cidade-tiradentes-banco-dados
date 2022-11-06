CREATE DATABASE bdCurso
GO
USE bdCurso

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY NOT NULL
	,nomeAluno VARCHAR(30)
	,dataNascAluno DATE
	,rgAluno VARCHAR (15)
	,naturalAluno VARCHAR (30)
);

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY NOT NULL
	,nomeCurso VARCHAR(30)
	,cargaHoraCurso VARCHAR(8)
	,valorCurso VARCHAR(10)
);
GO

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY NOT NULL
	,nomeTurma VARCHAR (30)
	,horarioTurma TIME
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
);
GO

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY NOT NULL
	,dataMatricula DATE
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);
GO