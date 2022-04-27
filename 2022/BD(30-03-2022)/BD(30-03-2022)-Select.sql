USE bdEstoque

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 01

INSERT INTO tbFornecedor(nomeFornecedor)
VALUES 
	('Coca-Cola')
	,('Pepsico')
	,('Heineken');

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 02

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbFornecedor 
INNER JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 03

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbFornecedor 
LEFT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
RIGHT JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
LEFT OUTER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
RIGHT OUTER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 04

INSERT INTO tbProduto(descricaoProduto, valorProduto, quantidadeProduto)
VALUES 
	('Coca-Cola 2 litros', 6.0, 1500)
	,('Pepsi', 5.0, 800)
	,('Cerveja 600ml', 10.5, 28111);

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 05

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR',  tbProduto.descricaoProduto AS 'PRODUTO' FROM tbFornecedor
FULL JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbProduto.descricaoProduto AS 'PRODUTO', tbFornecedor.nomeFornecedor AS 'FORNECEDOR' FROM tbProduto
CROSS JOIN tbFornecedor 

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 06

SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbProduto 
CROSS JOIN tbFornecedor
