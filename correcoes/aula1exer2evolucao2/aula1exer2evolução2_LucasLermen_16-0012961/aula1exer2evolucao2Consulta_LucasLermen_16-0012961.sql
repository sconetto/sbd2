-- --------              aula1exer2evolucao             ------------ --
--                                                                   --
--                    SCRIPT DE CONSULTA (DML)                       --
--                                                                   --
-- Data Criacao ...........: 23/08/2018                              --
-- Autor(es) ..............: Lucas Arthur Lermen                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 24/08/2018                              --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 8 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula1exer2evolucao2;

-- 1
SELECT v.matricula, v.codVenda, v.dataVenda
  FROM VENDA v
 WHERE v.matricula = 2; -- <<= Informe a matricula a ser pesquisada


-- 2
SELECT p.* , prod.precoUnitario ,v.matricula, v.dataVenda
  FROM participa p
  JOIN VENDA   AS v    ON p.codVenda = v.codVenda
  JOIN PRODUTO AS prod ON p.codProduto = prod.codProduto
 WHERE v.codVenda = 12345; -- <<= Informe o codigo da venda a ser pesquisado


-- 3
SELECT p.*
  FROM PESSOA p
  LEFT JOIN GERENTE AS g ON p.cpfPessoa = g.cpfPessoa
 WHERE g.cpfPessoa IS NULL
 ORDER BY p.nome;


-- 4
SELECT pr.descProduto NOME, p.codProduto PRODUTO, SUM(p.quantidade) QTDE
  FROM participa p, PRODUTO pr
  WHERE pr.codProduto = p.codProduto
 GROUP BY p.codProduto, pr.descProduto;
