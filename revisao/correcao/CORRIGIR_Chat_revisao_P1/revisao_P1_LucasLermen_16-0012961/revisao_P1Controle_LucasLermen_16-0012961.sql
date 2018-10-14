-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 14/10/2018
-- Autor(es) ..............: Lucas Arthur Lermen
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   =>
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
--  	   => 2 usuários
-- --------------------------------------------------- --

USE bdEmpre;

-- Cria usuario 'CLIENTE' da base de dados bdEmpre
CREATE USER 'CLIENTE'@'localhost'
 IDENTIFIED BY 'cliente123';

 GRANT SELECT ON bdEmpre.PROJETO TO 'CLIENTE'@'localhost';
 GRANT SELECT ON bdEmpre.TRABALHO TO 'CLIENTE'@'localhost';
 GRANT SELECT ON bdEmpre.trabalha TO 'CLIENTE'@'localhost';
 GRANT SELECT ON bdEmpre.PROFISSIONAL TO 'CLIENTE'@'localhost';

-- Cria usuario 'PROFISSIONAL' da base de dados bdEmpre
CREATE USER 'usuario'@'localhost'
 IDENTIFIED BY 'profissional123';

 GRANT SELECT ON bdEmpre.PROJETO TO 'CLIENTE'@'localhost';
 GRANT SELECT ON bdEmpre.TRABALHO TO 'CLIENTE'@'localhost';
 GRANT SELECT ON bdEmpre.CLIENTE TO 'CLIENTE'@'localhost';