USE bdEscolaETEC

----------------------------------------------------------------------------------------------------------------------------------------------
-- PROPOSTA DE EXERCICIO
/*
	- Em uma ETEC qualquer haviam 2 turmas do 2o Mtec antes da pandemia, com 40 alunos cada.
	- Porém, após a suspensão das aulas presenciais, será montada uma única turma de 3o com todos os alunos que tiverem o status APROVADO.
	- Fazer um MERGE entre a tabela tb2A e tb2B criando uma única turma de 3o.
	- As 3 tabelas possuem um RM (PK), nome do Aluno e status.
	- Somente serão matriculados no 3o os alunos com status APROVADO.
	- Para fazer o teste, matricule ao menos 10 alunos em cada turma e aprove 70% dos alunos de cada turma
*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- MARGE --

MERGE tbAluno3 destino
	USING tbAluno2A origem
	ON origem.registroMatricula = destino.registroMatricula
		WHEN NOT MATCHED AND origem.statusAluno LIKE 'APROVADO' THEN
				INSERT VALUES
					(origem.registroMatricula, origem.nomeAluno,'CURSANDO');

MERGE tbAluno3 destino
	USING tbAluno2B origem
	ON origem.registroMatricula = destino.registroMatricula
		WHEN NOT MATCHED AND origem.statusAluno LIKE 'APROVADO' THEN
				INSERT VALUES
					(origem.registroMatricula, origem.nomeAluno,'CURSANDO');

SELECT * FROM tbAluno3
		