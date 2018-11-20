-- --------       << SBD2 P1 2018-2 >>       ------------ --
--
--          SCRIPT DE CRIACAO DE USUARIOS (DDL)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: bdEscola
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--         => 01 Visao
--         => 02 Usuarios
--
-- ------------------------------------------------------ --

-- Cria usuario/perfil GERENTE
CREATE USER 'gerente' IDENTIFIED BY 'senh@';


-- Define privilegios do GERENTE
GRANT SELECT,INSERT, UPDATE, DELETE
  ON bdEscola.* TO 'gerente';




-- Cria usuario/perfil USUARIO
CREATE USER 'usuario' IDENTIFIED BY 'ususenh@';


-- Define privilegios do USUARIO
GRANT SELECT ON bdEscola.* TO 'usuario';

