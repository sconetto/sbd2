-- --------       << SBD2 P1 2018-2 >>       ------------ --
--
--                    SCRIPT DE APAGA (DDL)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
--                          Adrianne Alves
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: FGA_SBD
--
-- Data Ultima Alteracao ..: 20/11/2018
--    + Ajustes nos scripts para deletar no oracle
--
-- PROJETO => 01 Base de Dados
--         => 9 Tabelas
--         => 02 Sequences
--         => 02 Triggers
--
-- ----------------------------------------------------------------- --


-- Apagando todas Tabelas
DROP TABLE "AAS_PESSOA" CASCADE CONSTRAINTS;
DROP TABLE "AAS_ESCOLA" CASCADE CONSTRAINTS;
DROP TABLE "AAS_PROFESSOR" CASCADE CONSTRAINTS;
DROP TABLE "AAS_ALUNO" CASCADE CONSTRAINTS;
DROP TABLE "AAS_CURSO" CASCADE CONSTRAINTS;
DROP TABLE "AAS_CURSO_TECNICO" CASCADE CONSTRAINTS;
DROP TABLE "AAS_email" CASCADE CONSTRAINTS;
DROP TABLE "AAS_ingressa" CASCADE CONSTRAINTS;
DROP TABLE "AAS_formado" CASCADE CONSTRAINTS;

-- Apagando as sequences

DROP SEQUENCE AAS_Curso_id_SEQ;
DROP SEQUENCE AAS_Curso_Tecnico_id_SEQ;
