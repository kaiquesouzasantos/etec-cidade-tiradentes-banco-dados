USE bdEstoque

----------------------------------------------------------------------------------------------------------------------------------------------
-- 01) Cadastrar três novos fornecedores via query;

INSERT INTO tbFornecedor(nomeFornecedor)
VALUES 
	('Coca-Cola')
	,('Pepsico')
	,('Heineken');

----------------------------------------------------------------------------------------------------------------------------------------------
-- 02) Fazer uma consulta utilizando o nome do fornecedor e a descrição dos produtos que cada fornecedor fornece;

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbFornecedor 
	INNER JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

----------------------------------------------------------------------------------------------------------------------------------------------
-- 03) Criar uma instrução utilizando left join e outra utilizando right join para exibir todos os fornecedores, incluindo ainda os três novos fornecedores para os quais não foram registrados novos produtos;

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbFornecedor 
	LEFT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
	RIGHT JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
	LEFT OUTER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR', tbProduto.descricaoProduto AS 'DESC' FROM tbProduto 
	RIGHT OUTER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

----------------------------------------------------------------------------------------------------------------------------------------------
-- 04) Cadastrar três novos produtos deixando para eles o código do fornecedor em branco;

INSERT INTO tbProduto(descricaoProduto, valorProduto, quantidadeProduto)
VALUES 
	('Coca-Cola 2 litros', 6.0, 1500)
	,('Pepsi', 5.0, 800)
	,('Cerveja 600ml', 10.5, 28111);

----------------------------------------------------------------------------------------------------------------------------------------------
-- 05) Criar um select utilizando a instrução full join exibindo assim todos os fornecedores, inclusive aqueles para os quais não foram atribuídos produtos, e aqueles produtos para os quais não foram atribuídos fornecedores;

SELECT tbFornecedor.nomeFornecedor AS 'FORNECEDOR',  tbProduto.descricaoProduto AS 'PRODUTO' FROM tbFornecedor
	FULL JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT tbProduto.descricaoProduto AS 'PRODUTO', tbFornecedor.nomeFornecedor AS 'FORNECEDOR' FROM tbProduto
	CROSS JOIN tbFornecedor 

----------------------------------------------------------------------------------------------------------------------------------------------
-- 06) Criar um select com a instrução cross join entre fornecedor e produto.

SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbProduto 
	CROSS JOIN tbFornecedor
