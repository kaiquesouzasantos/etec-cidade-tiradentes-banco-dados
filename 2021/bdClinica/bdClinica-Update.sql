USE bdClinica

----------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE'S

-- PACIENTE
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

-- MEDICO
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

-- TELEFONE
UPDATE tbTelefone SET numeroTelefone = '(11) 98885-9803' WHERE codTelefone = 1;
UPDATE tbTelefone SET numeroTelefone = '(11) 98111-4584' WHERE codTelefone = 2;
UPDATE tbTelefone SET numeroTelefone = '(11) 98725-7012' WHERE codTelefone = 3;
UPDATE tbTelefone SET numeroTelefone = '(11) 99264-5061' WHERE codTelefone = 4;
UPDATE tbTelefone SET numeroTelefone = '(11) 99300-4579' WHERE codTelefone = 6;
UPDATE tbTelefone SET numeroTelefone = '(11) 98792-9192' WHERE codTelefone = 7;
UPDATE tbTelefone SET numeroTelefone = '(11) 99540-9163' WHERE codTelefone = 8;
UPDATE tbTelefone SET numeroTelefone = '(11) 99768-9586' WHERE codTelefone = 9;
UPDATE tbTelefone SET numeroTelefone = '(11) 99678-6347' WHERE codTelefone = 10;

-- ENDEREÇO
UPDATE tbEndereco SET logradouroEndereco = 'Jose Francisco Lemos' , numeroEndereco = '555' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 1;
UPDATE tbEndereco SET logradouroEndereco = 'Av.Paulista' , numeroEndereco = '123' , cepEndereco = '03026-999' , bairroEndereco = 'Jardins' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 2;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Lemos Alberto' , numeroEndereco = '333' , cepEndereco = '55555-035' , bairroEndereco = 'Vila Formosa' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 3;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Francisco Lemos' , numeroEndereco = '555' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 4;
UPDATE tbEndereco SET logradouroEndereco = 'Av.Paulista' , numeroEndereco = '123' , cepEndereco = '03026-999' , bairroEndereco = 'Jardins' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 5;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Lemos Alberto' , numeroEndereco = '334' , cepEndereco = '55555-035' , bairroEndereco = 'Vila Formosa' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 6;
UPDATE tbEndereco SET logradouroEndereco = 'Jose Ant�nio Arruda' , numeroEndereco = '893' , cepEndereco = '03026-035' , bairroEndereco = 'Cidade Tiradentes' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 7;
UPDATE tbEndereco SET logradouroEndereco = 'Av. Machado de Asis' , numeroEndereco = '225' , cepEndereco = '03897-892' , bairroEndereco = 'Ipiranga' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 8;
UPDATE tbEndereco SET logradouroEndereco = 'Rua Santa Madalena' , numeroEndereco = '597' , cepEndereco = '55841-487' , bairroEndereco = 'Morumbi' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 9;
UPDATE tbEndereco SET logradouroEndereco = 'Av. Jose de Medeiros' , numeroEndereco = '1473' , cepEndereco = '78469-876' , bairroEndereco = 'Itaim Bibi' , cidedeEndereco = 'S�o Paulo' , estadoEndereco = 'SP' WHERE codEndereco = 10;

-- CONSULTA
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