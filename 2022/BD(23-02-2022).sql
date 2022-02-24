 CREATE DATABASE bdEscola
 GO 
 USE bdEscola

-- CREATE'S --
CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50) NOT NULL
	,dataNascAluno SMALLDATETIME NOT NULL
	,rgAluno VARCHAR(15) NOT NULL
	,naturalidadeAluno VARCHAR(30) NOT NULL
);

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso MONEY NOT NULL
);

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma VARCHAR(30) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,horarioTurma TIME NOT NULL
);

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula SMALLDATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);

 -- INSERT'S --
INSERT INTO tbCurso(nomeCurso,cargaHorariaCurso,valorCurso) VALUES
	('Inglês',2000,'356.00')
	,('Alemão',3000,'478.00');

INSERT INTO tbAluno(nomeAluno,dataNascAluno,rgAluno,naturalidadeAluno) VALUES
	('Paulo Santos', '2000-10-03 00:00:00', '82.292.122-0', 'SP')
	,('Maria da Gloria', '1999-03-10 00:00:00', '45.233.123-0', 'SP')
	,('Perla Nogueira Silva', '1998-04-04 00:00:00', '23.533.211-9', 'SP')
	,('Gilson Barros Silva', '1995-09-09 00:00:00', '34.221.111-x', 'PE')
	,('Mariana Barbosa Santos', '2001-10-10 00:00:00', '54.222.122-9', 'RJ');

INSERT INTO tbTurma(nomeTurma, codCurso, horarioTurma) VALUES
	('1|A', 1, '1900-01-01 12:00:00')
	,('1|B', 1, '1900-01-01 18:00:00')
	,('1AA', 2, '1900-01-01 19:00:00');

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES
	('2015-03-10 00:00:00',1,1)
	,('2014-04-05 00:00:00',2,1)
	,('2012-03-05 00:00:00',3,2)
	,('2016-03-03 00:00:00',1,3)
	,('2015-07-05 00:00:00',4,2)
	,('2015-05-07 00:00:00',4,3)
	,('2015-06-06 00:00:00',5,1)
	,('2015-05-05 00:00:00',5,3);

 -- Exercicio 01 
SELECT nomeAluno AS NOME,rgAluno AS RG,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE naturalidadeAluno = 'SP';

 -- Exercicio 02
SELECT  nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE 'P%';

-- Exercicio 03
SELECT nomeCurso AS CURSO FROM tbCurso WHERE cargaHorariaCurso > 2000;

-- Exercicio 04
SELECT nomeAluno AS NOME,rgAluno AS RG FROM tbAluno WHERE nomeAluno LIKE '%Silva%';

-- Exercicio 05
SELECT nomeAluno AS NOME,dataNascAluno AS NASCIMENTO FROM tbAluno WHERE MONTH(dataNascAluno) = 3;

-- Exercicio 06
SELECT tbAluno.codAluno AS CODIGO, tbMatricula.dataMatricula AS DATA_MATRICULA FROM tbAluno, tbMatricula WHERE tbAluno.codAluno = tbMatricula.codAluno AND MONTH(tbMatricula.dataMatricula) = 5;

-- Exercicio 07
SELECT tbAluno.codAluno AS CODIGO FROM tbAluno, tbMatricula, tbTurma 
WHERE tbMatricula.codAluno = tbAluno.codAluno AND tbTurma.codTurma = tbMatricula.codTurma AND tbTurma.codCurso = 1;

-- Exercicio 08
SELECT tbAluno.codAluno AS CODIGO FROM tbAluno, tbMatricula, tbTurma WHERE tbMatricula.codAluno = tbAluno.codAluno AND tbMatricula.codTurma = tbTurma.codTurma AND tbTurma.nomeTurma = '1AA';

-- Exercicio 09
SELECT * FROM tbAluno;

-- Exercicio 10
SELECT * FROM tbTurma;