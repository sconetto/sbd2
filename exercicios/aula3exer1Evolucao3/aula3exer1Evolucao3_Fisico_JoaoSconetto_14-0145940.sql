-- --------              aula3exer1evolucao3            ------------ --
--                                                                   --
--                    SCRIPT DE CRIAÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                         : Filipe Toyoshima Silva                  --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao3                     --
--                                                                   --
-- Data Ultima Alteracao ..: 11/09/2018                              --
--                           14/10/2018 - ajustando a consulta para  --
--                             a terceira evolução do exercício      --
--   			                                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                             --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula3exer1evolucao3;

USE aula3exer1evolucao3;

CREATE TABLE IF NOT EXISTS Setor (
  nomeSetor varchar(100) NOT NULL,
  idSetor int NOT NULL AUTO_INCREMENT,
  CONSTRAINT setor_PK PRIMARY KEY (idSetor)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Especialidade (
  idEspecialidade int NOT NULL AUTO_INCREMENT,
  descEspecialidade varchar(50) NOT NULL,
  CONSTRAINT Especialidade_PK PRIMARY KEY (idEspecialidade)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Plantonista (
  nomePlantonista varchar(200) NOT NULL,
  matriculaFuncional bigint NOT NULL,
  sexoPlantonista enum('f', 'm') NOT NULL,
  idEspecialidade int NOT NULL,
  CONSTRAINT plantonista_PK PRIMARY KEY (matriculaFuncional),
  CONSTRAINT Plantonista_Especialidade_FK FOREIGN KEY (idEspecialidade) REFERENCES Especialidade (idEspecialidade)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS alocado (
  matriculaFuncional bigint NOT NULL,
  idSetor int NOT NULL,
  horarioInicio datetime NOT NULL,
  horarioTermino datetime NOT NULL,
  CONSTRAINT Plantonista_alocado_PK PRIMARY KEY (horarioInicio, horarioTermino, matriculaFuncional),
  CONSTRAINT alocado_plantonista_FK FOREIGN KEY (matriculaFuncional) REFERENCES Plantonista (matriculaFuncional),
  CONSTRAINT setor_aloca_FK FOREIGN KEY (idSetor) REFERENCES Setor (idSetor)
) ENGINE=InnoDB;