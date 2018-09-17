-- --------            aula3exer1evolucao2     	        ------------ --
--                                                                   --
--                    SCRIPT DE INSERÇÃO (DML)                       --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 09/09/2018                              --
--   			                                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula3exer1evolucao2;

INSERT INTO Setor (nome) VALUES
('Pediatria'),
('Oftalmologia'),
('Emergência'),
('Ortopedia'),
('Cardiologia');

INSERT INTO Especialidade (tipo_especialidade_medica) VALUES
('Pediatra'),
('Oftalmologista'),
('Clínico Geral'),
('Ortopedista'),
('Enfermeiro Geral'),
('Cardiologista');

INSERT INTO Plantonista (nome, matricula_funcional, sexo, tipo_especialidade) VALUES
('Rafael Souza', 52547, 'm', 'Pediatra'),
('Maria Penha', 42147, 'f', 'Clínico Geral'),
('José Farias', 35879, 'm', 'Ortopedista'),
('Lucas Levino', 27902, 'm', 'Enfermeiro Geral'),
('Ana Silva', 14789, 'm', 'Cardiologista');

INSERT INTO alocado (matricula_funcional_plantonista, nome_setor, data_inicio_alocacao, data_fim_alocacao) VALUES
(52547, 'Pediatria', '2018-09-03 08:00:00', '2018-09-03 18:00:00'),
(52547, 'Emergência', '2018-09-04 08:00:00', '2018-09-04 18:00:00'),
(35879, 'Ortopedia', '2018-09-03 08:00:00', '2018-09-03 18:00:00'),
(27902, 'Oftalmologia', '2018-09-03 08:00:00', '2018-09-03 18:00:00'),
(42147, 'Emergência', '2018-09-03 08:00:00', '2018-09-03 18:00:00'),
(14789, 'Cardiologia', '2018-09-03 08:00:00', '2018-09-03 18:00:00');
