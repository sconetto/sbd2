-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 13/10/2018 
--   => 
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
-- --------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS bdEmpre;

USE bdEmpre;

CREATE TABLE IF NOT EXISTS CLIENTE (
tipoDocumento varchar(20) NOT NULL,
numeroDocumento bigint NOT NULL,
nomeCliente varchar(40) NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (numeroDocumento, tipoDocumento)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS telefone (
numeroDocumento bigint NOT NULL,
telefone bigint NOT NULL,
CONSTRAINT telefone_PK PRIMARY KEY(numeroDocumento, telefone),
CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY(numeroDocumento) REFERENCES CLIENTE(numeroDocumento)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS PROFISSIONAL (
matriculaProfissional int NOT NULL,
nomeProfissional varchar(100) NOT NULL,
especialidadeProfissional varchar(100) NOT NULL,
CONSTRAINT PROFISSIONAL_PK PRIMARY KEY (matriculaProfissional)
)ENGINE = InnoDB;

CREATE TABLE CONTRATO (
dataContrato date NOT NULL,
valorContrato float NOT NULL,
idContrato int NOT NULL,
CONSTRAINT PROFISSIONAL_PK PRIMARY KEY (idContrato)
)ENGINE = InnoDB;

CREATE TABLE PROJETO (
idProjeto int NOT NULL AUTO_INCREMENT,
descProjeto varchar(100) NOT NULL,
idContrato int NOT NULL,
numeroDocumento bigint NOT NULL,
CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto),
CONSTRAINT PROJETO_CLIENTE_FK FOREIGN KEY(numeroDocumento) REFERENCES CLIENTE (numeroDocumento),
CONSTRAINT PROJETO_CONTRATO_FK FOREIGN KEY(idContrato) REFERENCES CONTRATO (idContrato)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE trabalha (
idProjeto int NOT NULL,
matriculaProfissional int NOT NULL,
valorProfissional float NOT NULL,
CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY(idProjeto) REFERENCES PROJETO (idProjeto),
CONSTRAINT trabalha_PROFISSIONAL_FK FOREIGN KEY(matriculaProfissional) REFERENCES PROFISSIONAL (matriculaProfissional)
)ENGINE = InnoDB;

