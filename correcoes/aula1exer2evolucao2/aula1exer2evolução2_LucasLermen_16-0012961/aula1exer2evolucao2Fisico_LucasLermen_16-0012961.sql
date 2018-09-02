-- --------            aula1exer2	                ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ...........: 23/08/2018                              --
-- Autor(es) ..............: Lucas Arthur Lermen                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2evolucao2		     --
--                                                                   --
-- Data Ultima Alteracao ..: 		                             --
--   			                                             --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 8 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula1exer2evolucao2;


USE aula1exer2evolucao2;

CREATE TABLE IF NOT EXISTS PESSOA (
    cpfPessoa BIGINT NOT NULL,
    senha VARCHAR(20) NOT NULL,
    nome VARCHAR(40) NOT NULL,
 CONSTRAINT PESSOA_PK PRIMARY KEY(cpfPessoa)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS PRODUTO(
    codProduto BIGINT NOT NULL,
    precoUnitario FLOAT NOT NULL,
    descProduto VARCHAR(50) NOT NULL,
 CONSTRAINT PRODUTO_PK PRIMARY KEY(codProduto)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS EMPREGADO(
    matricula BIGINT NOT NULL,
    cpfPessoa BIGINT NOT NULL,
    rua VARCHAR(40) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    lote INT NOT NULL,
    cep BIGINT,
 CONSTRAINT EMPREGADO_PK PRIMARY KEY(matricula),
 CONSTRAINT EMPREGADO_PESSOA_FK foreign key(cpfPessoa) REFERENCES PESSOA(cpfPessoa)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS GERENTE(
    formacao VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL,
    cpfPessoa BIGINT NOT NULL,
 CONSTRAINT GERENTE_PK PRIMARY KEY(email),
 CONSTRAINT GERENTE_PESSOA_FK foreign key(cpfPessoa) REFERENCES PESSOA(cpfPessoa)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS TELEFONE(
    matricula BIGINT NOT NULL,
    telefone BIGINT NOT NULL,
 CONSTRAINT TELEFONE_EMPREGADO_FK FOREIGN KEY(matricula) REFERENCES EMPREGADO(matricula)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS supervisiona(
    matricula BIGINT NOT NULL,
    email VARCHAR(30) NOT NULL,
 CONSTRAINT supervisiona_PK PRIMARY KEY(matricula,email),
 CONSTRAINT supervisiona_EMPREGADO_FK FOREIGN KEY(matricula) REFERENCES EMPREGADO(matricula),
 CONSTRAINT supervisiona_GERENTE_FK FOREIGN KEY(email) REFERENCES GERENTE(email)
)ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS VENDA(
    precoTotal FLOAT NOT NULL,
    dataVenda DATE NOT NULL,
    codVenda BIGINT NOT NULL,
    matricula BIGINT NOT NULL,
 CONSTRAINT VENDA_PK PRIMARY KEY(codVenda),
 CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY(matricula) REFERENCES EMPREGADO(matricula)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS participa(
    quantidade INT NOT NULL,
    codVenda BIGINT NOT NULL,
    codProduto BIGINT NOT NULL,
 CONSTRAINT participa_PK PRIMARY KEY(codVenda,codProduto),
 CONSTRAINT participa_PRODUTO_FK FOREIGN KEY(codProduto) REFERENCES PRODUTO(codProduto),
 CONSTRAINT participa_VENDA_FK FOREIGN KEY(codVenda) REFERENCES VENDA(codVenda)
)ENGINE = InnoDB;
