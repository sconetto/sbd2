-- --------       << SBD2 P1 2018-2 >>       ------------ --
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
--                          Adrianne Alves
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: FGA_SBD
--
-- Data Ultima Alteracao ..: 20/11/2018
--    + Ajustes no script para suporte oracle
--
-- PROJETO => 01 Base de Dados
--         => 9 Tabelas
--         => 02 Sequences
--         => 02 Triggers
--
-- ----------------------------------------------------------------- --

-- Populando as tabelas


INSERT INTO AAS_PESSOA (cpf, nomePessoa, dtNascimento)
  VALUES (02954492171, 'Rui Moreira', TO_DATE('1993-02-19', 'yyyy/mm/dd'));
INSERT INTO AAS_PESSOA (cpf, nomePessoa, dtNascimento)
  VALUES (02954492175, 'Carlos Moreira',   TO_DATE('1993-02-19', 'yyyy/mm/dd'));
INSERT INTO AAS_PESSOA (cpf, nomePessoa, dtNascimento)
  VALUES (02954492172, 'Mauro Nascimento', TO_DATE('1989-02-19', 'yyyy/mm/dd'));
INSERT INTO AAS_PESSOA (cpf, nomePessoa, dtNascimento)
  VALUES (02954492173, 'Carla Araujo',     TO_DATE('1989-02-20', 'yyyy/mm/dd'));
INSERT INTO AAS_PESSOA (cpf, nomePessoa, dtNascimento)
  VALUES (02954492176, 'Ana Maria Braga',  TO_DATE('1948-10-10', 'yyyy/mm/dd'));


INSERT INTO  AAS_ESCOLA (cgc, nomeEscola, logradouro, estado, cidade, cep, bairro)
  VALUES (47512454000198, 'CEM 311', 'quadra 4',  'DF','Gama',        71090, 'setor norte');
INSERT INTO  AAS_ESCOLA (cgc, nomeEscola, logradouro, estado, cidade, cep, bairro)
  VALUES (51245313001209, 'CEMI210', 'setor O',   'DF','Ceilandia',   72900, 'setor leste');
INSERT INTO  AAS_ESCOLA (cgc, nomeEscola, logradouro, estado, cidade, cep, bairro)
  VALUES (12345678000123, 'CEM 001', 'quadra 412','DF','Plano Piloto',71939, 'setor oeste');


INSERT INTO  AAS_PROFESSOR (matriculaFuncional, cpf)
  VALUES (123, 02954492172);
INSERT INTO  AAS_PROFESSOR (matriculaFuncional, cpf)
  VALUES (124, 02954492171);

INSERT INTO AAS_ALUNO (matriculaEstudantil, cpf, matriculaFuncional)
  VALUES (1512345,02954492175,123);
INSERT INTO  AAS_ALUNO (matriculaEstudantil, cpf, matriculaFuncional)
  VALUES (1754321,02954492172,124);
INSERT INTO  AAS_ALUNO (matriculaEstudantil, cpf, matriculaFuncional)
  VALUES (1812121,02954492175,124);

INSERT INTO AAS_CURSO(nomeCurso, classificacao)
  VALUES ('Informatica','P');
INSERT INTO AAS_CURSO(nomeCurso, classificacao)
  VALUES ('Culinaria','X');
INSERT INTO  AAS_CURSO(nomeCurso, classificacao)
  VALUES ('Processamento Dados','G');
INSERT INTO  AAS_CURSO(nomeCurso, classificacao)
  VALUES ('Fisioterapia','G');

INSERT INTO AAS_CURSO_TECNICO (nomeCursoTecnico)
  VALUES ('Designe Web');
INSERT INTO AAS_CURSO_TECNICO (nomeCursoTecnico)
  VALUES ('Hotelaria');
INSERT INTO AAS_CURSO_TECNICO (nomeCursoTecnico)
  VALUES ('Tecnico em enfermagem');

INSERT INTO  AAS_email (email, matriculaEstudantil)
  VALUES('guguta1@gmail.com', 1512345);
INSERT INTO  AAS_email (email, matriculaEstudantil)
  VALUES('ruika@gmail.com', 1754321);
INSERT INTO  AAS_email (email, matriculaEstudantil)
  VALUES('guguta@hotmail.com',1512345);
INSERT INTO  AAS_email (email, matriculaEstudantil)
  VALUES('fluir@gmail.com',   1812121);

INSERT INTO AAS_ingressa (matriculaEstudantil,cgc,dtIngresso,idCursoTecnico)
  VALUES (1512345,47512454000198,'2015-02-02',1);
INSERT INTO AAS_ingressa (matriculaEstudantil,cgc,dtIngresso,idCursoTecnico)
  VALUES (1754321,51245313001209,'2017-02-01',1);
INSERT INTO AAS_ingressa (matriculaEstudantil,cgc,dtIngresso,idCursoTecnico)
  VALUES (1812121,51245313001209,'2018-02-02',1);

INSERT INTO AAS_formado ( idCurso, matriculaFuncional)
  VALUES (1,123);
INSERT INTO AAS_formado ( idCurso, matriculaFuncional)
  VALUES (2,124);
INSERT INTO AAS_formado ( idCurso, matriculaFuncional)
  VALUES (3,123);
INSERT INTO AAS_formado ( idCurso, matriculaFuncional)
  VALUES (1,130);
