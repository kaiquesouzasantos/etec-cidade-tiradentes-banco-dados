CREATE DATABASE bdLivraria
GO
USE bdLivraria

----------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE'S

CREATE TABLE tb_autor(
	codAutor INT PRIMARY KEY NOT NULL
	,nomeAutor VARCHAR(100)
);
GO

CREATE TABLE tb_livro(
	codLivro INT PRIMARY KEY NOT NULL
	,nomeLivro VARCHAR(100)
	,codAutor INT FOREIGN KEY REFERENCES tb_autor(codAutor)
	,isbnLivro INT
	,editoraLivro VARCHAR(100)
	,generoLivro VARCHAR(100)
	,numPagina INT
);
GO