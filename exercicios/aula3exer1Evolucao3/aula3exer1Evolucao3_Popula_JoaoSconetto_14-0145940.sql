-- --------              aula3exer1evolucao3            ------------ --
--                                                                   --
--                    SCRIPT DE INSERÇÃO (DML)                       --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                         : Filipe Toyoshima Silva                  --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 11/09/2018                              --
--                           14/10/2018 - ajustando a consulta para  --
--                             a terceira evolução do exercício      --
--   			                                                     --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula3exer1evolucao3;


-- Insere dados na base de dados
INSERT INTO Setor (nomeSetor) VALUES
 ('Pediatria'),
 ('Oftalmologia'),
 ('Emergência'),
 ('Ortopedia'),
 ('Cardiologia');


INSERT INTO Especialidade (descEspecialidade) VALUES
 ('Pediatra'),
 ('Oftalmologista'),
 ('Clínico Geral'),
 ('Ortopedista'),
 ('Cardiologista');


INSERT INTO Plantonista (nomePlantonista, matriculaFuncional, sexoPlantonista, idEspecialidade) VALUES
 ('Rafael Souza', 52547, 'm', 1),
 ('Maria Penha', 42147, 'f', 2),
 ('José Farias', 35879, 'm', 3),
 ('Lucas Levino', 27902, 'm', 4),
 ('Ana Silva', 14789, 'm', 5);


INSERT INTO alocado (matriculaFuncional, idSetor, horarioInicio, horarioTermino) VALUES
(52547, 1, '2018-09-03 08:00:00', '2018-09-03 16:00:00'),
(52547, 2, '2018-09-04 08:00:00', '2018-09-04 16:00:00'),
(35879, 3, '2018-09-03 08:00:00', '2018-09-03 16:00:00'),
(27902, 4, '2018-09-03 08:00:00', '2018-09-03 16:00:00'),
(42147, 3, '2018-09-03 08:00:00', '2018-09-03 16:00:00'),
(14789, 5, '2018-09-03 08:00:00', '2018-09-03 16:00:00');