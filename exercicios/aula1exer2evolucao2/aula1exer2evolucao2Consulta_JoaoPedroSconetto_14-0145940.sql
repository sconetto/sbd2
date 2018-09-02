-- ------           AULA 1 EXER 2            ---------- --
--                                                      --
--                    SCRIPT DE CRIAÇÃO (DDL)           --
--                                                      --
-- Data Criacao ...........: 23/08/2018                 --
-- Autor(es) ..............: João Pedro Sconetto        --
-- Banco de Dados .........: MySQL                      --
-- Base de Dados (nome) ...: aula1exer2                 --
--                                                      --
-- Data Ultima Alteracao ..: -                          --
-- PROJETO => 1 Base de Dados                           --
--         => 7 Tabelas                                 --
--                                                      --
-- ---------------------------------------------------- --


use aula1exer2

# Consultar todas as vendas feitas por um empregado específico definido pela
# sua chave primária.
# Basta alterar o cpfVendedor dentro do parênteses para visualizar dados de
# outro empregado.

select * from VENDA
where cpfVendedor in (5769984410);

# Relacionar todos os dados de uma venda e todos os dados desejados para visão
# do usuário sobre os produtos comercializados nesta venda.
# Basta alterar o codVenda dentro do parênteses para visualizar dados de outra
# venda.

select pr.codProduto, v.dataVenda, v.codVenda, v.cpfVendedor, pa.quantidade,
pr.precoUnitario, v.precoTotal
from VENDA as v, participa as pa, PRODUTO as pr
where v.codVenda in (12345) and pr.codProduto = pa.codProduto
and v.codVenda = pa.codVenda

# Mostrar todos os empregados da empresa que não sejam gerentes em
# ordem alfabética crescente.

select * from EMPREGADO
order by nome ASC

# Consultar e mostrar a quantidade de cada produto que foi vendido por esta
# instituição.

select distinct pr.codProduto, sum(pa.quantidade), pr.precoUnitario
from PRODUTO as pr, participa as pa
where pr.codProduto = pa.codProduto
group by pr.codProduto;
