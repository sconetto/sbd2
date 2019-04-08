-- --------        Trabalho Final - European Soccer     ------------ --
--                                                                   --
--                 SCRIPT DE CONSULTAS E ÍNDICES                     --
--                                                                   --
-- Data Criacao ...........: 25/11/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                           Adrianne Alves                          --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: europeanSoccer                          --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 7 Tabelas                                              --
--         => 1 Usuarios                                             --
-- ----------------------------------------------------------------- --

USE europeanSoccer;

-- View elaborada para auxiliar na decisão estratégica de escolha de jogadores para montar um time
-- É possível avaliar atributos chaves do jogador mostrando também sua evolução pelo anos e temporadas jogadas.
CREATE VIEW PLAYER_HISTORIC AS
  SELECT p.player_api_id AS id,
         p.player_name,
         p.weight AS weight_in_lbs,
         p.height AS height_in_cm,
         pa.overall_rating,
         pa.potential,
         pa.preferred_foot,
         date_format(pa.`date`, "%Y-%m-%d") AS historic
  FROM Player AS p, Player_Attributes AS pa
  WHERE p.player_api_id = pa.player_api_id AND pa.date
  ORDER BY p.player_name ASC, pa.date ASC
  LIMIT 0,300000;

-- Consulta para visualizar o histórico dos campeonatos, vendo as ligas, o ganhador, gols e informações relacionadas aos jogos.
-- Pode visualizar todos os campeonatos, ou apenas um específico, bastanto remover ou modificar o nome da liga.
-- É possível filtrar por outros atributos como a Temporada, ou a Rodada em específico.
SELECT m.match_api_id,
       c.`name` AS country,
       l.`name` AS league,
       m.season,
       m.stage,
       date_format(m.`date`, "%Y-%m-%d") as `date`,
       (SELECT team_long_name FROM `Team` WHERE team_api_id = m.home_team_api_id) AS home_name,
       m.home_team_api_id AS home_id,
       (SELECT team_long_name FROM `Team` WHERE team_api_id = m.away_team_api_id) AS visitor_name,
       m.away_team_api_id AS visitor_id,
       m.home_team_goal,
       m.away_team_goal, 
       if(home_team_goal > away_team_goal, 'Home Wins!', if(home_team_goal = away_team_goal, 'Draw!', 'Visitor Wins!')) AS win
FROM `Match` AS m, `Country` AS c, `League` AS l, `Team` AS t
WHERE m.country_id = c.id AND m.league_id = l.id AND (m.home_team_api_id = t.team_api_id) AND l.`name` = 'Germany 1. Bundesliga' -- Nome da Liga
ORDER BY `date` ASC, country ASC, league ASC, season ASC, stage ASC
LIMIT 0, 50000;

-- Consulta para auxiliar um time a estudar o seu oponente, vendo seus principais atributos.
-- Visualiza também a evolução e mudança das classes do time em cada atributo.
SELECT t.team_api_id,
       t.team_long_name,
       ta.buildUpPlaySpeedClass,
       ta.buildUpPlayDribblingClass,
       ta.buildUpPlayPassingClass,
       ta.buildUpPlayPositioningClass,
       ta.defencePressureClass,
       ta.defenceAggressionClass,
       ta.defenceTeamWidthClass,
       ta.defenceDefenderLineClass,
       date_format(ta.`date`, "%Y-%m-%d") AS historic
FROM `Team` AS t, `Team_Attributes` AS ta
WHERE t.team_api_id = ta.team_api_id AND t.team_long_name = "Borussia Dortmund" -- Nome do oponente
ORDER BY t.team_long_name ASC , ta.date ASC
LIMIT 0,300000;

-- Cria Índice para o nome dos Times, para melhorar o Desempenho nas buscas para análise de oponentes.
CREATE INDEX TeamName_IDX
  ON europeanSoccer.`Team`(team_long_name)

-- Cria Índice para o nome dos Jogadores, para melhorar o Desempenho nas buscas de análise para contratação de Jogadores.
CREATE INDEX PlayerName_IDX
  ON europeanSoccer.`Player`(player_name)