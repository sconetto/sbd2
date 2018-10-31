
-- Projeto Pessoal - Banco MySQL
-- Base de Dados = agenda
--   01 = Base de Dados
--   04 = Tabelas
-- Atualizado: 26/10/2018 - organizou melhor o script
-- ------------------------------------------------------

use agenda;

-- Função 1: contagem de pessoas
delimiter $$
create procedure contagemPessoas (out pessoas int)
begin
	select count(*) into pessoas from pessoa;
end $$
delimiter ;

-- Função 2: contagem de telefones de uma pessoa
delimiter $$
create procedure contagemTelefones (out telefones int)
begin
	select count(telefone.id) into telefones from pessoa join telefone where pessoa.idPessoa = telefone.idPessoa and pessoa.nome = 'Levino Andrade';
end $$
delimiter ;

-- Função 3: contagem de produtos a partir do nome do produto
delimiter $$
create procedure contagemProdutos (in nomeProduto varchar(80), out produto int)
begin
	select count(produtos.idProduto) into produto from produtos where produtos.nome = nomeProduto;
end $$
delimiter ;

-- Função 4: contagem financeira de um produto
delimiter $$
create procedure contagemFinanceira (in nomeProduto varchar(80), out dinheiro int)
begin
	select sum(produtos.preco) into dinheiro from produtos where produtos.nome = nomeProduto;
end $$
delimiter ;


-- Chamada da função 1
call contagemPessoas(@pessoa);
select @pessoa;

-- Chamada da função 2
call contagemTelefones(@telefone);
select @telefone;

-- Chamada da função 3
call contagemProdutos('Sabonete',@produto);
select @produto;

-- Chamada da função 4
call contagemFinanceira('Cerveja',@dinheiro);
select @dinheiro;

drop procedure contagemPessoas;
drop procedure contagemTelefones;
drop procedure contagemProdutos;
drop procedure contagemFinanceira;