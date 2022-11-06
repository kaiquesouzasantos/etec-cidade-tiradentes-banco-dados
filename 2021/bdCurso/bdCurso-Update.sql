USE bdCurso

----------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE'S

-- ALUNO
UPDATE tbAluno SET nomeAluno = 'Wellida' WHERE codAluno = 1;
UPDATE tbAluno SET nomeAluno = 'Robson' WHERE codAluno = 2;
UPDATE tbAluno SET nomeAluno = 'Rodrigo' WHERE codAluno = 3;
UPDATE tbAluno SET nomeAluno = 'Everson' WHERE codAluno = 4;
UPDATE tbAluno SET nomeAluno = 'Clayton' WHERE codAluno = 5;
UPDATE tbAluno SET nomeAluno = 'Francisco' WHERE codAluno = 6;
UPDATE tbAluno SET nomeAluno = 'Mauricio' WHERE codAluno = 7;
UPDATE tbAluno SET nomeAluno = 'Thayane' WHERE codAluno = 8;
UPDATE tbAluno SET nomeAluno = 'Done' WHERE codAluno = 9;
UPDATE tbAluno SET nomeAluno = 'Kaique' WHERE codAluno = 10;

-- CURSO
UPDATE tbCurso SET valorCurso = 'R$1000.00' WHERE codCurso = 1;
UPDATE tbCurso SET valorCurso = 'R$750.00' WHERE codCurso = 2;
UPDATE tbCurso SET valorCurso = 'R$800.00' WHERE codCurso = 3;
UPDATE tbCurso SET valorCurso = 'R$1300.00' WHERE codCurso = 4;
UPDATE tbCurso SET valorCurso = 'R$1000.00' WHERE codCurso = 5;
UPDATE tbCurso SET valorCurso = 'R$1700.00' , cargaHoraCurso = '120h' WHERE codCurso = 6;
UPDATE tbCurso SET valorCurso = 'R$350.00' WHERE codCurso = 7;
UPDATE tbCurso SET valorCurso = 'R$250.00' WHERE codCurso = 8;
UPDATE tbCurso SET valorCurso = 'R$400.00' WHERE codCurso = 9;
UPDATE tbCurso SET valorCurso = 'R$1200.00' , cargaHoraCurso = '90h'WHERE codCurso = 10;

-- TURMA
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 1;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 2;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 3;
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 4;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 5;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 6;
UPDATE tbTurma SET horarioTurma = '09:00:00' WHERE codTurma = 7;
UPDATE tbTurma SET horarioTurma = '12:00:00' WHERE codTurma = 8;
UPDATE tbTurma SET horarioTurma = '15:00:00' WHERE codTurma = 9;
UPDATE tbTurma SET horarioTurma = '18:00:00' WHERE codTurma = 10;

-- MATRICULA
UPDATE tbMatricula SET codTurma = 1 WHERE codMatricula = 1;
UPDATE tbMatricula SET codTurma = 2 WHERE codMatricula = 2;
UPDATE tbMatricula SET codTurma = 3 WHERE codMatricula = 3;
UPDATE tbMatricula SET codTurma = 4 WHERE codMatricula = 4;
UPDATE tbMatricula SET codTurma = 5 WHERE codMatricula = 5;
UPDATE tbMatricula SET codTurma = 6 WHERE codMatricula = 6;
UPDATE tbMatricula SET codTurma = 7 WHERE codMatricula = 7;
UPDATE tbMatricula SET codTurma = 8 WHERE codMatricula = 8;
UPDATE tbMatricula SET codTurma = 9 WHERE codMatricula = 9;
UPDATE tbMatricula SET codTurma = 10 WHERE codMatricula = 10;