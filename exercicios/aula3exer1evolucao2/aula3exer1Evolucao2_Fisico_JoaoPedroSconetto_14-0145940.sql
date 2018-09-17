-- --------              aula3exer1evolucao2            ------------ --
--                                                                   --
--                    SCRIPT DE CRIAÇÃO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 02/09/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 09/09/2018                              --
--   			                                                           --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula3exer1evolucao2;

USE aula3exer1evolucao2;

CREATE TABLE Setor (
  nome varchar(100) NOT NULL,
  CONSTRAINT setor_PK PRIMARY KEY (nome)
) ENGINE=InnoDB;

CREATE TABLE Especialidade (
  tipo_especialidade_medica varchar(50) NOT NULL,
  CONSTRAINT tipo_especialidade_PK PRIMARY KEY (tipo_especialidade_medica)
) ENGINE=InnoDB;

CREATE TABLE Plantonista (
  nome varchar(200) NOT NULL,
  matricula_funcional bigint NOT NULL,
  sexo enum('f', 'm') NOT NULL,
  tipo_especialidade varchar(50) NOT NULL,
  CONSTRAINT plantonista_PK PRIMARY KEY (matricula_funcional),
  CONSTRAINT tipo_especialidade_FK FOREIGN KEY (tipo_especialidade) REFERENCES Especialidade (tipo_especialidade_medica)
) ENGINE=InnoDB;

CREATE TABLE alocado (
  matricula_funcional_plantonista bigint NOT NULL,
  nome_setor varchar(100) NOT NULL,
  data_inicio_alocacao datetime NOT NULL,
  data_fim_alocacao datetime NOT NULL,
  CONSTRAINT alocacao_PK PRIMARY KEY (data_inicio_alocacao, data_fim_alocacao, nome_setor, matricula_funcional_plantonista),
  CONSTRAINT matricula_funcional_plantonista_FK FOREIGN KEY (matricula_funcional_plantonista) REFERENCES Plantonista (matricula_funcional),
  CONSTRAINT nome_setor_FK FOREIGN KEY (nome_setor) REFERENCES Setor (nome)
) ENGINE=InnoDB;
