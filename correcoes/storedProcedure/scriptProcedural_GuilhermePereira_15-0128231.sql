-- --------              agenda            ------------ --
--                                                                   --
--                      SCRIPT PROCEDURAL                              --
--                                                                   --
-- Data Criacao ...........: 30/10/2018                              --
-- Autor(es) ..............: Guilherme de Lyra
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: agenda                     --
--                                                                   --
-- Data Ultima Alteracao ..: 30/10/2018                  --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
-- ----------------------------------------------------------------- --

USE agenda;

DELIMITER $$ 

create procedure count_rows_person ()
begin
    set @q = 'SELECT COUNT(*) FROM `agenda`.`pessoa`';
    prepare stmt from @q;
    execute stmt;
    DEALLOCATE PREPARE stmt;
end $$

create procedure count_tel_person (in idPessoa int(11))
begin
    set @q = CONCAT('SELECT COUNT(*) FROM `agenda`.`telefone` WHERE idPessoa=', idPessoa);
    prepare stmt from @q;
    execute stmt;
    DEALLOCATE PREPARE stmt;
end $$

create procedure count_products_by_names (in products varchar(255))
begin
    set @q = CONCAT('SELECT SUM(p.qtde) FROM `agenda`.`produtos` as p WHERE nome in (',
        products, ')');
    prepare stmt from @q;
    execute stmt;
    DEALLOCATE PREPARE stmt;
end $$

create procedure calc_product_income (in idProduto int)
begin
    set @q = CONCAT('SELECT SUM(p.qtde*p.preco) FROM `agenda`.`produtos` as p WHERE idProduto=', idProduto);
    prepare stmt from @q;
    execute stmt;
    DEALLOCATE PREPARE stmt;
end $$

DELIMITER ;

CALL count_rows_person();
CALL count_tel_person(1);
CALL count_products_by_names('\'Sabonete\',\'Cerveja\'');
CALL calc_product_income(2);