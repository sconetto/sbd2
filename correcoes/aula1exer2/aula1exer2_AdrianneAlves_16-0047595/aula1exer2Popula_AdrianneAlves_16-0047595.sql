-- --------                                             ------------ --
--                                                                   --
--                    SCRIPT DE POPULAÇÃO (DML)                      --
--                                                                   --
-- Data Criacao ...........: 20/08/2018                              --
-- Autor(es) ..............: Adrianne Alves da Silva                 --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2                              --
--                                                                   --
-- Data Ultima Alteracao ..:                                         --
-- PROJETO => 1 Base de Dados                                        --
--         => 7 Tabelas                                             --
--                                                                   --
-- ----------------------------------------------------------------- --
USE aula1exer2;

INSERT INTO PRODUTO VALUES
(794303, 10.0),
(490295, 20.0),
(395766, 30.0);

INSERT INTO EMPREGADO VALUES
('Maria Machado', 147589,05769984410, 'dadoDola', 'Rua 24 de novembro', 'Renato Gonçalves','BA', 'Brasil',14,47804026), 
('Alinne Silva', 157589,07569984411, 'unbFga', 'Rua Maringá', 'Bairro das Flores','PR', 'Brasil',856,77804029), 
('Lucas de Alcântara', 117689,06799984410, 'casadamana', 'Rua Afonso', 'Setor Sul','TO', 'Brasil',02,85804027); 

INSERT INTO GERENTE VALUES
('Engenharia de Software', 'maria.linda@gmail.com',15769984410),
('Engenharia de Energia', 'linne.hta@hotmail.com',17569984411),
('Engenharia Mecânica', 'luquinhas22@yahoo.com',16799984410);

INSERT INTO TELEFONE VALUES
(05769984410, 7736126857),
(07569984411, 61998239127),
(06799984410,6382243697);

INSERT INTO supervisiona VALUES
(05769984410, 15769984410),
(07569984411, 17569984411),
(06799984410, 16799984410);

INSERT INTO VENDA VALUES
(30, '2017-10-10', 12345,05769984410),
(80, '2017-04-12', 67890,07569984411),
(150, '2017-03-12', 65123,06799984410);

INSERT INTO participa VALUES
(3, 12345, 794303),
(4, 67890, 490295),
(5, 65123, 395766);