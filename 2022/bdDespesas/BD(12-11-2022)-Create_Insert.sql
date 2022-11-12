CREATE DATABASE bdDespesas
GO
USE bdDespesas

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE's

CREATE TABLE tbDespesas (
	mes VARCHAR(10) NOT NULL,
	categoria VARCHAR(50) NOT NULL,
	valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE tbErros (
	numero INT NOT NULL,
	severidade INT NOT NULL,
	mensagem VARCHAR(100) NOT NULL
);

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT's

INSERT INTO tbDespesas
VALUES 
	   ('Janeiro', 'Transporte', 74),
	   ('Janeiro', 'Supermercado', 235),
	   ('Janeiro', 'Despesas domesticas', 175),
	   ('Janeiro', 'Entretenimento', 100),
	   ('Fevereiro', 'Transporte', 115),
	   ('Fevereiro', 'Supermercado', 240),
	   ('Fevereiro', 'Despesas domesticas', 225),
	   ('Fevereiro', 'Entretenimento', 125),
	   ('Marco', 'Transporte', 90),
	   ('Marco', 'Supermercado', 260),
	   ('Marco', 'Despesas domesticas', 200),
	   ('Marco', 'Entretenimento', 120)
