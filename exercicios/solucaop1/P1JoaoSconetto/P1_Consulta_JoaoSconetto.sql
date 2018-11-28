-- ==============================
-- == IMPLANTA PROJETO ESCOLAS
-- == Script Consulta - View
-- ==   01 = Base de dados
-- ==        nome:bdEscola
-- ==   09 = Tabelas
-- ==   02 = Usuários
-- == Autor: João Pedro Sconetto
-- == Data: 24/10/2018
-- ==============================

USE bdEscola;

-- Não necessita a criação de um índice pois a consulta age nas chaves primárias
-- que já devem ter índices criados pelo próprio SGBD
CREATE VIEW AlunosEscolaMatriculaVIEW AS
SELECT 
p.nomePessoa, p.cpf, a.matriculaAluno, m.dtIngresso, m.curso, e.nomeEscola
FROM PESSOA as p, ALUNO as a, matricula_ingressa as m, ESCOLA as e
where p.cpf = a.cpfAluno_FK and a.matriculaAluno = m.matriculaAluno_FK and
e.cgc = m.cgcEscola_FK;