CREATE DATABASE bdClinica

USE bdClinica

CREATE TABLE tbPaciente(
	codPaciente INT NOT NULL PRIMARY KEY
	,nomPaciente VARCHAR(30)
	,convenioPaciente VARCHAR (30) 
	,rgPaciente VARCHAR (30)
);

CREATE TABLE tbMedico(
	codMedico INT NOT NULL PRIMARY KEY
	,nomeMedico VARCHAR (30)
	,crmMedico VARCHAR (30)
	,rgMedico VARCHAR (30)
);

CREATE TABLE tbTelefone(
	codTelefone INT NOT NULL PRIMARY KEY 
	,numeroTelefone VARCHAR (30)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbEndereco(
	codEndereco INT NOT NULL PRIMARY KEY
	,logradouroEndereco VARCHAR(60)
	,numeroEndereco VARCHAR (30)
	,cepEndereco VARCHAR (30)
	,bairroEndereco VARCHAR (30)
	,cidedeEndereco VARCHAR (30)
	,estadoEndereco VARCHAR (30)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbConsulta(
	codConsulta INT NOT NULL PRIMARY KEY
	,dataConsulta DATE 
	,horaConsulta TIME
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
	,codMedico INT FOREIGN KEY REFERENCES tbMedico(codMedico)
);
      
INSERT INTO	tbPaciente
VALUES  (1,'Kaique','Dom Alvarenga','123.456.789-1'),
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
VALUES  (1,'Kaique','393178322812511','123.456.789-1'),
		(2,'Everson','713039861397825','123.444.789-2'),
		(3,'Robson','561152576271061','123.455.789-3'),
		(4,'Thayane','750069860368785','111.222.333.4'),
		(5,'Mauricio','855086108132810','222.333.444-5'),
		(6,'Done','956634911933480','333.444.555-6'),
		(7,'Wellida','155941424238110','444.555.666-7'),
		(8,'Rodrigo','542421923273323','555.666.777-8'),
		(9,'Clayton','016461412112204','666.777.888-9'),
		(10,'Francisco','411379489539525','777.888.999-10');

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
VALUES	(1,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','São Paulo','SP',1),
		(2,'Jose Lemos Alberto','333','55555-035','Vila Formosa','São Paulo','SP',2),
		(3,'Av.Paulista','123','03026-999','Jardins','São Paulo','SP',3),
		(4,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','São Paulo','SP',4),
		(5,'Jose Lemos Alberto','333','55555-035','Vila Formosa','São Paulo','SP',5),
		(6,'Av.Paulista','123','03026-999','Jardins','São Paulo','SP',6),
		(7,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','São Paulo','SP',7),
		(8,'Jose Lemos Alberto','333','55555-035','Vila Formosa','São Paulo','SP',8),
		(9,'Av.Paulista','123','03026-999','Jardins','São Paulo','SP',9),
		(10,'Jose Francisco Lemos','555','03026-035','Cidade Tiradentes','São Paulo','SP',10);

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

UPDATE tbPaciente SET nomPaciente = 'Nemias' WHERE codPaciente = 1;
UPDATE tbPaciente SET convenioPaciente = 'Santander' WHERE codPaciente = 2;
UPDATE tbPaciente SET nomPaciente = 'Clederson', convenioPaciente = 'FisioMedic' WHERE codPaciente = 3;
UPDATE tbPaciente SET nomPaciente = 'Mauricio' WHERE codPaciente = 4;
UPDATE tbPaciente SET convenioPaciente = 'Santander' WHERE codPaciente = 5;
UPDATE tbPaciente SET nomPaciente = 'Robson', convenioPaciente = 'Bradesco' WHERE codPaciente = 6;
UPDATE tbPaciente SET nomPaciente = 'Done' WHERE codPaciente = 7;
UPDATE tbPaciente SET convenioPaciente = 'Santander' WHERE codPaciente = 8;
UPDATE tbPaciente SET nomPaciente = 'Francisco', convenioPaciente = 'PenhaConv' WHERE codPaciente = 9;
UPDATE tbPaciente SET nomPaciente = 'Kaique' WHERE codPaciente = 10;

UPDATE tbMedico SET nomeMedico = 'Francisco' WHERE codMedico = 1;
UPDATE tbMedico SET nomeMedico = 'Rodrigo' WHERE codMedico = 2;
UPDATE tbMedico SET nomeMedico = 'Clayton' WHERE codMedico = 3;
UPDATE tbMedico SET nomeMedico = 'Wellida' WHERE codMedico = 4;
UPDATE tbMedico SET nomeMedico = 'Done' WHERE codMedico = 5;
UPDATE tbMedico SET nomeMedico = 'Thayane' WHERE codMedico = 6;
UPDATE tbMedico SET nomeMedico = 'Mauricio' WHERE codMedico = 7;
UPDATE tbMedico SET nomeMedico = 'Robson' WHERE codMedico = 8;
UPDATE tbMedico SET nomeMedico = 'Everson' WHERE codMedico = 9;
UPDATE tbMedico SET nomeMedico = 'Kaique' WHERE codMedico = 10;

UPDATE tbTelefone SET numeroTelefone = '(11) 98885-9803' WHERE codTelefone = 1;
UPDATE tbTelefone SET numeroTelefone = '(11) 98111-4584' WHERE codTelefone = 2;
UPDATE tbTelefone SET numeroTelefone = '(11) 98725-7012' WHERE codTelefone = 3;
UPDATE tbTelefone SET numeroTelefone = '(11) 99264-5061' WHERE codTelefone = 4;
UPDATE tbTelefone SET numeroTelefone = '(11) 99300-4579' WHERE codTelefone = 6;
UPDATE tbTelefone SET numeroTelefone = '(11) 98792-9192' WHERE codTelefone = 7;
UPDATE tbTelefone SET numeroTelefone = '(11) 99540-9163' WHERE codTelefone = 8;
UPDATE tbTelefone SET numeroTelefone = '(11) 99768-9586' WHERE codTelefone = 9;
UPDATE tbTelefone SET numeroTelefone = '(11) 99678-6347' WHERE codTelefone = 10;

UPDATE tbEndereco SET logradouroEndereco = 'Jose Francisco Lemos' , numeroEndereco = '555' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 1;
UPDATE tbEndereco SET logradouroEndereco = 'Av.Paulista' , numeroEndereco = '123' , cepEndereco = '03026-999' , bairroEndereco = 'Jardins' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 2;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Lemos Alberto' , numeroEndereco = '333' , cepEndereco = '55555-035' , bairroEndereco = 'Vila Formosa' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 3;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Francisco Lemos' , numeroEndereco = '555' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 4;
UPDATE tbEndereco SET logradouroEndereco = 'Av.Paulista' , numeroEndereco = '123' , cepEndereco = '03026-999' , bairroEndereco = 'Jardins' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 5;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Lemos Alberto' , numeroEndereco = '334' , cepEndereco = '55555-035' , bairroEndereco = 'Vila Formosa' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 6;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Antônio Arruda' , numeroEndereco = '893' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 7;
UPDATE tbEndereco SET logradouroEndereco = 'Av. Machado de Asis' , numeroEndereco = '225' , cepEndereco = '03897-892' , bairroEndereco = 'Ipiranga' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 8;
UPDATE tbEndereco SET logradouroEndereco = 'Rua Santa Madalena' , numeroEndereco = '597' , cepEndereco = '55841-487' , bairroEndereco = 'Morumbi' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 9;
UPDATE tbEndereco SET logradouroEndereco = 'Av. Jose de Medeiros' , numeroEndereco = '1473' , cepEndereco = '78469-876' , bairroEndereco = 'Itaim Bibi' , cidedeEndereco = 'São Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 10;

UPDATE tbConsulta SET dataConsulta = '2021-12-10' , horaConsulta = '10:20:00' WHERE codConsulta = 1;
UPDATE tbConsulta SET dataConsulta = '2021-11-29' , horaConsulta = '16:20:00' WHERE codConsulta = 2;
UPDATE tbConsulta SET dataConsulta = '2021-10-14' , horaConsulta = '17:20:00' WHERE codConsulta = 3;
UPDATE tbConsulta SET dataConsulta = '2021-09-15' , horaConsulta = '19:20:00' WHERE codConsulta = 4;
UPDATE tbConsulta SET dataConsulta = '2021-09-18' , horaConsulta = '14:20:00' WHERE codConsulta = 5;
UPDATE tbConsulta SET dataConsulta = '2021-10-03' , horaConsulta = '11:20:00' WHERE codConsulta = 6;
UPDATE tbConsulta SET dataConsulta = '2021-12-07' , horaConsulta = '13:20:00' WHERE codConsulta = 7;
UPDATE tbConsulta SET dataConsulta = '2021-11-20' , horaConsulta = '15:20:00' WHERE codConsulta = 8;
UPDATE tbConsulta SET dataConsulta = '2021-10-14' , horaConsulta = '12:20:00' WHERE codConsulta = 9;
UPDATE tbConsulta SET dataConsulta = '2021-09-12' , horaConsulta = '20:20:00' WHERE codConsulta = 10;

CREATE PROCEDURE prodTabelas
AS BEGIN 
	SELECT * FROM tbPaciente
	SELECT * FROM tbMedico
	SELECT * FROM tbEndereco
	SELECT * FROM tbTelefone
	SELECT * FROM tbConsulta
END
EXEC prodTabelas