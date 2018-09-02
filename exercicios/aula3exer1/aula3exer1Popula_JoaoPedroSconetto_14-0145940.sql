-- --------                aula3exer1     	            ------------ --
--                                                                   --
--                    SCRIPT DE INSERÇÃO (DML)                       --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1                              --
--                                                                   --
-- Data Ultima Alteracao ..: 		                                     --
--   			                                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula3exer1;

INSERT INTO Setor (id, nome) VALUES
(1, 'Pediatria'),
(2, 'Oftalmologia'),
(3, 'Emergência'),
(4, 'Ortopedia'),
(5, 'Cardiologia');

INSERT INTO Especialidade (id, tipo_especialidade_medica) VALUES
(1, 'Pediatra'),
(2, 'Oftalmologista'),
(3, 'Clínico Geral'),
(4, 'Ortopedista'),
(5, 'Enfermeiro Geral'),
(6, 'Cardiologista');

INSERT INTO Plantonista (id, nome, matricula_funcional, sexo, tipo_especialidade) VALUES
(1, 'Rafael Souza', 52547, 'm', 'Pediatra'),
(2, 'Maria Penha', 42147, 'f', 'Clínico Geral'),
(3, 'José Farias', 35879, 'm', 'Ortopedista'),
(4, 'Lucas Levino', 27902, 'm', 'Enfermeiro Geral'),
(5, 'Ana Silva', 14789, 'm', 'Cardiologista');

INSERT INTO alocado (id, matricula_funcional_plantonista, nome_setor, horario_alocacao) VALUES
(1, 52547, 'Pediatria', '2018-09-03 08:00:00'),
(2, 52547, 'Emergência', '2018-09-04 08:00:00'),
(3, 35879, 'Ortopedia', '2018-09-03 08:00:00'),
(4, 27902, 'Oftalmologia', '2018-09-03 08:00:00'),
(5, 42147, 'Emergência', '2018-09-03 08:00:00'),
(6, 14789, 'Cardiologia', '2018-09-03 08:00:00');
