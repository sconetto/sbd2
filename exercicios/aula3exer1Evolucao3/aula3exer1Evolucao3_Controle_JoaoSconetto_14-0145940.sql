-- --------              aula3exer1evolucao3            ------------ --
--                                                                   --
--                 SCRIPT DE CRIAÇÃO DE USUÁRIOS                     --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao3                     --
--                                                                   --
-- Data Ultima Alteracao ..: 14/10/2018 - ajustando a consulta para  --
--                             a terceira evolução do exercício      --
--   			                                                     --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                             --
-- ----------------------------------------------------------------- --

USE aula3exer1evolucao3;

-- Cria usuario 'administrador' da base de dados aula3exer1evolucao3
CREATE USER 'administrador'@'localhost'
 IDENTIFIED BY 'Pa$$adm123!';

 GRANT ALL PRIVILEGES ON aula3exer1evolucao3.*
   TO 'administrador'@'localhost';


-- Cria usuario 'usuario' da base de dados aula3exer1evolucao3
CREATE USER 'usuario'@'localhost'
 IDENTIFIED BY 'Pa$$usu123!';

 GRANT SELECT on aula3exer1evolucao3.*
   TO 'usuario'@'localhost';
