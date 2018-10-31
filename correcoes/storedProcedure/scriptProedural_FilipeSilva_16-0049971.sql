-- ------------------------------------------------------
-- Projeto Pessoal - Banco MySQL
-- Base de Dados = agenda
--   01 = Base de Dados
--   04 = Tabelas
-- Criado 30/10/2018
-- ------------------------------------------------------

use agenda;

-- ------------------------------------------------------

DELIMITER $$

CREATE FUNCTION qtd_pessoas ()
RETURNS INT
BEGIN
    RETURN (SELECT COUNT(*) FROM PESSOA);
END $$
DELIMITER ;

-- ----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE qtd_telefones_pessoa (IN in_idPessoa int(11))
BEGIN
    SELECT COUNT(*) FROM telefone WHERE idPessoa = in_idPessoa;
END $$

DELIMITER ;

-- ----------------------------------------------------

DELIMITER $$

CREATE FUNCTION qtd_produto_nome (in_nome varchar(80))
RETURNS INT
BEGIN
    RETURN (SELECT COUNT(idProduto)
            FROM produtos
            WHERE produtos.nome = in_nome);
END $$

DELIMITER ;

-- --------------------------------------------------

DELIMITER $$

CREATE FUNCTION valor_produto_estoque (in_idProduto int)
RETURNS float
BEGIN
    RETURN (SELECT produtos.qtde * produtos.preco
            FROM produtos
            WHERE produtos.idProduto = in_idProduto);
END $$

DELIMITER ;

-- -----------------------------------------------