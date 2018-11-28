-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script Apaga
-- ==   01 = Base de dados
-- ==        nome:bdEscola
-- ==   09 = Tabelas
-- ==   02 = Usuários
-- == Autor: João Pedro Sconetto
-- == Data: 24/10/2018
-- ==============================

USE bdEscola;

-- Apaga as Tabelas
DROP TABLE ENDERECO;
DROP TABLE formado;
DROP TABLE FORMACAO;
DROP TABLE EMAIL;
DROP TABLE matricula_ingressa;
DROP TABLE ALUNO;
DROP TABLE PROFESSOR;
DROP TABLE ESCOLA;
DROP TABLE PESSOA;

-- Apaga os usuários
DROP USER IF EXISTS 'gerente'@'localhost';
DROP USER IF EXISTS 'usuario'@'localhost';

-- Apaga as views
DROP VIEW IF EXISTS AlunosEscolaMatriculaVIEW;