-- --------              aula3exer1evolucao3            ------------ --
--                                                                   --
--                    SCRIPT DE DELEÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1                              --
--                                                                   --
-- Data Ultima Alteracao ..: 14/10/2018 - ajustando a consulta para  --
--                             a terceira evolução do exercício      --
--   			                                                     --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula3exer1evolucao3;

DROP TABLE IF EXISTS
  alocado,
  Plantonista,
  Especialidade,
  Setor;

DROP USER administrador@localhost,
          usuario@localhost;

DROP VIEW IF EXISTS
  numPlantonistasEspecialidades,
  PlantaoSetorFuncionario;

                                 