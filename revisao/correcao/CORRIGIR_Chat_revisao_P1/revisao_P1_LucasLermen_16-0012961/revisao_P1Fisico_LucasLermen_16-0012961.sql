-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   => 13/10/2018 por Lucas Arthur Lermen - Alterando criação de tabelas de acordo com a análise do projeto
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
-- 	   => 2 usuários
-- --------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS bdEmpre;

USE bdEmpre;

CREATE TABLE CLIENTE (
documento        varchar(15)  NOT NULL,
numeroDocumento	 int(20)      NOT NULL,
nomeRazao        varchar(50)  NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (documento, numeroDocumento)
)ENGINE = InnoDB;

CREATE TABLE telefone (
documento        varchar(15) NOT NULL,
numeroDocumento	 int(20)     NOT NULL,
telefone    	 numeric(11) NOT NULL,
CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY(documento, numeroDocumento) REFERENCES CLIENTE (documento, numeroDocumento)
)ENGINE = InnoDB;

CREATE TABLE PROFISSIONAL (
matricula     int    (10)  NOT NULL,
nome          varchar(50)  NOT NULL,
especialidade varchar(50)  NOT NULL,
CONSTRAINT PROFISSIONAL_PK PRIMARY KEY (matricula)
)ENGINE = InnoDB;

CREATE TABLE PROJETO (
idProjeto      int(4)    NOT NULL AUTO_INCREMENT,
valorContrato  float     NOT NULL,
dataContrato   date      NOT NULL,
CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TRABALHO (
idTrabalho      int(5)      NOT NULL AUTO_INCREMENT,
documento       varchar(15) NOT NULL,
numeroDocumento	int(20)     NOT NULL,
idProjeto       int(4)      NOT NULL,
CONSTRAINT TRABALHO_PK PRIMARY KEY (idTrabalho),
CONSTRAINT TRABALHO_CLIENTE_FK FOREIGN KEY(documento, numeroDocumento) REFERENCES CLIENTE (documento, numeroDocumento),
CONSTRAINT TRABALHO_PROJETO_FK FOREIGN KEY(idProjeto) REFERENCES PROJETO (idProjeto),
CONSTRAINT UC_TRABLAHO UNIQUE (idProjeto)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE trabalha (
matricula      int(10)  NOT NULL,
idTrabalho     int(5)   NOT NULL,
valorUnitario  float 	NOT NULL,
CONSTRAINT trabalha_TRABALHO_FK FOREIGN KEY(idTrabalho) REFERENCES TRABALHO (idTrabalho),
CONSTRAINT trabalha_PROFISSIONAL FOREIGN KEY(matricula) REFERENCES PROFISSIONAL (matricula)
)ENGINE = InnoDB;
