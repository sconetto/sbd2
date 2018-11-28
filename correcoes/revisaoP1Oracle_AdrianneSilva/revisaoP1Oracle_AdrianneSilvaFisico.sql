-- --------            << SBD2 P1 2018-2 >>            ------------ --
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
--                          Adrianne Alves
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: FGA_SBD
--
-- Data Ultima Alteracao ..: 19/11/2018
--    + Ajustes no script para ORACLE
--
-- PROJETO => 01 Base de Dados
--         => 9 Tabelas
--         => 02 Sequences
--         => 02 Triggers
--
-- ----------------------------------------------------------------- --

CREATE TABLE AAS_PESSOA (
    cpf NUMBER(11) NOT NULL PRIMARY KEY,
    nomePessoa   VARCHAR2(100) NOT NULL,
    dtNascimento DATE         NOT NULL
);

CREATE TABLE AAS_ESCOLA (
    cgc        NUMBER(19) NOT NULL PRIMARY KEY,
    nomeEscola VARCHAR2(100) NOT NULL,
    logradouro VARCHAR2(100) NOT NULL,
    estado     VARCHAR2(2)   NOT NULL,
    cidade     VARCHAR2(100) NOT NULL,
    cep        NUMBER(10) NOT NULL,
    bairro     VARCHAR2(100) NOT NULL
);

-- RESTRICT: Rejeita a operação de exclusão ou atualização da tabela pai.
-- Especificar RESTRICT (ou NO ACTION) é o mesmo que omitir a cláusula ON DELETE ou ON UPDATE.

CREATE TABLE AAS_PROFESSOR (
    matriculaFuncional NUMBER(10) NOT NULL PRIMARY KEY,
    cpf                NUMBER(11) NOT NULL,
  CONSTRAINT AAS_PROFESSOR_PESSOA_FK FOREIGN KEY (cpf)
    REFERENCES AAS_PESSOA(cpf)
);

CREATE TABLE AAS_ALUNO (
    matriculaEstudantil NUMBER(10) NOT NULL PRIMARY KEY,
    cpf                 NUMBER(11) NOT NULL,
    matriculaFuncional  NUMBER(10) NOT NULL,   -- Orientador
  CONSTRAINT AAS_ALUNO_PESSOA_FK FOREIGN KEY (cpf)
    REFERENCES AAS_PESSOA (cpf),
  CONSTRAINT AAS_ALUNO_PROFESSOR_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES AAS_PROFESSOR (matriculaFuncional)
);

--Problema com o enum
CREATE TABLE AAS_CURSO (
    idCurso       NUMBER(10)          NOT NULL PRIMARY KEY,
    nomeCurso     VARCHAR2(100) NOT NULL,
    classificacao VARCHAR2(1) NOT NULL check (classificacao in ('G','E','P','X'))
);

CREATE TABLE AAS_CURSO_TECNICO (
    idCursoTecnico   NUMBER(10) NOT NULL PRIMARY KEY,
    nomeCursoTecnico VARCHAR2(100) NOT NULL
);

CREATE TABLE AAS_email(
    email               VARCHAR2(256) NOT NULL,
    matriculaEstudantil NUMBER(10)         NOT NULL,
  CONSTRAINT AAS_email_ALUNO_FK FOREIGN KEY (matriculaEstudantil)
    REFERENCES AAS_ALUNO (matriculaEstudantil)
);

CREATE TABLE AAS_ingressa (
    matriculaEstudantil NUMBER(10)    NOT NULL,
    cgc                 NUMBER(19) NOT NULL,
    dtIngresso          DATE   NOT NULL,
    idCursoTecnico NUMBER(10) NOT NULL,
  CONSTRAINT AAS_ingressa_ALUNO_FK FOREIGN KEY (matriculaEstudantil)
    REFERENCES AAS_ALUNO (matriculaEstudantil),
  CONSTRAINT AAS_ingressa_ESCOLA_FK FOREIGN KEY (cgc)
    REFERENCES AAS_ESCOLA (cgc),
  CONSTRAINT AAS_ingressa_CURSO_TECNICO_FK FOREIGN KEY (idCursoTecnico)
    REFERENCES AAS_CURSO_TECNICO(idCursoTecnico)
);

CREATE TABLE AAS_formado (
    idCurso            NUMBER(10) NOT NULL,
    matriculaFuncional NUMBER(10) NOT NULL,
  CONSTRAINT AAS_formado_CURSO_FK FOREIGN KEY (idCurso)
    REFERENCES AAS_CURSO (idCurso),
  CONSTRAINT AAS_formado_PROFESSOR_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES AAS_PROFESSOR (matriculaFuncional)
);

-- SEQUENCE e Trigger para criar auto incremento no atributo idCurso da tabela AAS_CURSO

CREATE SEQUENCE AAS_Curso_id_SEQ
  START WITH 1
  MAXVALUE 9999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

CREATE OR REPLACE TRIGGER AAS_Curso_id
  before insert ON AAS_CURSO
  for each row
begin
  if :NEW.idCurso is null then
    select AAS_Curso_id_SEQ.nextval into :NEW.idCurso from dual;
  end if;
end;

-- SEQUENCE E Trigger para criar auto incremento no atributo idCursoTecnico da tabela AAS_CURSO_TECNICO

CREATE SEQUENCE AAS_Curso_Tecnico_id_SEQ
  START WITH 1
  MAXVALUE 9999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;

CREATE OR REPLACE TRIGGER AAS_CursoTecnico_id
  before insert ON AAS_CURSO_TECNICO
  for each row
begin
  if :NEW.idCursoTecnico is null then
    select  AAS_Curso_Tecnico_id_SEQ.nextval into :NEW.idCursoTecnico from dual;
  end if;
end;
