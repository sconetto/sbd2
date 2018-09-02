-- --------              aula1exer2evolucao             ------------ --
--                                                                   --
--                                                                   --
--         SCRIPT DE MANUTENCAO DA BASE DE DADOS E CONSULTA          --
--                                                                   --
-- Data Criacao ...........: 30/08/2018                              --
-- Autor(es) ..............: Adrianne Alves da Silva                 --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 31/08/2018                              --
-- Autor(es) ..............: Vandor Rissoli                          --
-- Alteracoes .............: Obrigatoriedade do novo atributo e      --
--                           ajuste da nova consulta.                --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 8 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula1exer2evolucao2;

-- INSTRUCOES DDL =======================================
 -- Adiciona novo atributo (COLUNA) na tabela PRODUTO (Nulo para nao prejudicar os registros ja existentes)
 ALTER TABLE PRODUTO
   ADD COLUMN nomeProduto VARCHAR(20) NULL;



-- INSTRUCOES DML =======================================
 -- Inserindo duas novas tuplas
 INSERT INTO PRODUTO (codProduto, nomeProduto, precoUnitario) VALUES
  (115588,'Papel Higiênico', 8.99),
  (115599,'Pasta Dental', 10.15);

 -- Atualizando tuplas ja existentes
 UPDATE PRODUTO SET nomeProduto = 'Água Mineral'
  WHERE codProduto = 395766;

 UPDATE PRODUTO SET nomeProduto = 'Lápis de cor'
  WHERE codProduto = 490295;

 UPDATE PRODUTO SET nomeProduto = 'Barbeador'
  WHERE codProduto = 794303;



-- INSTRUCOES DDL =======================================
 -- Torna atributo novo (nomeProduto) obrigatorio na tabela PRODUTO
 ALTER TABLE PRODUTO
   MODIFY COLUMN nomeProduto VARCHAR(20) NOT NULL;



-- INSTRUCOES DDL =======================================
 -- Nova consulta (4) que mostra a quantidade de cada produto que foi vendido por esta instituição mostrando o nome
 SELECT p.codProduto PRODUTO, prod.nomeProduto NOME, SUM(p.quantidade) QTDE_TOTAL
   FROM participa p, PRODUTO prod
  WHERE p.codProduto = prod.codProduto
  GROUP BY p.codProduto;
