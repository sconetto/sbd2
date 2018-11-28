-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script de Popula
-- ==   01 = Base de dados
-- ==   09 = Tabelas
-- == Autor: João Pedro Sconetto
-- == Data: 19/11/2018
-- ==============================

INSERT INTO JPS_PESSOA 
 SELECT 'José Geraldo', TO_DATE('1987/10/24', 'yyyy/mm/dd'), 55252774520 FROM dual UNION ALL 
 SELECT 'Maria das Dores', TO_DATE('1994/08/07', 'yyyy/mm/dd'), 87542100145 FROM dual UNION ALL 
 SELECT 'Lucas Silva', TO_DATE('2000/02/18', 'yyyy/mm/dd'), 78945622552 FROM dual UNION ALL 
 SELECT 'Mario Pereira', TO_DATE('1988/01/01', 'yyyy/mm/dd'), 78452429878 FROM dual UNION ALL 
 SELECT 'Ana Braga', TO_DATE('1977/05/05', 'yyyy/mm/dd'), 52636574106 FROM dual UNION ALL 
 SELECT 'João Soares', TO_DATE('2001/09/07', 'yyyy/mm/dd'), 98558774512 FROM dual;

INSERT INTO JPS_ESCOLA
 SELECT 'Escola José Ferreira', 457 FROM dual UNION ALL 
 SELECT 'Colégio Brasil', 827 FROM dual UNION ALL 
 SELECT 'Instituto VerdeAzul', 193 FROM dual;

INSERT INTO JPS_PROFESSOR
 SELECT 1524, 55252774520 FROM dual UNION ALL 
 SELECT 2547, 78452429878 FROM dual UNION ALL 
 SELECT 3524, 52636574106 FROM dual;

INSERT INTO JPS_ALUNO
 SELECT 22545, 87542100145, 1524 FROM dual UNION ALL 
 SELECT 33252, 78945622552, 1524 FROM dual UNION ALL 
 SELECT 34578, 98558774512, 3524 FROM dual;

INSERT INTO JPS_matricula_ingressa
 SELECT TO_DATE('2017/01/12', 'yyyy/mm/dd'), 'Redes e Hardware', 22545, 193 FROM dual UNION ALL 
 SELECT TO_DATE('2017/06/05', 'yyyy/mm/dd'), 'Manutenção de Microprocessadores', 33252, 827 FROM dual UNION ALL 
 SELECT TO_DATE('2018/01/24', 'yyyy/mm/dd'), 'Canto e Coral', 34578, 827 FROM dual;

INSERT INTO JPS_EMAIL(email, aluno_FK)
 SELECT 'maria@email.com', 22545 FROM dual UNION ALL 
 SELECT 'lucas@email.com', 33252 FROM dual UNION ALL 
 SELECT 'joao@email.com', 34578 FROM dual;

INSERT INTO JPS_FORMACAO
 SELECT 'Ciência da Computação', 'g' FROM dual UNION ALL 
 SELECT 'Segurança de Dados', 'e' FROM dual UNION ALL 
 SELECT 'Música', 'g' FROM dual;

INSERT INTO JPS_formado(matriculaProfessor_FK, cursoFormacao_FK)
 SELECT 2547, 'Ciência da Computação' FROM dual UNION ALL 
 SELECT 1524, 'Segurança de Dados' FROM dual UNION ALL 
 SELECT 3524, 'Música' FROM dual;

INSERT INTO JPS_ENDERECO(logradouro, bairro, estado, cep, cidade, escola_FK)
 SELECT 'SQS 102', 'Asa Sul', 'DF', 700000, 'Brasília', 457 FROM dual UNION ALL 
 SELECT 'SQN 403', 'Asa Norte', 'DF', 720000, 'Brasília', 827 FROM dual UNION ALL 
 SELECT 'QE 205', 'Sobradinho', 'DF', 500000, 'Brasília', 193 FROM dual;