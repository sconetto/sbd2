-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script Fisico - Criação
-- ==   01 = Base de dados
-- ==        nome:bdEscola
-- ==   09 = Tabelas
-- ==   02 = Usuários
-- == Autor: João Pedro Sconetto
-- == Data: 24/10/2018
-- ==============================

CREATE DATABASE IF NOT EXISTS bdEscola;

USE bdEscola;

CREATE TABLE PESSOA (
    nomePessoa varchar(200) NOT NULL,
    dtNascimento date NOT NULL,
    cpf bigint NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
)Engine=InnoDB;

CREATE TABLE ESCOLA (
    nomeEscola varchar(200) NOT NULL,
    cgc int NOT NULL,
    CONSTRAINT ESCOLA_PK PRIMARY KEY (cgc)
)Engine=InnoDB;

CREATE TABLE PROFESSOR (
    matriculaFuncional bigint NOT NULL,
    cpfProfessor_FK bigint NOT NULL,
    CONSTRAINT PROFESSOR_PK PRIMARY KEY (matriculaFuncional),
    CONSTRAINT PESSOA_PROFESSOR_FK FOREIGN KEY (cpfProfessor_FK) REFERENCES PESSOA(cpf)
)Engine=InnoDB;

CREATE TABLE ALUNO (
    matriculaAluno bigint NOT NULL,
    cpfAluno_FK bigint NOT NULL,
    professorOrientadorMatricula_FK bigint NOT NULL,
    CONSTRAINT ALUNO_PK PRIMARY KEY (matriculaAluno),
    CONSTRAINT PESSOA_ALUNO_FK FOREIGN KEY (cpfAluno_FK) REFERENCES PESSOA(cpf),
    CONSTRAINT PROFESSOR_ALUNO_FK FOREIGN KEY (professorOrientadorMatricula_FK) REFERENCES PROFESSOR (matriculaFuncional)
)Engine=InnoDB;

CREATE TABLE matricula_ingressa (
    dtIngresso date NOT NULL,
    curso varchar(100) NOT NULL,
    matriculaAluno_FK bigint NOT NULL,
    cgcEscola_FK int NOT NULL,
    CONSTRAINT MATRICULA_PK PRIMARY KEY (dtIngresso, curso, matriculaAluno_FK),
    CONSTRAINT MATRICULA_ALUNO_FK FOREIGN KEY (matriculaAluno_FK) REFERENCES ALUNO (matriculaAluno),
    CONSTRAINT MATRICULA_ESCOLA_FK FOREIGN KEY (cgcEscola_FK) REFERENCES ESCOLA (cgc)
)Engine=InnoDB;

CREATE TABLE EMAIL (
    idEmail int NOT NULL AUTO_INCREMENT,
    email varchar(200) NOT NULL,
    aluno_FK bigint NOT NULL,
    CONSTRAINT EMAIL_PK PRIMARY KEY (idEmail),
    CONSTRAINT EMAIL_ALUNO_FK FOREIGN KEY (aluno_FK) REFERENCES ALUNO (matriculaAluno)
)Engine=InnoDB AUTO_INCREMENT=0;

CREATE TABLE FORMACAO (
    nomeCurso varchar(100) NOT NULL,
    classificacao enum('g', 'e', 'p', 'x') NOT NULL,
    CONSTRAINT FORMACAO_PK PRIMARY KEY (nomeCurso)
)Engine=InnoDB;

CREATE TABLE formado (
    matriculaProfessor_FK bigint NOT NULL,
    cursoFormacao_FK varchar(100) NOT NULL,
    idFormado int NOT NULL AUTO_INCREMENT,
    CONSTRAINT FORMADO_PK PRIMARY KEY (idFormado),
    CONSTRAINT FORMADO_FORMACAO_FK FOREIGN KEY (cursoFormacao_FK) REFERENCES FORMACAO (nomeCurso),
    CONSTRAINT FORMADO_PROFESSOR_FK FOREIGN KEY (matriculaProfessor_FK) REFERENCES PROFESSOR (matriculaFuncional)
)Engine=InnoDB AUTO_INCREMENT=0;

CREATE TABLE ENDERECO (
    logradouro varchar(100) NOT NULL,
    bairro varchar(100) NOT NULL,
    estado varchar(2) NOT NULL,
    cep bigint NOT NULL,
    cidade varchar(100) NOT NULL,
    idEndereco int NOT NULL AUTO_INCREMENT,
    escola_FK int NOT NULL,
    CONSTRAINT ENDERECO_PK PRIMARY KEY (idEndereco),
    CONSTRAINT ENDERECO_ESCOLA_FK FOREIGN KEY (escola_FK) REFERENCES ESCOLA (cgc)
)Engine=InnoDB AUTO_INCREMENT=0;