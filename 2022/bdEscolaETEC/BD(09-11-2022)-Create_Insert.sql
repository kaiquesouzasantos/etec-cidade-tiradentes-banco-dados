CREATE DATABASE bdEscolaETEC
GO
USE bdEscolaETEC

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S --

CREATE TABLE tbAluno2A (
	registroMatricula INT PRIMARY KEY
	,nomeAluno VARCHAR(80)
	,statusAluno VARCHAR(10)
);

CREATE TABLE tbAluno2B (
	registroMatricula INT PRIMARY KEY
	,nomeAluno VARCHAR(80)
	,statusAluno VARCHAR(10)
);

CREATE TABLE tbAluno3 (
	registroMatricula INT PRIMARY KEY
	,nomeAluno VARCHAR(80)
	,statusAluno VARCHAR(10)
);

GO
----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S --

INSERT INTO tbAluno2A VALUES
	(1, 'KAIQUE', 'APROVADO'),
	(2, 'ALINE', 'APROVADO'),
	(3, 'VANESSA', 'APROVADO'),
	(4, 'MAURICIO', 'APROVADO'),
	(5, 'THAYANI', 'APROVADO'),
	(6, 'DANADONE', 'APROVADO'),
	(7, 'FERNANDO', 'APROVADO'),
	(8, 'ROBSON', 'REPROVADO'),
	(9, 'JUNIOR', 'REPROVADO'),
	(10, 'CLAYTON', 'REPROVADO');

INSERT INTO tbAluno2B VALUES
	(123, 'KAIQUE', 'APROVADO'),
	(323, 'ALINE', 'APROVADO'),
	(436, 'VANESSA', 'APROVADO'),
	(332, 'MAURICIO', 'APROVADO'),
	(875, 'THAYANI', 'APROVADO'),
	(643, 'DANADONE', 'APROVADO'),
	(413, 'FERNANDO', 'APROVADO'),
	(876, 'ROBSON', 'REPROVADO'),
	(231, 'JUNIOR', 'REPROVADO'),
	(313, 'CLAYTON', 'REPROVADO');
GO
