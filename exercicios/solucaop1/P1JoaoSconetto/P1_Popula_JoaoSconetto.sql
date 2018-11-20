-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- ==   01 = Base de dados
-- == Script de Popula
-- ==        nome:bdEscola
-- ==   09 = Tabelas
-- ==   02 = Usuários
-- == Autor: João Pedro Sconetto
-- == Data: 24/10/2018
-- ==============================

USE bdEscola;

INSERT INTO PESSOA VALUES 
('José Geraldo', '1987-10-24', 55252774520),
('Maria das Dores', '1994-08-07', 87542100145),
('Lucas Silva', '2000-02-18', 78945622552),
('Mario Pereira', '1988-01-01', 78452429878),
('Ana Braga', '1977-05-05', 52636574106),
('João Soares', '2001-09-07', 98558774512);

INSERT INTO ESCOLA VALUES
('Escola José Ferreira', 457),
('Colégio Brasil', 827),
('Instituto VerdeAzul', 193);

INSERT INTO PROFESSOR VALUES
(1524, 55252774520),
(2547, 78452429878),
(3524, 52636574106);

INSERT INTO ALUNO VALUES
(22545, 87542100145, 1524),
(33252, 78945622552, 1524),
(34578, 98558774512, 3524);

INSERT INTO matricula_ingressa VALUES
('2017-01-12', 'Redes e Hardware', 22545, 193),
('2017-06-05', 'Manutenção de Microprocessadores', 33252, 827),
('2018-01-24', 'Canto e Coral', 34578, 827);

INSERT INTO EMAIL VALUES
(1, 'maria@email.com', 22545),
(2, 'lucas@email.com', 33252),
(3, 'joao@email.com', 34578);

INSERT INTO FORMACAO VALUES
('Ciência da Computação', 'g'),
('Segurança de Dados', 'e'),
('Música', 'g');

INSERT INTO formado VALUES
(1524, 'Ciência da Computação', 1),
(2547, 'Ciência da Computaçao', 2),
(3524, 'Música', 3);

INSERT INTO ENDERECO VALUES
('SQS 102', 'Asa Sul', 'DF', 700000, 'Brasília', 1, 457),
('SQN 403', 'Asa Norte', 'DF', 720000, 'Brasília', 2, 827),
('QE 205', 'Sobradinho', 'DF', 500000, 'Brasília', 3, 193);