-- --------              << EMPREENDEDORA >>            ------------ --
--                                                                   --
--                    SCRIPT DE CRIAÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 06/05/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                           e diversos                              --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: bdEmpre                                 --
--                                                                   --
-- Data Ultima Alteracao ..: 13/10/2018                              --
--   => Adequação do script para o novo modelo lógico e conceitual   --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 5 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS bdEmpre;

USE bdEmpre;

CREATE TABLE PROFISSIONAL (
    matricula int NOT NULL AUTO_INCREMENT,
    nomeCompleto varchar(500) NOT NULL,
    especialidade varchar(200) NOT NULL,
    CONSTRAINT profissional_PK PRIMARY KEY (matricula)
) ENGINE=InnoDB AUTO_INCREMENT=100;

CREATE TABLE CLIENTE (
    nomeCliente varchar(500) NOT NULL,
    tipoDocumento enum('cnpj', 'cpf') NOT NULL,
    numeroDocumento bigint NOT NULL,
    CONSTRAINT cliente_PK PRIMARY KEY (tipoDocumento, numeroDocumento)
) ENGINE=InnoDB;

CREATE TABLE PROJETO (
    dataCelebracaoContrato date NOT NULL,
    valorContrato float(12,2) NOT NULL,
    idProjeto int NOT NULL AUTO_INCREMENT,
    nomeProjeto varchar(200) NOT NULL,
    tipoDocumentoCliente_FK enum('cnpj', 'cpf') NOT NULL,
    numeroDocumentoCliente_FK bigint NOT NULL,
    CONSTRAINT projeto_PK PRIMARY KEY (idProjeto),
    CONSTRAINT cliente_FK FOREIGN KEY (tipoDocumentoCliente_FK, numeroDocumentoCliente_FK) REFERENCES CLIENTE (tipoDocumento, numeroDocumento)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE telefoneContato (
    idTelefoneContato int NOT NULL AUTO_INCREMENT,
    telefoneContato bigint NOT NULL,
    tipoDocumentoCliente_FK enum('cnpj', 'cpf') NOT NULL,
    numeroDocumentoCliente_FK bigint NOT NULL,
    CONSTRAINT telefoneContato_PK PRIMARY KEY (idTelefoneContato),
    CONSTRAINT clienteTelefone_FK FOREIGN KEY (tipoDocumentoCliente_FK, numeroDocumentoCliente_FK) REFERENCES CLIENTE (tipoDocumento, numeroDocumento)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE TRABALHA (
    matriculaProfissional_FK int NOT NULL,
    idProjeto_FK int NOT NULL,
    valorUnitarioProfissional float(12,2) NOT NULL,
    idTrabalha int NOT NULL AUTO_INCREMENT,
    CONSTRAINT trabalha_PK PRIMARY KEY (idTrabalha),
    CONSTRAINT projeto_FK FOREIGN KEY (idProjeto_FK) REFERENCES PROJETO (idProjeto),
    CONSTRAINT profissional_FK FOREIGN KEY (matriculaProfissional_FK) REFERENCES PROFISSIONAL (matricula)
) ENGINE=InnoDB AUTO_INCREMENT=0;