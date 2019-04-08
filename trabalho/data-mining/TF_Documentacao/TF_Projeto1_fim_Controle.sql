-- --------        Trabalho Final - European Soccer     ------------ --
--                                                                   --
--                 SCRIPT DE CRIAÇÃO DE USUÁRIOS                     --
--                                                                   --
-- Data Criacao ...........: 25/11/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                           Adrianne Alves                          --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: europeanSoccer                          --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 7 Tabelas                                              --
--         => 1 Usuarios                                             --
-- ----------------------------------------------------------------- --

USE europeanSoccer;

-- Cria usuario 'administrador' da base de dados europeanSoccer
CREATE USER 'administrador'@'localhost'
 IDENTIFIED BY 'Pa$$adm123!';

 GRANT ALL PRIVILEGES ON europeanSoccer.*
   TO 'administrador'@'localhost';
