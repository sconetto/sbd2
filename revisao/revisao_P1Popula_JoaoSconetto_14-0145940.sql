-- --------              << EMPREENDEDORA >>            ------------ --
--                                                                   --
--                       SCRIPT DE POPULA                            --
--                                                                   --
-- Data Criacao ...........: 06/05/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                           e diversos                              --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: bdEmpre                                 --
--                                                                   --
-- Data Ultima Alteracao ..: 13/10/2018                              --
--   => Adequação do script para o novo modelo lógico e conceitual   --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 5 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE bdEmpre;

INSERT INTO CLIENTE (nomeCliente, tipoDocumento, numeroDocumento) VALUES
('Construtora Ágil', 'cnpj', 12345689900018),
('Hospital Santa Dor', 'cnpj', 58975608700015),
('Marcos Silva', 'cpf', 12345678901),
('Ana Maria Souza', 'cpf', 02506752488),
('Helena Rodrigues', 'cpf', 02557878920);

INSERT INTO telefoneContato (telefoneContato, tipoDocumentoCliente_FK, numeroDocumentoCliente_FK) VALUES
(981155858, 'cpf', 02557878920),
(33550011, 'cnpj', 12345689900018),
(990298080, 'cpf', 12345678901);

INSERT INTO PROFISSIONAL (matricula, nomeCompleto, especialidade) VALUES
(158, 'Alberto Braz Cardoso', 'Engenheiro'),
(199, 'Luciana Araujo', 'Desenhista'),
(102, 'Ludmila Cruz', 'Professor'),
(137, 'Maurílio Roberto Lourdes', 'Designer'),
(216, 'José da Silva Pereira', 'Desenvolvedor');

INSERT INTO PROJETO (idProjeto, dataCelebracaoContrato, valorContrato, tipoDocumentoCliente_FK, numeroDocumentoCliente_FK) VALUES
(17, '2018-01-01', 250000, 'cnpj', 12345689900018),
(13, '2017-06-01', 1000000, 'cnpj', 58975608700015),
(35, '2018-08-14', 150000, 'cpf', 12345678901),
(27, '2018-02-27', 30000, 'cpf', 02506752488),
(1, '2016-11-09', 800000, 'cpf', 02557878920);

INSERT INTO TRABALHA (matriculaProfissional_FK, idProjeto_FK, valorUnitarioProfissional, idTrabalha) VALUES
(158, 17, 7500, 12),
(199, 17, 3000, 13),
(102, 13, 4500, 20),
(137, 35, 8000, 42),
(216, 1, 2500, 1);
