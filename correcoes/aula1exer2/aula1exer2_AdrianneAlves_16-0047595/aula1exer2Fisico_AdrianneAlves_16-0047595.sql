-- --------                                             ------------ --
--                                                                   --
--                          SCRIPT SQL                               --
--                                                                   --
-- Data Criacao ...........: 20/08/2018                              --
-- Autor(es) ..............: Adrianne Alves da Silva                 --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2                              --
--                                                                   --
-- Data Ultima Alteracao ..:                                         --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 7 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula1exer2;

USE aula1exer2;

CREATE TABLE IF NOT EXISTS PRODUTO(
    codProduto BIGINT NOT NULL,
    precoUnitario FLOAT NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY(codProduto)
)ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS EMPREGADO(
    nome VARCHAR(40) NOT NULL,
    matricula BIGINT NOT NULL,
    cpfEmpregado BIGINT NOT NULL,
    senha VARCHAR(20) NOT NULL,
    rua VARCHAR(40) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    lote INT NOT NULL,
    cep BIGINT ,
    CONSTRAINT PRODUTO_PK PRIMARY KEY(cpfEmpregado)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS GERENTE(
    formacao VARCHAR(40) NOT NULL,
    email VARCHAR(30) NOT NULL,
    cpfGerente BIGINT NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY(cpfGerente)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS TELEFONE(
    cpfEmpregado BIGINT NOT NULL,
    telefone BIGINT NOT NULL,
    CONSTRAINT TELEFONE_PK PRIMARY KEY(cpfEmpregado), 
    CONSTRAINT TELEFONE_EMPREGADO_FK FOREIGN KEY(cpfEmpregado) REFERENCES EMPREGADO(cpfEmpregado)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS supervisiona(
    cpfEmpregado BIGINT NOT NULL,
    cpfGerente BIGINT NOT NULL,
    CONSTRAINT supervisiona_PK PRIMARY KEY(cpfEmpregado,cpfGerente), 
    CONSTRAINT supervisiona_EMPREGADO_FK FOREIGN KEY(cpfEmpregado) REFERENCES EMPREGADO(cpfEmpregado),
    CONSTRAINT supervisiona_GERENTE_FK FOREIGN KEY(cpfGerente) REFERENCES GERENTE(cpfGerente)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS VENDA(
    precoTotal FLOAT NOT NULL,
    dataVenda DATE NOT NULL,
    codVenda BIGINT NOT NULL,
    cpfVendedor BIGINT NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY(codVenda), 
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY(cpfVendedor) REFERENCES EMPREGADO(cpfEmpregado)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS participa(
    quantidade INT NOT NULL,
    codVenda BIGINT NOT NULL,
    codProduto BIGINT NOT NULL,
    CONSTRAINT participa_PK PRIMARY KEY(codVenda,codProduto), 
    CONSTRAINT participa_PRODUTO_FK FOREIGN KEY(codProduto) REFERENCES PRODUTO(codProduto),
    CONSTRAINT participa_VENDA_FK FOREIGN KEY(codVenda) REFERENCES VENDA(codVenda)
)ENGINE=InnoDB;