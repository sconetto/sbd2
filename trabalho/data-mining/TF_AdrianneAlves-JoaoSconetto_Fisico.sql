-- --------       Trabalho Final - European Soccer      ------------ --
--                                                                   --
--                     SCRIPT DE CRIAÇÃo (DDL)                       --
--                                                                   --
-- Data Criacao ...........: 14/11/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
--                           Adrianne Alves                          --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: europeanSoccer                          --
--                                                                   --
-- Data Ultima Alteracao ..: 25/11/2018 - Alterações na tabela Match --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 7 Tabelas                                              --
--         => 1 Usuarios                                             --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS europeanSoccer;

USE europeanSoccer;

CREATE TABLE IF NOT EXISTS Player (
    id INT NOT NULL AUTO_INCREMENT,
    player_api_id INT NOT NULL UNIQUE,
    player_fifa_api_id INT NOT NULL UNIQUE,
    player_name VARCHAR(255) NOT NULL,
    birthday DATETIME NOT NULL,
    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    CONSTRAINT Player_PK PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Player_Attributes (
    id INT NOT NULL AUTO_INCREMENT,
    player_fifa_api_id INT NOT NULL,
    player_api_id INT NOT NULL,
    `date` DATETIME NOT NULL,
    overall_rating INT NOT NULL,
    potential INT NOT NULL,
    preferred_foot VARCHAR(5) NOT NULL,
    attacking_work_rate VARCHAR(6),
    defensive_work_rate VARCHAR(6),
    crossing INT NOT NULL,
    finishing INT NOT NULL,
    heading_accuracy INT NOT NULL,
    short_passing INT NOT NULL,
    volleys INT NOT NULL,
    dribbling INT NOT NULL,
    curve INT NOT NULL,
    free_kick_accuracy INT NOT NULL,
    long_passing INT NOT NULL,
    ball_control INT NOT NULL,
    acceleration INT NOT NULL,
    sprint_speed INT NOT NULL,
    agility INT NOT NULL,
    reactions INT NOT NULL,
    balance INT NOT NULL,
    shot_power INT NOT NULL,
    jumping INT NOT NULL,
    stamina INT NOT NULL,
    strength INT NOT NULL,
    long_shots INT NOT NULL,
    aggression INT NOT NULL,
    interceptions INT NOT NULL,
    positioning INT NOT NULL,
    vision INT NOT NULL,
    penalties INT NOT NULL,
    marking INT NOT NULL,
    standing_tackle INT NOT NULL,
    sliding_tackle INT NOT NULL,
    gk_diving INT NOT NULL,
    gk_handling INT NOT NULL,
    gk_kicking INT NOT NULL,
    gk_positioning INT NOT NULL,
    gk_reflexes INT NOT NULL,
    CONSTRAINT Player_Attributes_PK PRIMARY KEY (id),
    CONSTRAINT Player_FIFA_API_FK FOREIGN KEY (player_fifa_api_id) REFERENCES Player(player_fifa_api_id),
    CONSTRAINT Player_API_FK FOREIGN KEY (player_api_id) REFERENCES Player(player_api_id)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Country (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT Country_PK PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS League (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    country_id INT NOT NULL,
    CONSTRAINT League_PK PRIMARY KEY (id),
    CONSTRAINT Country_FK FOREIGN KEY (country_id) REFERENCES Country(id)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Team (
    id INT NOT NULL AUTO_INCREMENT,
    team_api_id INT NOT NULL UNIQUE,
    team_fifa_api_id INT,
    team_long_name VARCHAR(255) NOT NULL,
    team_short_name VARCHAR(3) NOT NULL,
    CONSTRAINT Team_PK PRIMARY KEY (id) 
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS Team_Attributes (
    id INT NOT NULL AUTO_INCREMENT,
    team_fifa_api_id INT,
    team_api_id INT NOT NULL,
    `date` DATETIME NOT NULL,
    buildUpPlaySpeed INT NOT NULL,
    buildUpPlaySpeedClass VARCHAR(8) NOT NULL,
    buildUpPlayDribbling INT,
    buildUpPlayDribblingClass VARCHAR(6) NOT NULL,
    buildUpPlayPassing INT NOT NULL,
    buildUpPlayPassingClass VARCHAR(5) NOT NULL,
    buildUpPlayPositioningClass VARCHAR(9) NOT NULL,
    chanceCreationPassing INT NOT NULL,
    chanceCreationPassingClass VARCHAR(6) NOT NULL,
    chanceCreationCrossing INT NOT NULL,
    chanceCreationCrossingClass VARCHAR(6) NOT NULL,
    chanceCreationShooting INT NOT NULL,
    chanceCreationShootingClass VARCHAR(6) NOT NULL,
    chanceCreationPositioningClass VARCHAR(9) NOT NULL,
    defencePressure INT NOT NULL,
    defencePressureClass VARCHAR(6) NOT NULL,
    defenceAggression INT NOT NULL,
    defenceAggressionClass VARCHAR(7) NOT NULL,
    defenceTeamWidth INT NOT NULL,
    defenceTeamWidthClass VARCHAR(6) NOT NULL,
    defenceDefenderLineClass VARCHAR(12) NOT NULL,
    CONSTRAINT Team_Attributes_PK PRIMARY KEY (id),
    CONSTRAINT Team_API_FK FOREIGN KEY (team_api_id) REFERENCES Team(team_api_id)
) ENGINE=InnoDB AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `Match` (
    id INT NOT NULL AUTO_INCREMENT,
    country_id INT NOT NULL,
    league_id INT NOT NULL,
    season VARCHAR(9) NOT NULL,
    stage INT NOT NULL,
    `date` DATETIME NOT NULL,
    match_api_id INT NOT NULL UNIQUE,
    home_team_api_id INT NOT NULL,
    away_team_api_id INT NOT NULL,
    home_team_goal INT NOT NULL,
    away_team_goal INT NOT NULL,
    home_player_X1 INT,
    home_player_X2 INT,
    home_player_X3 INT,
    home_player_X4 INT,
    home_player_X5 INT,
    home_player_X6 INT,
    home_player_X7 INT,
    home_player_X8 INT,
    home_player_X9 INT,
    home_player_X10 INT,
    home_player_X11 INT,
    away_player_X1 INT,
    away_player_X2 INT,
    away_player_X3 INT,
    away_player_X4 INT,
    away_player_X5 INT,
    away_player_X6 INT,
    away_player_X7 INT,
    away_player_X8 INT,
    away_player_X9 INT,
    away_player_X10 INT,
    away_player_X11 INT,
    home_player_Y1 INT,
    home_player_Y2 INT,
    home_player_Y3 INT,
    home_player_Y4 INT,
    home_player_Y5 INT,
    home_player_Y6 INT,
    home_player_Y7 INT,
    home_player_Y8 INT,
    home_player_Y9 INT,
    home_player_Y10 INT,
    home_player_Y11 INT,
    away_player_Y1 INT,
    away_player_Y2 INT,
    away_player_Y3 INT,
    away_player_Y4 INT,
    away_player_Y5 INT,
    away_player_Y6 INT,
    away_player_Y7 INT,
    away_player_Y8 INT,
    away_player_Y9 INT,
    away_player_Y10 INT,
    away_player_Y11 INT,
    home_player_1 INT,
    home_player_2 INT,
    home_player_3 INT,
    home_player_4 INT,
    home_player_5 INT,
    home_player_6 INT,
    home_player_7 INT,
    home_player_8 INT,
    home_player_9 INT,
    home_player_10 INT,
    home_player_11 INT,
    away_player_1 INT,
    away_player_2 INT,
    away_player_3 INT,
    away_player_4 INT,
    away_player_5 INT,
    away_player_6 INT,
    away_player_7 INT,
    away_player_8 INT,
    away_player_9 INT,
    away_player_10 INT,
    away_player_11 INT,
    goal LONGTEXT,
    shoton LONGTEXT,
    shotoff LONGTEXT,
    foulcommit LONGTEXT,
    card LONGTEXT,
    `cross` LONGTEXT,
    corner LONGTEXT,
    possession LONGTEXT,
    B365H FLOAT,
    B365D FLOAT,
    B365A FLOAT,
    BWH FLOAT,
    BWD FLOAT,
    BWA FLOAT,
    IWH FLOAT,
    IWD FLOAT,
    IWA FLOAT,
    LBH FLOAT,
    LBD FLOAT,
    LBA FLOAT,
    PSH FLOAT,
    PSD FLOAT,
    PSA FLOAT,
    WHH FLOAT,
    WHD FLOAT,
    WHA FLOAT,
    SJH FLOAT,
    SJD FLOAT,
    SJA FLOAT,
    VCH FLOAT,
    VCD FLOAT,
    VCA FLOAT,
    GBH FLOAT,
    GBD FLOAT,
    GBA FLOAT,
    BSH FLOAT,
    BSD FLOAT,
    BSA FLOAT,
    CONSTRAINT Match_PK PRIMARY KEY (id),
    CONSTRAINT CountryMatch_FK FOREIGN KEY (country_id) REFERENCES Country(id),
    CONSTRAINT League_FK FOREIGN KEY (league_id) REFERENCES League(id),
    CONSTRAINT HomeTeam_FK FOREIGN KEY (home_team_api_id) REFERENCES Team(team_api_id),
    CONSTRAINT AwayTeam_FK FOREIGN KEY (away_team_api_id) REFERENCES Team(team_api_id),
    CONSTRAINT firstHomePlayer_FK FOREIGN KEY (home_player_1) REFERENCES Player(player_api_id), 
    CONSTRAINT secondHomePlayer_FK FOREIGN KEY (home_player_2) REFERENCES Player(player_api_id),
    CONSTRAINT thirdHomePlayer_FK FOREIGN KEY (home_player_3) REFERENCES Player(player_api_id),
    CONSTRAINT fourthHomePlayer_FK FOREIGN KEY (home_player_4) REFERENCES Player(player_api_id),
    CONSTRAINT fifthHomePlayer_FK FOREIGN KEY (home_player_5) REFERENCES Player(player_api_id),
    CONSTRAINT sixthHomePlayer_FK FOREIGN KEY (home_player_6) REFERENCES Player(player_api_id),
    CONSTRAINT seventhHomePlayer_FK FOREIGN KEY (home_player_7) REFERENCES Player(player_api_id),
    CONSTRAINT eighthHomePlayer_FK FOREIGN KEY (home_player_8) REFERENCES Player(player_api_id),
    CONSTRAINT ninthHomePlayer_FK FOREIGN KEY (home_player_9) REFERENCES Player(player_api_id),
    CONSTRAINT tenthHomePlayer_FK FOREIGN KEY (home_player_10) REFERENCES Player(player_api_id),
    CONSTRAINT eleventhHomePlayer_FK FOREIGN KEY (home_player_11) REFERENCES Player(player_api_id),
    CONSTRAINT firstAwayPlayer_FK FOREIGN KEY (away_player_1) REFERENCES Player(player_api_id), 
    CONSTRAINT secondAwayPlayer_FK FOREIGN KEY (away_player_2) REFERENCES Player(player_api_id),
    CONSTRAINT thirdAwayPlayer_FK FOREIGN KEY (away_player_3) REFERENCES Player(player_api_id),
    CONSTRAINT fourthAwayPlayer_FK FOREIGN KEY (away_player_4) REFERENCES Player(player_api_id),
    CONSTRAINT fifthAwayPlayer_FK FOREIGN KEY (away_player_5) REFERENCES Player(player_api_id),
    CONSTRAINT sixthAwayPlayer_FK FOREIGN KEY (away_player_6) REFERENCES Player(player_api_id),
    CONSTRAINT seventhAwayPlayer_FK FOREIGN KEY (away_player_7) REFERENCES Player(player_api_id),
    CONSTRAINT eighthAwayPlayer_FK FOREIGN KEY (away_player_8) REFERENCES Player(player_api_id),
    CONSTRAINT ninthAwayPlayer_FK FOREIGN KEY (away_player_9) REFERENCES Player(player_api_id),
    CONSTRAINT tenthAwayPlayer_FK FOREIGN KEY (away_player_10) REFERENCES Player(player_api_id),
    CONSTRAINT eleventhAwayPlayer_FK FOREIGN KEY (away_player_11) REFERENCES Player(player_api_id)
) ENGINE=InnoDB AUTO_INCREMENT=0;