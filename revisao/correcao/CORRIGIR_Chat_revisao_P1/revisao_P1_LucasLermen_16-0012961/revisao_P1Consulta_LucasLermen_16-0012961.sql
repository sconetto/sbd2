-- --------        << EMPREENDEDORA >>       ------------ --
-- Data Criacao ...........: 14/10/2018
-- Autor(es) ..............: Lucas Arthur Lermen
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdEmpre
-- 
-- Data Ultima Alteracao ..: 
--   =>
-- 
-- PROJETO => 1 Base de Dados
--         => 6 Tabelas
--  	   => 2 usuários
-- --------------------------------------------------- --


-- Criação de índice para a pesquisa para o usuário CLIENTE e para a VIEW
CREATE INDEX IDX_dataContrato ON bdempre.projeto (dataContrato);

-- Pesquisa para o usuário CLIENTE
SELECT proj.dataContrato, prof.nome
FROM bdempre.PROJETO AS proj
  INNER JOIN bdempre.TRABALHO AS tbo
  ON proj.idProjeto = tbo.idProjeto
    INNER JOIN bdempre.trabalha AS tba
    ON tbo.idTrabalho = tba.idTrabalho
      INNER JOIN bdempre.PROFISSIONAL AS prof
      ON tba.matricula = prof.matricula
        WHERE proj.idProjeto = 1;

-- Pesquisa para o usuário PROFISSIONAL
SELECT p.valorContrato, c.nomeRazao
FROM bdempre.PROJETO AS p
  INNER JOIN bdempre.TRABALHO AS t
  ON p.idProjeto = t.idProjeto
    INNER JOIN bdempre.cliente AS c
    ON t.documento = c.documento
    AND t.numeroDocumento = c.numeroDocumento
      WHERE p.idProjeto = 2;

CREATE VIEW TransparenciaProjeto (dataInicio, nomeProfissional) AS
SELECT proj.dataContrato, prof.nome
FROM bdempre.PROJETO AS proj
  INNER JOIN bdempre.TRABALHO AS tbo
  ON proj.idProjeto = tbo.idProjeto
    INNER JOIN bdempre.trabalha AS tba
    ON tbo.idTrabalho = tba.idTrabalho
      INNER JOIN bdempre.PROFISSIONAL AS prof
      ON tba.matricula = prof.matricula
        WHERE proj.idProjeto = 1;