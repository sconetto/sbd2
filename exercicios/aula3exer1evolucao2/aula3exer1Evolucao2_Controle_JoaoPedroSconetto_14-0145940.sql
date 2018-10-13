-- --------              aula3exer1evolucao2            ------------ --
--                                                                   --
--                 SCRIPT DE CRIAÇÃO DE USUÁRIOS                     --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 09/09/2018                              --
--   			                                                     --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula3exer1evolucao2;

CREATE USER IF NOT EXISTS'administrador'@'localhost' IDENTIFIED BY 'administrador';
GRANT ALL PRIVILEGES ON aula3exer1evolucao2.* TO 'administrador'@'localhost';

CREATE USER IF NOT EXISTS'usuario'@'localhost' IDENTIFIED BY 'usuario';
GRANT SELECT on aula3exer1evolucao2.* TO 'usuario'@'localhost';
