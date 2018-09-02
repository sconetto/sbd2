-- --------                aula3exer1     	            ------------ --
--                                                                   --
--                    SCRIPT DE CRIAÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1                              --
--                                                                   --
-- Data Ultima Alteracao ..: 		                                     --
--   			                                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula3exer1;

USE aula3exer1;

CREATE TABLE Setor (
  nome varchar(100) NOT NULL,
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  CONSTRAINT setor_PK PRIMARY KEY (nome)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE Especialidade (
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  tipo_especialidade_medica varchar(50) NOT NULL,
  CONSTRAINT tipo_especialidade_PK PRIMARY KEY (tipo_especialidade_medica)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE Plantonista (
  nome varchar(200) NOT NULL,
  matricula_funcional bigint NOT NULL,
  sexo enum('f', 'm') NOT NULL,
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  tipo_especialidade varchar(50) NOT NULL,
  CONSTRAINT plantonista_PK PRIMARY KEY (matricula_funcional),
  CONSTRAINT tipo_especialidade_FK FOREIGN KEY (tipo_especialidade) REFERENCES Especialidade (tipo_especialidade_medica)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE alocado (
  matricula_funcional_plantonista bigint NOT NULL,
  nome_setor varchar(100) NOT NULL,
  horario_alocacao datetime NOT NULL,
  id int NOT NULL UNIQUE AUTO_INCREMENT,
  CONSTRAINT horario_alocacao_PK PRIMARY KEY (horario_alocacao, nome_setor, matricula_funcional_plantonista),
  CONSTRAINT matricula_funcional_plantonista_FK FOREIGN KEY (matricula_funcional_plantonista) REFERENCES Plantonista (matricula_funcional),
  CONSTRAINT nome_setor_FK FOREIGN KEY (nome_setor) REFERENCES Setor (nome)
) ENGINE=InnoDB AUTO_INCREMENT=0;
