CREATE DATABASE dbSistemaAcademico
GO
USE dbSistemaAcademico

CREATE TABLE tbCampus(
	idCampus INT PRIMARY KEY IDENTITY(1,1)
	,nomeCampus VARCHAR(45) NOT NULL
);

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL
	,cargaHoraria INT NOT NULL
);

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50) NOT NULL
	,rgAluno VARCHAR(15) NOT NULL
	,cpfAluno CHAR(11) NOT NULL
	,dtNascAluno SMALLDATETIME 
);

CREATE TABLE tbProfessor(
	idProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nomeProfessor VARCHAR(50) NOT NULL
	,rgProfessor VARCHAR(15) NOT NULL
	,cpfProfessor CHAR(11) NOT NULL
	,dtNascProfessor SMALLDATETIME 
); 

CREATE TABLE tbDisciplina(
	idDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina VARCHAR(40) NOT NULL 
	,cargaHorariaDisciplina INT NOT NULL
); 

CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	,descricaoTurma VARCHAR(30) NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	,idCampus INT FOREIGN KEY REFERENCES tbCampus(idCampus)
	,semestreTurma INT
	,numeroAlunos INT
	,dtConclusao SMALLDATETIME
);

CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dtMatricula SMALLDATETIME
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
);

CREATE TABLE tbAtribuicao(
	idAtribuicao INT PRIMARY KEY IDENTITY(1,1)
	,dtAtribuicao SMALLDATETIME
	,idProfessor INT FOREIGN KEY REFERENCES tbProfessor(idProfessor)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
	,idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina(idDisciplina)
);
