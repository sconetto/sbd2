-- --------                aula3exer1     	            ------------ --
--                                                                   --
--                 SCRIPT DE CRIAÇÃO DE USUÁRIOS                     --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1                              --
--                                                                   --
-- Data Ultima Alteracao ..: 		                                    --
--   			                                                          --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                              --
-- ----------------------------------------------------------------- --

USE aula3exer1;

-- Cria usuario 'adminitrador' da base de dados aula3exer1
CREATE USER 'administrador'@'localhost'
 IDENTIFIED BY 'adm123';

 GRANT ALL PRIVILEGES ON aula3exer1.*
   TO 'administrador'@'localhost';


-- Cria usuario 'usuario' da base de dados aula3exer1
CREATE USER 'usuario'@'localhost'
 IDENTIFIED BY 'usu123';

 GRANT SELECT on aula3exer1.*
   TO 'usuario'@'localhost';
