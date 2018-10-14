-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   => 13/10/2018 por Lucas Arthur Lermen - Alterando a inserção nas tabelas de acordo com as mudanças no arquivo de criação
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
--  	   => 2 usuários
-- --------------------------------------------------- --


USE bdEmpre;

INSERT INTO CLIENTE VALUES
('CNPJ', 122485486, 'ORCestra'),
('CNPJ', 656454663, 'Matriz'),
('CNPJ', 584544596, 'Zenit');

INSERT INTO telefone VALUES
('CNPJ', 122485486, 61997623248),
('CNPJ', 656454663, 11347623245),
('CNPJ', 656454663, 61357244567),
('CNPJ', 656454663, 11988768572);

INSERT INTO PROFISSIONAL VALUES
(1278346, 'Lucas', 'Medico'),
(6125481, 'Maria', 'Pesquisador'),
(4612354, 'Laura', 'Nutricionista'),
(4718432, 'Gustavo', 'Engenheiro Civil'),
(7813548, 'Mateus', 'Designer'),
(9827134, 'Luiza', 'Analista de Sistemas');

INSERT INTO PROJETO VALUES
(null, 154132.40,   '2018/03/30'),
(null, 982364.23,   '2017/05/21'),
(null, 10879423.13, '2015/10/03');

INSERT INTO TRABALHO VALUES
(null, 'CNPJ', 122485486, 1),
(null, 'CNPJ', 656454663, 2),
(null, 'CNPJ', 584544596, 3);

INSERT INTO trabalha VALUES
(1278346, 1, 13500.99),
(6125481, 1, 14000.00),
(7813548, 2, 10439.99),
(9827134, 2, 10500.00),
(4718432, 3, 14300.00),
(4612354, 3, 14300.00);