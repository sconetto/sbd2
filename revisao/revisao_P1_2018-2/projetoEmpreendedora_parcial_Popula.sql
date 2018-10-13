-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 06/05/2018
-- Autor(es) ..............: Diversos
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   => 
-- 
-- PROJETO => 1 Base de Dados
--         => 4 Tabelas
-- --------------------------------------------------- --


USE bdEmpre;

INSERT INTO CLIENTE VALUES
(null, 'ORCestra', 61997623245),
(null, 'Matriz', 11347623245),
(null, 'Zenit', 6135724456);

INSERT INTO telefone VALUES
(1, 61997623245),
(2, 11347623245),
(3, 6135724456),
(2, 11988768571);

INSERT INTO PROFISSIONAL VALUES
(1278346, 'Lucas', 'Medico'),
(6125481, 'Maria', 'Pesquisador'),
(4612354, 'Laura', 'Nutricionista'),
(4718432, 'Gustavo', 'Engenheiro Civil'),
(7813548, 'Mateus', 'Designer'),
(9827134, 'Luiza', 'Analista de Sistemas');

INSERT INTO PROJETO VALUES
(null, 1, '2018/03/30', 154132.40),
(null, 2, '2017/05/21', 982364.23),
(null, 3, '2015/10/03', 10879423.13);

INSERT INTO trabalha VALUES
(1, 1278346, 13500.99),
(1, 6125481, 14000.00),
(2, 7813548, 10439.99),
(2, 9827134, 10500.00),
(3, 4718432, 14300.00),
(3, 4612354, 14300.00);