

CREATE DATABASE IF NOT EXISTS bdEmpre;

USE bdEmpre;

CREATE TABLE if not exists CLIENTE (
documentos int(11)      NOT NULL AUTO_INCREMENT,
nome       varchar(100) NOT NULL,
telefones  bigint(50) NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (documentos)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE if not exists telefone (
documentos   int(11)     NOT NULL,
telefone    numeric(11) NOT NULL,
CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY(documentos) REFERENCES CLIENTE (documentos)
)ENGINE = InnoDB;

CREATE TABLE if not exists PROFISSIONAL (
matricula   numeric(7)  NOT NULL,
nome     varchar(50) NOT NULL,
especialidade varchar(30) NOT NULL,
CONSTRAINT PROFISSIONAL_PK PRIMARY KEY (matricula)
)ENGINE = InnoDB;

CREATE TABLE if not exists PROJETO (
valorContrato     int(5)        NOT NULL,
documentos     int(5)        NOT NULL,
dtContrato date          NOT NULL,
idProjeto int(5) not null,
valorProfissional decimal(11,2) NOT NULL,
CONSTRAINT PROJETO_PK PRIMARY KEY (idProjeto),
CONSTRAINT PROJETO_CLIENTE_FK FOREIGN KEY(documentos) REFERENCES CLIENTE (documentos)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE if not exists trabalha (
idProjeto       int(5)       NOT NULL,
matricula            numeric(7)   NOT NULL,
valor decimal(8,2) NOT NULL,
CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY(idProjeto) REFERENCES PROJETO (idProjeto),
CONSTRAINT trabalha_PROFISSIONAL FOREIGN KEY(matricula) REFERENCES PROFISSIONAL (matricula)
)ENGINE = InnoDB;
