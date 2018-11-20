-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script Fisico - Criação
-- ==   01 = Base de dados
-- ==   09 = Tabelas
-- == Autor: João Pedro Sconetto
-- == Data: 19/11/2018
-- ==============================

-- Oracle
CREATE TABLE JPS_PESSOA (
    nomePessoa varchar2(200) NOT NULL,
    dtNascimento date NOT NULL,
    cpf number(11) NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
);

CREATE TABLE JPS_ESCOLA (
    nomeEscola varchar2(200) NOT NULL,
    cgc number(10) NOT NULL,
    CONSTRAINT ESCOLA_PK PRIMARY KEY (cgc)
);

CREATE TABLE JPS_PROFESSOR (
    matriculaFuncional number(19) NOT NULL,
    cpfProfessor_FK number(11) NOT NULL,
    CONSTRAINT PROFESSOR_PK PRIMARY KEY (matriculaFuncional),
    CONSTRAINT PESSOA_PROFESSOR_FK FOREIGN KEY (cpfProfessor_FK) REFERENCES JPS_PESSOA(cpf)
);

CREATE TABLE JPS_ALUNO (
    matriculaAluno number(19) NOT NULL,
    cpfAluno_FK number(11) NOT NULL,
    profOrientadorMatricula_FK number(11) NOT NULL,
    CONSTRAINT ALUNO_PK PRIMARY KEY (matriculaAluno),
    CONSTRAINT PESSOA_ALUNO_FK FOREIGN KEY (cpfAluno_FK) REFERENCES JPS_PESSOA(cpf),
    CONSTRAINT PROFESSOR_ALUNO_FK FOREIGN KEY (profOrientadorMatricula_FK) REFERENCES JPS_PROFESSOR (matriculaFuncional)
);

CREATE TABLE JPS_matricula_ingressa (
    dtIngresso date NOT NULL,
    curso varchar2(100) NOT NULL,
    matriculaAluno_FK number(19) NOT NULL,
    cgcEscola_FK number(10) NOT NULL,
    CONSTRAINT MATRICULA_PK PRIMARY KEY (dtIngresso, curso, matriculaAluno_FK),
    CONSTRAINT MATRICULA_ALUNO_FK FOREIGN KEY (matriculaAluno_FK) REFERENCES JPS_ALUNO (matriculaAluno),
    CONSTRAINT MATRICULA_ESCOLA_FK FOREIGN KEY (cgcEscola_FK) REFERENCES JPS_ESCOLA (cgc)
);

CREATE TABLE JPS_EMAIL (
    idEmail number(10) NOT NULL,
    email varchar2(200) NOT NULL,
    aluno_FK number(11) NOT NULL,
    CONSTRAINT EMAIL_PK PRIMARY KEY (idEmail),
    CONSTRAINT EMAIL_ALUNO_FK FOREIGN KEY (aluno_FK) REFERENCES JPS_ALUNO (matriculaAluno)
);

-- Gerando ID usando sequence e trigger
CREATE SEQUENCE JPS_EMAIL_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER JPS_EMAIL_seq_tr
 BEFORE INSERT ON JPS_EMAIL FOR EACH ROW
 WHEN (NEW.idEmail IS NULL)
BEGIN
 SELECT JPS_EMAIL_seq.NEXTVAL INTO :NEW.idEmail FROM DUAL;
END;

CREATE TABLE JPS_FORMACAO (
  nomeCurso varchar2(100) NOT NULL,
  classificacao varchar2(1) CHECK(classificacao IN ('g', 'e', 'p', 'x')) NOT NULL,
  CONSTRAINT FORMACAO_PK PRIMARY KEY (nomeCurso)
);

CREATE TABLE JPS_formado (
    matriculaProfessor_FK number(11) NOT NULL,
    cursoFormacao_FK varchar2(100) NOT NULL,
    idFormado number(10) NOT NULL,
    CONSTRAINT FORMADO_PK PRIMARY KEY (idFormado),
    CONSTRAINT FORMADO_FORMACAO_FK FOREIGN KEY (cursoFormacao_FK) REFERENCES JPS_FORMACAO (nomeCurso),
    CONSTRAINT FORMADO_PROFESSOR_FK FOREIGN KEY (matriculaProfessor_FK) REFERENCES JPS_PROFESSOR (matriculaFuncional)
);

-- Gerando ID usando sequence e trigger
CREATE SEQUENCE JPS_formado_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER JPS_formado_seq_tr
 BEFORE INSERT ON JPS_formado FOR EACH ROW
 WHEN (NEW.idFormado IS NULL)
BEGIN
 SELECT JPS_formado_seq.NEXTVAL INTO :NEW.idFormado FROM DUAL;
END;

CREATE TABLE JPS_ENDERECO (
    logradouro varchar2(100) NOT NULL,
    bairro varchar2(100) NOT NULL,
    estado varchar2(2) NOT NULL,
    cep number(8) NOT NULL,
    cidade varchar2(100) NOT NULL,
    idEndereco number(10) NOT NULL,
    escola_FK number(10) NOT NULL,
    CONSTRAINT ENDERECO_PK PRIMARY KEY (idEndereco),
    CONSTRAINT ENDERECO_ESCOLA_FK FOREIGN KEY (escola_FK) REFERENCES JPS_ESCOLA (cgc)
);

-- Gerando ID usando sequence e trigger
CREATE SEQUENCE JPS_ENDERECO_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER JPS_ENDERECO_seq_tr
 BEFORE INSERT ON JPS_ENDERECO FOR EACH ROW
 WHEN (NEW.idEndereco IS NULL)
BEGIN
 SELECT JPS_ENDERECO_seq.NEXTVAL INTO :NEW.idEndereco FROM DUAL;
END;
