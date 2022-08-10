 CREATE DATABASE bdEscola
 GO 
 USE bdEscola

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S --

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50) NOT NULL
	,dataNascAluno SMALLDATETIME NOT NULL
	,rgAluno VARCHAR(15) NOT NULL
	,cpfAluno VARCHAR(15) NOT NULL
	,naturalidadeAluno VARCHAR(30) NOT NULL
);

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso MONEY NOT NULL
);
GO

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma VARCHAR(30) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,horarioTurma TIME NOT NULL
);
GO

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula SMALLDATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);
GO

----------------------------------------------------------------------------------------------------------------------------------------------
 -- INSERT'S --
 
INSERT INTO tbCurso(nomeCurso,cargaHorariaCurso,valorCurso) VALUES
	('Inglês',2000,'356.00')
	,('Alemão',3000,'478.00');
GO

INSERT INTO tbAluno(nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno, cpfAluno) VALUES
	('Paulo Santos', '2000-10-03 00:00:00', '82.292.122-0', 'SP', '417.217.790-51')
	,('Maria da Gloria', '1999-03-10 00:00:00', '45.233.123-0', 'SP', '803.682.750-60')
	,('Perla Nogueira Silva', '1998-04-04 00:00:00', '23.533.211-9', 'SP', '633.482.290-06')
	,('Gilson Barros Silva', '1995-09-09 00:00:00', '34.221.111-x', 'PE', '824.162.010-18')
	,('Mariana Barbosa Santos', '2001-10-10 00:00:00', '54.222.122-9', 'RJ', '669.942.230-86');
GO

INSERT INTO tbTurma(nomeTurma, codCurso, horarioTurma) VALUES
	('1|A', 1, '1900-01-01 12:00:00')
	,('1|B', 1, '1900-01-01 18:00:00')
	,('1AA', 2, '1900-01-01 19:00:00');
GO

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES
	('2015-03-10 00:00:00',1,1)
	,('2014-04-05 00:00:00',2,1)
	,('2012-03-05 00:00:00',3,2)
	,('2016-03-03 00:00:00',1,3)
	,('2015-07-05 00:00:00',4,2)
	,('2015-05-07 00:00:00',4,3)
	,('2015-06-06 00:00:00',5,1)
	,('2015-05-05 00:00:00',5,3);
GO
