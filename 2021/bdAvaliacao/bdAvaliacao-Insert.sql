USE bdAvaliacao

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S

INSERT INTO tbFornecedor
VALUES 
	(1,'Kibon','Bruna Rubia'),
	(2,'Nestle','Carlos Drummond'),
	(3,'Jundiá','Fernenda Ribeiro');
GO

INSERT INTO	tbSorvetes
VALUES
	(1,'Cremosíssimo','10.00',1),
	(2,'Galak','20.00',2),
	(3,'Grego','15.50',3);
GO

INSERT INTO tbFuncionario(codFuncionario,nomeFuncionario,cpfFuncionario,ruaFuncionario,numeroFuncionario,dataNascFuncionario)
VALUES
	(1,'Stev Jobs','123.456.789.10','California',2000,'1970-04-10'),
	(2,'Maria Rosa','','São Paulo',130,'1981-05-11');
GO