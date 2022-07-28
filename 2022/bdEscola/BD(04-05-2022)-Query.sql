USE dbEstoque

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 01
-- Criar uma consulta que retorne o c�digo do produto, o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto;

-- com INNER JOIN:
SELECT codProduto AS 'CODIGO', descricaoProduto AS 'PRODUTO', nomeFabricante AS 'FABRICANTE' FROM tbProduto 
	INNER JOIN tbFabricante ON tbFabricante.codFabricante = tbProduto.codFabricante
	WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

-- sem INNER JOIN:
SELECT codProduto AS 'CODIGO', descricaoProduto AS 'PRODUTO', nomeFabricante AS 'FABRICANTE' FROM tbProduto, tbFabricante
	WHERE  tbFabricante.codFabricante = tbProduto.codFabricante 
		AND valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 02
-- Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor m�dio dos produtos em estoque;

-- com INNER JOIN:
SELECT descricaoProduto AS 'PRODUTO', valorProduto AS 'VALOR', nomeFabricante AS 'FABRICANTE' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.codFabricante = tbProduto.codFabricante
	WHERE valorProduto > (SELECT AVG(valorProduto) FROM tbProduto)

-- sem INNER JOIN:
SELECT descricaoProduto AS 'PRODUTO', valorProduto AS 'VALOR', nomeFabricante AS 'FABRICANTE' FROM tbProduto, tbFabricante
	WHERE tbFabricante.codFabricante = tbProduto.codFabricante 
		AND valorProduto > (SELECT AVG(valorProduto) FROM tbProduto)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 03
-- Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor m�dio das vendas;

-- com INNER JOIN:
SELECT DISTINCT nomeCliente AS 'CLIENTE' FROM tbCliente
	INNER JOIN tbVenda ON tbVenda.codCliente = tbCliente.codCliente
	WHERE valorTotalVenda > (SELECT AVG(valorTotalVenda) FROM tbVenda)

-- sem INNER JOIN:
SELECT DISTINCT nomeCliente AS 'CLIENTE' FROM tbCliente, tbVenda  
	WHERE tbVenda.codCliente = tbCliente.codCliente 
		AND valorTotalVenda > (SELECT AVG(valorTotalVenda) FROM tbVenda)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 04
-- Criar uma consulta que retorno o nome e o pre�o do produto mais caro;

SELECT descricaoProduto AS 'PRODUTO', valorProduto AS 'VALOR' FROM tbProduto
	WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

----------------------------------------------------------------------------------------------------------------------------------------------
-- exercicio 05
-- Criar uma consulta que retorne o nome e o pre�o do produto mais barato;

SELECT descricaoProduto, valorProduto FROM tbProduto
	WHERE valorProduto = (SELECT MIN(valorProduto) FROM tbProduto)