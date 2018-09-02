-- ------           AULA 1 EXER 2            ---------- --
--                                                      --
--                    SCRIPT DE DELEÇÃO                 --
--                                                      --
-- Data Criacao ...........: 20/08/2018                 --
-- Autor(es) ..............: João Pedro Sconetto        --
-- Banco de Dados .........: MySQL                      --
-- Base de Dados (nome) ...: aula1exer2                 --
--                                                      --
-- PROJETO => 1 Base de Dados                           --
--         => 10 Tabelas                                --
--                                                      --
-- ---------------------------------------------------- --

USE aula1exer2;

INSERT INTO Funcionario(nome, cpf, id, senha) VALUES
('Pedro Silva', 47557441208, 1, 'senhaforte123'),
('Lucas Soares', 35285274498, 2, 'passwordX'),
('Mara Rodrigues', 12254798700, 3, 'mara123'),
('Valter Flores', 87410125222, 4, 'passdrw21');

INSERT INTO Gerente(id, formacao_escolar, email, FK_Funcionario_cpf) VALUES
(1, 'Superior Completo', 'lucas@email.com', 35285274498),
(2, 'Médio Completo', 'mararod@email.com', 12254798700);

INSERT INTO numeros_telefone(numeros_telefone_PK, numeros_telefone) VALUES
(1, '061999293232'),
(2, '06130304022'),
(3, '06133218181'),
(4, '061981010085'),
(5, '061991002025'),
(6, '061981234567');

INSERT INTO Endereco(id, bairro, cep, endereco, numero, complemento,
cidade, estado) VALUES
(1, 'Asa Sul', '70342000', 'SQS 103 Bloco A', '11', 'Apartamento', 'Brasília', 'DF'),
(2, 'Taguatinga', '72000500', 'QNA 7 Bloco A', '23', 'Casa', 'Brasília', 'DF');

INSERT INTO Empregado(id, matricula, FK_numeros_telefone_numeros_telefone_PK,
FK_Funcionario_cpf, FK_Endereco_id) VALUES
(1, 1252144, 1, 47557441208, 1),
(2, 5585742, 4, 87410125222, 2);

INSERT INTO Venda(data_venda, preco_total, id) VALUES
('2018-07-21 20:07:32', 325.25, 1),
('2018-06-07 10:05:08', 1442.78, 2),
('2018-08-19 15:42:58', 39.84, 3);

INSERT INTO Produto(id, descricao, area, preco_unitario) VALUES
(1, 'Achocolatado Toddy', 'Doces', 7.99),
(2, 'Pão de Forma Wickbold', 'Padaria', 5.95),
(3, 'Refrigerante Coca-Cola 2L', 'Bebidas', 4.69);

INSERT INTO Realiza(FK_Venda_data_venda, FK_Venda_id, FK_Empregado_matricula,
FK_Empregado_FK_Funcionario_cpf) VALUES
('2018-07-21 20:07:32', 1, 1252144, 47557441208),
('2018-06-07 10:05:08', 2, 1252144, 47557441208),
('2018-08-19 15:42:58', 3, 5585742, 87410125222);

INSERT INTO Possui(FK_Produto_id, FK_Venda_data_venda, FK_Venda_id,
quantidade_produto) VALUES
(1, '2018-07-21 20:07:32', 1, 5),
(2, '2018-06-07 10:05:08', 2, 20),
(3, '2018-08-19 15:42:58', 3, 2);

INSERT INTO Supervisiona(FK_Empregado_matricula,
FK_Empregado_FK_Funcionario_cpf, FK_Gerente_email,
FK_Gerente_FK_Funcionario_cpf, area_empregado) VALUES
(1252144, 47557441208, 'lucas@email.com', 35285274498, 'Doces'),
(1252144, 47557441208, 'mararod@email.com', 12254798700, 'Padaria'),
(5585742, 87410125222, 'lucas@email.com', 35285274498, 'Bebidas');
