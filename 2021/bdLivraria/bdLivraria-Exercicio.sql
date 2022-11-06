USE bdLivraria

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROPOSTA DE EXERCICIO

UPDATE tb_autor SET nomeAutor='Carlos Drummnond de Andrade' 
	WHERE nomeAutor='Carlos D. de Andrade';

DELETE tb_livro WHERE isbnLivro = 72879012; 
DELETE tb_livro WHERE isbnLivro = 98920212; 

CREATE PROCEDURE procTables 
	AS BEGIN 
		SELECT * FROM tb_livro 
		SELECT * FROM tb_autor 
	END
EXEC procTables