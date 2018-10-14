-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 13/10/2018 
--   => 
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
-- --------------------------------------------------- --

USE bdEmpre;

INSERT INTO CLIENTE VALUES
('Cnpj', 61997623245, 'ORCestra'),
('Cnpj', 11347623245,'Matriz'),
('Cnpj', 6135724456,'Zenit');

INSERT INTO telefone VALUES
(61997623245, 61997623245),
(11347623245, 11347623245), 
(6135724456, 6135724456),
(11347623245, 11988768571);

INSERT INTO PROFISSIONAL VALUES
(123456, 'Adrianne Alves da Silva', 'Engenharia de Software'),
(654321, 'Ana Paula Gomes de Matos', 'Marketing Digital'),
(789456, 'Osmir Mariano', 'Design');

INSERT INTO CONTRATO VALUES
('2018/03/21', 2000000, 147),
('2015/01/15', 2500000, 258),
('2009/10/01', 2500000, 369);

INSERT INTO PROJETO VALUES
(321, 'Software para gerenciamento de estoque', 147, 61997623245),
(654, 'Software para gerência de farmácia', 258, 11347623245),
(987, 'Software para gerência de faculdade',369, 6135724456);

INSERT INTO trabalha VALUES
(321, 123456, 50800),
(654, 654321, 78200),
(987, 789456, 10000);

