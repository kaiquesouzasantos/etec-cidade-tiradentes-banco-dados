USE bdClinica

----------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT'S

INSERT INTO	tbPaciente
VALUES  
	(1,'Kaique','Dom Alvarenga','123.456.789-1'),
	(2,'Everson','Bradesco','123.444.789-2'),
	(3,'Robson','Albert Einstein','123.455.789-3'),
	(4,'Thayane','Santander','111.222.333.4'),
	(5,'Mauricio','JoiaConvenio','222.333.444-5'),
	(6,'Done','Dr.Consulta','333.444.555-6'),
	(7,'Wellida','SantosDrummond','444.555.666-7'),
	(8,'Rodrigo','PenhaConv','555.666.777-8'),
	(9,'Clayton','QuimioTec','666.777.888-9'),
	(10,'Francisco','HistoricConv','777.888.999-10');

INSERT INTO tbMedico
VALUES  
	(1,'Kaique','393178322812511','123.456.789-1'),
	(2,'Everson','713039861397825','123.444.789-2'),
	(3,'Robson','561152576271061','123.455.789-3'),
	(4,'Thayane','750069860368785','111.222.333.4'),
	(5,'Mauricio','855086108132810','222.333.444-5'),
	(6,'Done','956634911933480','333.444.555-6'),
	(7,'Wellida','155941424238110','444.555.666-7'),
	(8,'Rodrigo','542421923273323','555.666.777-8'),
	(9,'Clayton','016461412112204','666.777.888-9'),
	(10,'Francisco','411379489539525','777.888.999-10');
GO

INSERT INTO tbTelefone
VALUES  (1,'(11) 99432-2605',1),
		(2,'(11) 99678-6347',2),
		(3,'(11) 99768-9586',3),
		(4,'(11) 99540-9163',4),
		(5,'(11) 98792-9192',5),
		(6,'(11) 99264-5061',6),
		(7,'(11) 99300-4579',7),
		(8,'(11) 98725-7012',8),
		(9,'(11) 98111-4584',9),
		(10,'(11) 98885-9803',10);

INSERT INTO tbEndereco
VALUES	(1,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','S�o Paulo','SP',1),
		(2,'Jose Lemos Alberto','333','55555-035','Vila Formosa','S�o Paulo','SP',2),
		(3,'Av.Paulista','123','03026-999','Jardins','S�o Paulo','SP',3),
		(4,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','S�o Paulo','SP',4),
		(5,'Jose Lemos Alberto','333','55555-035','Vila Formosa','S�o Paulo','SP',5),
		(6,'Av.Paulista','123','03026-999','Jardins','S�o Paulo','SP',6),
		(7,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','S�o Paulo','SP',7),
		(8,'Jose Lemos Alberto','333','55555-035','Vila Formosa','S�o Paulo','SP',8),
		(9,'Av.Paulista','123','03026-999','Jardins','S�o Paulo','SP',9),
		(10,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','S�o Paulo','SP',10);

INSERT INTO tbConsulta
VALUES	(1,'2021-09-12','20:20:00',1,10),
		(2,'2021-10-14','12:20:00',2,9),
		(3,'2021-11-20','15:20:00',3,8),
		(4,'2021-12-07','13:20:00',4,7),
		(5,'2021-10-03','11:20:00',5,6),
		(6,'2021-09-18','14:20:00',6,5),
		(7,'2021-09-15','19:20:00',7,4),
		(8,'2021-10-14','17:20:00',8,3),
		(9,'2021-11-29','16:20:00',9,2),
		(10,'2021-12-10','10:20:00',10,1);
GO