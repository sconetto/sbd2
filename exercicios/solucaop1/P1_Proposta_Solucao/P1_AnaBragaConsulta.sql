-- --------       << SBD2 P1 2018-2 >>       ------------ --
--
--          SCRIPT DE CRIACAO DE VIEW (DDL)
--
-- Data Criacao ..........: 03/11/2018
-- Autor(es) .............: Vandor Rissoli
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: bdEscola
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--         => 01 Visao
--         => 02 Usuarios
--
-- ------------------------------------------------------ --

-- Acessando a base de dados do projeto
 USE bdEscola;


-- Cria VIEW estrategica
-- Ranque da quantidade de alunos por escola tecnica federal
CREATE VIEW v_AlunosPorEscola(cgc, nome, alunos) AS
  SELECT i.cgc, e.nomeEscola, count(i.cgc) qtde
    FROM ingressa i, escola e
   WHERE i.cgc = e.cgc
   GROUP BY i.cgc
   ORDER BY qtde desc;

-- Implementa INDICE para melhor desempenho da VIEW
CREATE INDEX cgcIngressa_IDX
  ON bdEscola.ingressa(cgc);



-- Numero de cursos lecionados por cada escola técnica federal
CREATE VIEW v_CursosPorEscola(cgc, nome, cursos) AS
  SELECT o.cgc, e.nomeEscola, count(o.cgc)
    FROM oferece o, escola e
   WHERE o.cgc = e.cgc
   GROUP BY o.cgc;

-- Implementa INDICE para melhor desempenho da VIEW
CREATE INDEX cgcOferece_IDX
  ON bdEscola.oferece(cgc);


