-- --------              aula3exer1evolucao3            ------------ --
--                                                                   --
--                      SCRIPT CONSULTA                              --
--                                                                   --
-- Data Criacao ...........: 14/09/2018                              --
-- Autor(es) ..............: Adrianne Alves da Silva                 --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: aula3exer1evolucao2                     --
--                                                                   --
-- Data Ultima Alteracao ..: 17/09/2018 - ajustando a documentacao   --
--   			               desse script para estar correto aos   --
--                             objetivos solitados.                  --
--                           14/10/2018 - ajustando a consulta para  --
--                             a terceira evolução do exercício      --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 4 Tabelas                                              --
--         => 2 Usuarios                                             --
--         => 2 Visoes                                               --
--                                                                   --
-- ----------------------------------------------------------------- --


-- Acesso a base de dados
 USE aula3exer1evolucao3;


-- Analises propostas para DECISAO da instituicao


-- 1) CONSULTA simples do numero de plantonistas que trabalharao em uma data/horario em todos os setores
SELECT a.horarioInicio, COUNT(p.nomePlantonista)
  FROM Plantonista p, alocado a
 WHERE p.matriculaFuncional = a.matriculaFuncional
   AND a.horarioInicio = '2018-09-03 08:00:00'; # <= data e horario definido pelo usuario (padrao DATATIME)


-- 2) VIEW do numero de plantonistas por especialidade
-- Não há necessidade de criação de índice para essa VIEW pois
-- os atributos das entidades que estão sendo usados nas cláusulas de
-- WHERE e GROUP BY são chaves, por isso já possuem um índice
-- criado pelo próprio SGBD para aumentar a performance em buscas e consultas
CREATE VIEW numPlantonistasEspecialidades AS
  SELECT e.descEspecialidade, COUNT(p.nomePlantonista) AS numeroPlantonistas
    FROM Especialidade e, Plantonista p
   WHERE e.idEspecialidade = p.idEspecialidade
   GROUP BY e.idEspecialidade;


-- 3) VIEW de Plantões e Alocações
-- Não há necessidade de criação de índice para essa VIEW pois
-- os atributos das entidades que estão sendo usados na cláusula de
-- WHERE são chaves, por isso já possuem um índice
-- criado pelo próprio SGBD para aumentar a performance em buscas e consultas
CREATE VIEW PlantaoSetorFuncionario AS
  SELECT p.nomePlantonista as NomeMedico,
         e.descEspecialidade as Especialidade,
         s.nomeSetor as SetorAlocacao,
         a.horarioInicio as HorarioInicioPlantao,
         a.horarioTermino as HorarioTerminoPlantao 
   FROM Plantonista as p, Especialidade as e, Setor as s, alocado as a
  WHERE p.idEspecialidade = e.idEspecialidade and
        p.matriculaFuncional = a.matriculaFuncional and
        a.idSetor = s.idSetor

-- Exemplo de Busca por plantão para o setor de Emergência
-- SELECT * 
--  FROM PlantaoSetorFuncionario
-- WHERE SetorAlocacao = 'Emergência'