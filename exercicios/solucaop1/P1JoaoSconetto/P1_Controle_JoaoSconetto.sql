-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script de Controle
-- ==   01 = Base de dados
-- ==        nome:bdEscola
-- ==   09 = Tabelas
-- ==   02 = Usuários
-- == Autor: João Pedro Sconetto
-- == Data: 24/10/2018
-- ==============================

USE bdEscola;

-- Cria o usuário gerente identificado por sua senha
-- e garante todos privilégios em todas as tabelas
-- de bdEscolas
CREATE USER IF NOT EXISTS 'gerente'@'localhost'
IDENTIFIED BY 'gere123#';

GRANT ALL PRIVILEGES ON
bdEscola.* TO 'gerente'@'localhost';

-- Cria o usuário usuario identificado por sua senha
-- e garante acesso por consultas em todas as tabelas
-- de bdEscolas
CREATE USER IF NOT EXISTS 'usuario'@'localhost'
IDENTIFIED BY 'user123#';

GRANT SELECT ON
bdEscola.* TO 'usuario'@'localhost';