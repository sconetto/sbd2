-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   => 
-- 
-- PROJETO => 1 Base de Dados
--         => 4 Tabelas
-- --------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS bdEmpre;

USE bdEmpre;

CREATE TABLE CLIENTE (
documentos int(5)      NOT NULL AUTO_INCREMENT,
nome       varchar(100) NOT NULL,
telefones  bigint(50) NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (documentos)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefone (
documentos   int(5)     NOT NULL,
telefones    numeric(11) NOT NULL,
CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY(documentos) REFERENCES CLIENTE (documentos)
)ENGINE = InnoDB;

CREATE TABLE PROSSIONAL (
matricula   numeric(7)  NOT NULL,
nome     varchar(50) NOT NULL,
especialidade varchar(30) NOT NULL,
CONSTRAINT PROFISSIONAL_PK PRIMARY KEY (crea),
)ENGINE = InnoDB

CREATE TABLE PROJETO (
valorContrato     int(5)        NOT NULL AUTO_INCREMENT,
documentos     int(5)        NOT NULL,
dtContrato date          NOT NULL,
valorProfissional decimal(11,2) NOT NULL,
CONSTRAINT PROJETO_PK PRIMARY KEY (valorContrato),
CONSTRAINT PROJETO_CLIENTE_FK FOREIGN KEY(documentos) REFERENCES CLIENTE (documentos)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE trabalha (
valorContrato       int(5)       NOT NULL,
matricula            numeric(7)   NOT NULL,
valor decimal(8,2) NOT NULL,
CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY(valorContrato) REFERENCES PROJETO (valorContrato),
CONSTRAINT trabalha_PROFISSIONAL FOREIGN KEY(matricula) REFERENCES PROFISSIONAL (matricula)
)ENGINE = InnoDB;
