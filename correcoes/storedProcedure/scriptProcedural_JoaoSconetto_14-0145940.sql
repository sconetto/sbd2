-- ------------------------------------------------------
-- Projeto Pessoal - Banco MySQL
-- Base de Dados = agenda
--   01 = Base de Dados
--   04 = Tabelas
-- Atualizado: 30/10/2018 - Adição das procedures e functions
-- Autor: João Pedro Sconetto
-- ------------------------------------------------------

USE agenda;

-- 1) Crie uma função que conta quantas tuplas tem na tabela PESSOA.
DELIMITER $$
 CREATE PROCEDURE GetTotalPessoasAgenda()
   BEGIN
   SELECT COUNT(*) AS TotalDePessoas FROM pessoa;
   END $$
DELIMITER ;


--  2) Elabore um procedimento que conte quantos telefones tem uma pessoa específica.
DELIMITER $$
 CREATE PROCEDURE GetNoTelefonesPessoa()
   BEGIN
   SELECT p.nome as NomePessoa, COUNT(t.id) as NoTelefones
    FROM pessoa as p, telefone as t
    WHERE t.idPessoa = p.idPessoa
    GROUP BY p.idPessoa;
    END $$
DELIMITER ;


-- 3) Crie uma função que mostre a quantidade de produtos específico que será solicitado pelo nome do produto.
DELIMITER $$
 CREATE FUNCTION QuantidadeProduto(nomeProduto varchar(80)) RETURNS int
   BEGIN
   DECLARE quantidade int;

   SELECT qtde INTO quantidade
   FROM produtos
   WHERE nome = nomeProduto;

   RETURN (quantidade);
   END $$
DELIMITER ;
-- Exemplo de uso:
-- SELECT nome, QuantidadeProduto(nome) FROM produtos WHERE nome = 'Cerveja';

-- 4) Faça uma função que calcule para um produto específico a quantidade financeira em estoque que está armazenado nessa base de dados (total em valor financeiro R$).
DELIMITER $$
 CREATE FUNCTION QuantidadeFinanceiraProduto(nomeProduto varchar(80)) RETURNS float
   BEGIN
   DECLARE quantidade int;
   DECLARE precoProduto float;
   DECLARE total float;
   
   SELECT qtde INTO quantidade
   FROM produtos
   WHERE nome = nomeProduto;
   
   SELECT preco INTO precoProduto
   FROM produtos
   WHERE nome = nomeProduto;
   SET total = precoProduto * quantidade;
   RETURN (total);
   END $$
DELIMITER ;
-- Exemplo de uso:
-- SELECT nome, QuantidadeFinanceiraProduto(nome) FROM produtos WHERE nome = 'Cerveja';