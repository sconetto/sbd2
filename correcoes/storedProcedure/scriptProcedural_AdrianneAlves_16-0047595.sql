-- --------            << Agenda >>            ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ..........: 30/10/2018                               --
-- Autor(es) .............: Adrianne Alves da Silva                  --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: agenda                                   --
--                                                                   --
-- Data Ultima Alteracao ..:                                         --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE agenda;

-- 1) Crie uma função que conta quantas tuplas tem na tabela PESSOA.

DELIMITER $$
 
CREATE PROCEDURE VerificarTuplas_Pessoas(OUT quantidade INT)
BEGIN
    SELECT COUNT(*) INTO quantidade FROM PRODUTOS;  
END $$

DELIMITER ;

CALL VerificarTuplas_Pessoas(@total);

SELECT @total;

-- 2) Elabore um procedimento que conte quantos telefones tem uma pessoa específica


DELIMITER $$
 
CREATE PROCEDURE VerificarNumeroTelefone_Pessoa(OUT quantidade INT, IN nome VARCHAR(80))

BEGIN
    SELECT COUNT(t.id) INTO quantidade FROM TELEFONE t, PESSOA p WHERE t.idPessoa = p.idPessoa and p.nome=nome;  
END $$

DELIMITER ;

CALL VerificarNumeroTelefone_Pessoa(@numTelefone, 'Ana Maria Silva');

SELECT @numTelefone;

--  3) Crie uma função que mostre a quantidade de produtos específico que será solicitado pelo nome do produto. 

DELIMITER $$
 
CREATE PROCEDURE Quantidade_Produto(OUT quantidade INT, IN nomeProduto VARCHAR(80))

BEGIN
    SELECT p.qtde INTO quantidade FROM PRODUTOS p WHERE p.nome=nomeProduto;  
END $$

DELIMITER ;

CALL Quantidade_Produto(@quantidade, 'Cerveja');

SELECT @quantidade;

--  4) Faça uma função que calcule para um produto específico a quantidade financeira em estoque que está armazenado nessa base de dados (total em valor financeiro R$).

DELIMITER $$
 
CREATE PROCEDURE valor_ProdutoEmEstoque(OUT valorFinanceiro INT, IN nomeProduto VARCHAR(80))

BEGIN
    SELECT (p.preco*p.qtde) INTO valorFinanceiro FROM PRODUTOS p WHERE p.nome=nomeProduto;  
END $$

DELIMITER ;

CALL valor_ProdutoEmEstoque(@valorFinanceiro, 'Cerveja');

SELECT @valorFinanceiro as ValorTotalEstoque; 