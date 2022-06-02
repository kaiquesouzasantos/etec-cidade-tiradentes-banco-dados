USE dbEstoque

----------------------------------------------------------------------------------------------------------------------------------------------
-- Apresenta produto, fabricante e fornecedor ordenados.

CREATE VIEW vwProduto AS
	SELECT descricaoProduto AS 'PRODUTO', nomeFabricante AS 'FABRICANTE', nomeFornecedor AS 'FORNECEDOR' FROM tbProduto
		INNER JOIN tbFabricante ON tbFabricante.codFabricante = tbProduto.codFabricante
		INNER JOIN tbFornecedor ON tbFornecedor.codFornecedor = tbProduto.codFornecedor
GO
SELECT * FROM vwProduto ORDER BY [PRODUTO] ASC

----------------------------------------------------------------------------------------------------------------------------------------------
-- Apresenta produto, preco, fabricante e fornecedor ordenados supundo um reajuste de 5%.

CREATE VIEW vwProduto_Reajuste AS
	SELECT descricaoProduto AS 'PRODUTO', valorProduto AS 'VALOR', nomeFabricante AS 'FABRICANTE', nomeFornecedor AS 'FORNECEDOR' FROM tbProduto
		INNER JOIN tbFabricante ON tbFabricante.codFabricante = tbProduto.codFabricante
		INNER JOIN tbFornecedor ON tbFornecedor.codFornecedor = tbProduto.codFornecedor
GO
SELECT * FROM vwProduto_Reajuste
SELECT [PRODUTO],([VALOR] + [VALOR] * 0.05) AS 'REAJUSTE', [FABRICANTE], [FORNECEDOR] FROM vwProduto_Reajuste

----------------------------------------------------------------------------------------------------------------------------------------------
-- Apresenta os fabricantes com a maior quantidade de produtos.

CREATE VIEW vwFabricante_Produtos AS
	SELECT nomeFabricante AS 'FABRICANTE', COUNT(codProduto) AS 'QTD' FROM tbProduto
		INNER JOIN tbFabricante ON tbFabricante.codFabricante = tbProduto.codFabricante
		GROUP BY nomeFabricante
GO
SELECT * FROM vwFabricante_Produtos WHERE [QTD] = (SELECT MAX([QTD]) FROM vwFabricante_Produtos)

----------------------------------------------------------------------------------------------------------------------------------------------
-- Lista e ordena as vendas e seus respectivos produtos.

CREATE VIEW vwProduto_Venda AS
	SELECT descricaoProduto AS 'PRODUTO', SUM(tbItensVenda.subTotalItensVenda) AS 'TOTAL_VENDAS' FROM tbProduto
		INNER JOIN tbItensVenda ON tbItensVenda.codProduto = tbProduto.codProduto
		GROUP BY descricaoProduto
GO
SELECT * FROM vwProduto_Venda WHERE [TOTAL_VENDAS] = (SELECT MAX([TOTAL_VENDAS]) FROM vwProduto_Venda)
SELECT * FROM vwProduto_Venda WHERE [TOTAL_VENDAS] = (SELECT MIN([TOTAL_VENDAS]) FROM vwProduto_Venda)
SELECT * FROM vwProduto_Venda WHERE [TOTAL_VENDAS] > (SELECT AVG([TOTAL_VENDAS]) FROM vwProduto_Venda)
SELECT * FROM vwProduto_Venda WHERE [TOTAL_VENDAS] < (SELECT AVG([TOTAL_VENDAS]) FROM vwProduto_Venda)