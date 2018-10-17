-- --------              << EMPREENDEDORA >>            ------------ --
--                                                                   --
--                       SCRIPT DE CONTROLE                          --
--                                                                   --
-- Data Criacao ...........: 06/05/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: bdEmpre                                 --
--                                                                   --
-- Data Ultima Alteracao ..: 13/10/2018                              --
--   => Adição dos usuários solicitados.                             --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 5 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE bdEmpre;

CREATE USER IF NOT EXISTS 'cliente'@'localhost' IDENTIFIED BY 'cliente';
GRANT SELECT ON bdEmpre.* TO 'administrador'@'localhost';

CREATE USER IF NOT EXISTS 'profissional'@'localhost' IDENTIFIED BY 'profissional';
GRANT SELECT on bdEmpre.* TO 'usuario'@'localhost';
