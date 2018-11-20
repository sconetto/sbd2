-- --------            << SBD2 P1 2018-2 >>            ------------ --
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: bdEscola
--
-- Data Ultima Alteracao ..: 04/11/2018
--    + Ajustes nos scripts
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--         => 01 Visao
--         => 02 Usuarios
--
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS bdEscola;

USE bdEscola;

CREATE TABLE PESSOA (
    cpf          BIGINT       NOT NULL PRIMARY KEY,
    nomePessoa   VARCHAR(100) NOT NULL,
    dtNascimento DATE         NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE ESCOLA (
    cgc        BIGINT       NOT NULL PRIMARY KEY,
    nomeEscola VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    estado     VARCHAR(2)   NOT NULL,
    cidade     VARCHAR(100) NOT NULL,
    cep        INT          NOT NULL,
    bairro     VARCHAR(100)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE PROFESSOR (
    matriculaFuncional INT NOT NULL PRIMARY KEY,
    cpf                BIGINT NOT NULL,
  CONSTRAINT PROFESSOR_PESSOA_FK FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE ALUNO (
    matriculaEstudantil INT NOT NULL PRIMARY KEY,
    cpf                 BIGINT NOT NULL,
    matriculaFuncional  INT NOT NULL,   -- Orientador
  CONSTRAINT ALUNO_PESSOA_FK FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT ALUNO_PROFESSOR_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES PROFESSOR (matriculaFuncional)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE CURSO (
    idCurso       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCurso     VARCHAR(100) NOT NULL,
    classificacao ENUM('G','E','P','X') NOT NULL
)ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE CURSO_TECNICO (
    idCursoTecnico   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCursoTecnico VARCHAR(100) NOT NULL
)ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE email (
    email               VARCHAR(256) NOT NULL,
    matriculaEstudantil INT          NOT NULL,
  CONSTRAINT email_ALUNO_FK FOREIGN KEY (matriculaEstudantil)
    REFERENCES ALUNO (matriculaEstudantil)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE ingressa (
    matriculaEstudantil INT    NOT NULL,
    cgc                 BIGINT NOT NULL,
    dtIngresso          DATE   NOT NULL,
  CONSTRAINT ingressa_ALUNO_FK FOREIGN KEY (matriculaEstudantil)
    REFERENCES ALUNO (matriculaEstudantil)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT ingressa_ESCOLA_FK FOREIGN KEY (cgc)
    REFERENCES ESCOLA (cgc)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE formado (
    idCurso            INT NOT NULL,
    matriculaFuncional INT NOT NULL,
  CONSTRAINT formado_CURSO_FK FOREIGN KEY (idCurso)
    REFERENCES CURSO (idCurso)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT formado_PROFESSOR_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES PROFESSOR (matriculaFuncional)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE oferece (
    cgc            BIGINT NOT NULL,
    idCursoTecnico INT    NOT NULL,
  CONSTRAINT oferece_ESCOLA_FK FOREIGN KEY (cgc)
    REFERENCES ESCOLA (cgc)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT oferece_CURSO_TECNICO_FK FOREIGN KEY (idCursoTecnico)
    REFERENCES CURSO_TECNICO (idCursoTecnico)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
