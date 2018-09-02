-- --------                    Trabalho Final           ------------ --
--                                                                   --
--                    SCRIPT DE INCLUSÃO (DML)                       --
--                                                                   --
-- Data Criacao ...........: 23/08/2018                              --
-- Autor(es) ..............: Lucas Lermen                            --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula1exer2evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..:	                                     --
--                                    	                             --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 8 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula1exer2evolucao2;



INSERT INTO PESSOA VALUES
 (1234589, 'abc', 'Ana'),
 (1224526, 'bce', 'Luiza'),
 (45526124, 'jhkl', 'Pedro'),
 (6565356, 'uml', 'Maria'),
 (4822665, 'fab', 'Alline'),
 (3544559, 'ulj', 'Lucas');


INSERT INTO PRODUTO VALUES
 (794303, 10.0),
 (490295, 20.0),
 (395766, 30.0);


INSERT INTO EMPREGADO VALUES
 (1,1234589,'Rua 24 de novembro', 'Renato Gonçalves','BA', 'Brasil',14,47804026),
 (2,1224526,'Rua Maringá', 'Bairro das Flores','PR', 'Brasil',856,77804029),
 (3,45526124,'Rua Afonso', 'Setor Sul','TO', 'Brasil',02,85804027);


INSERT INTO GERENTE VALUES
 ('Engenharia de Software', 'maria.linda@gmail.com',6565356),
 ('Engenharia de Energia', 'linne.hta@hotmail.com',4822665),
 ('Engenharia Mecânica', 'luquinhas22@yahoo.com',3544559);


INSERT INTO TELEFONE VALUES
 (1, 7736126857),
 (2, 61998239127),
 (3, 6382243697);


INSERT INTO supervisiona VALUES
 (1, 'maria.linda@gmail.com'),
 (2, 'linne.hta@hotmail.com'),
 (3, 'luquinhas22@yahoo.com');


INSERT INTO VENDA VALUES
 (30, '2017-10-10', 12345, 1),
 (80, '2017-04-12', 67890, 2),
 (50, '2018-04-06', 8484, 2),
 (150, '2017-03-12', 65123, 3);


INSERT INTO participa VALUES
 (3, 12345, 794303),
 (4, 67890, 490295),
 (5, 65123, 395766),
 (1, 12345, 490295),
 (2, 8484,  794303);
