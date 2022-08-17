USE bdEstoque

------------------------------------------------------------------------------------------------------------------------------------------------ 1) Criar uma trigger que, ao ser feita uma venda (Insert na tabela tbItensVenda), todos os produtos vendidos tenham sua quantidade atualizada na tabela tbProduto. CREATE TRIGGER tgAtualizaQuantidadeProduto 	ON tbItensVenda AFTER INSERT 	AS BEGIN		DECLARE @quantidadeProduto INT, @codProduto INT		SET @codProduto = (SELECT codProduto FROM INSERTED);		SET @quantidadeProduto = (SELECT quantidadeItensVenda FROM INSERTED);		UPDATE tbProduto SET quantidadeProduto = quantidadeProduto - @quantidadeProduto			WHERE codProduto = @codProduto	END----------------------------------------------------------------------------------------------------------------------------------------------/* 2)Criar uma trigger que, quando for inserida uma nova entrada de produtos
na tbEntradaProduto, a quantidade desse produto seja atualizada e aumentada na tabela tbProduto;*/CREATE TRIGGER tgAumentaQuantidadeProduto	ON tbEntradaProduto AFTER INSERT	AS BEGIN		DECLARE @quantidadeProduto INT, @codProduto INT		SET @codProduto = (SELECT codProduto FROM INSERTED);		SET @quantidadeProduto = (SELECT quantidadeEntradaProduto FROM INSERTED);		UPDATE tbProduto SET quantidadeProduto = quantidadeProduto + @quantidadeProduto			WHERE codProduto = @codProduto	END------------------------------------------------------------------------------------------------------------------------------------------------ 3) Criar uma trigger que, quando for feita uma venda de um determinado produto, seja feito um Insert na tbSaidaProduto.CREATE TRIGGER tgRegistraSaidaProduto	ON tbVenda AFTER INSERT	AS BEGIN		DECLARE @codVenda INT, @dataVenda DATE, @quantidadeProduto INT, @codProduto INT

		SET @codVenda = (SELECT codVenda FROM INSERTED);

		SET @dataVenda = (SELECT dataVenda FROM INSERTED);

		SET @codProduto = (
			SELECT tbItensVenda.codProduto FROM tbItensVenda
				INNER JOIN tbVenda ON tbVenda.codVenda = @codVenda
				INNER JOIN tbProduto ON tbProduto.codProduto = tbItensVenda.codProduto

		);

		SET @quantidadeProduto = (
			SELECT quantidadeItensVenda FROM tbItensVenda
				INNER JOIN tbVenda ON tbVenda.codVenda = @codVenda
				INNER JOIN tbProduto ON tbProduto.codProduto = @codProduto
		);

		INSERT INTO tbSaidaProduto(dataSaidaProduto, codProduto, quantidadeSaidaProduto)
			VALUES (@dataVenda, @codProduto, @quantidadeProduto);	END------------------------------------------------------------------------------------------------------------------------------------------------ 4) Criar uma trigger que, ao ser feita uma venda (Insert na tabela tbVenda), todos os produtos vendidos tenham sua quantidade atualizada na tabela tbProduto. CREATE TRIGGER tgAtualizaProdutoVendido	ON tbVenda AFTER INSERT	AS BEGIN		DECLARE @codVenda INT, @quantidadeProduto INT, @codProduto INT

		SET @codVenda = (SELECT codVenda FROM INSERTED);

		SET @codProduto = (
			SELECT tbItensVenda.codProduto FROM tbItensVenda
				INNER JOIN tbVenda ON tbVenda.codVenda = @codVenda
				INNER JOIN tbProduto ON tbProduto.codProduto = tbItensVenda.codProduto

		);

		SET @quantidadeProduto = (
			SELECT quantidadeItensVenda FROM tbItensVenda 
				INNER JOIN tbVenda ON tbVenda.codVenda = @codVenda
				INNER JOIN tbProduto ON tbProduto.codProduto = @codProduto
		);		UPDATE tbProduto SET quantidadeProduto = quantidadeProduto - @quantidadeProduto			WHERE codProduto = @codProduto	END