CREATE DATABASE bdBrasileira
USE bdBrasileira

CREATE TABLE tb_autor(
	codAutor INT PRIMARY KEY NOT NULL
	,nomeAutor VARCHAR(100)
);

CREATE TABLE tb_livro(
	codLivro INT PRIMARY KEY NOT NULL
	,nomeLivro VARCHAR(100)
	,codAutor INT FOREIGN KEY REFERENCES tb_autor(codAutor)
	,isbnLivro INT
	,editoraLivro VARCHAR(100)
	,generoLivro VARCHAR(100)
	,numPagina INT
);

INSERT INTO tb_autor(codAutor,nomeAutor) VALUES
	(1,'Carlos D. de Andrade'),
	(2,'Vinicius de Moraes'),
	(3,'Cecília Meirelles'),
	(4,'Manuel Bandeira'),
	(5,'Machado de Asis'),
	(6,'Cora Coralina'),
	(7,'Clarice Lispector');

INSERT INTO tb_livro VALUES
	(1,'Estórias da casa velha da ponte',6,12438739,'Ática','Romance',298),
	(2,'O tesoura da Casa velha',6,63762892,'Cia das Letras','Romance',172),
	(3,'A hora da Estrela',7,73682920,'Cia das Letras','Poesia',92),
	(4,'Meu livro de cordel',6,72879012,'Saraiva','Poesia',123),
	(5,'A descoberta do mundo',7,98920212,'Saraiva','Romance',321),
	(6,'Ou isto ou aquilo',3,73928923,'Ática','Poesia',122);

UPDATE tb_autor SET nomeAutor='Carlos Drummnond de Andrade' WHERE nomeAutor='Carlos D. de Andrade';

DELETE tb_livro WHERE isbnLivro = 72879012; 
DELETE tb_livro WHERE isbnLivro = 98920212; 

CREATE PROCEDURE procTables AS BEGIN SELECT * FROM tb_livro SELECT * FROM tb_autor END
EXEC procTables


