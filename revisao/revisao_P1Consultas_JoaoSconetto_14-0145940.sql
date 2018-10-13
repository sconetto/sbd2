-- --------              << EMPREENDEDORA >>            ------------ --
--                                                                   --
--                       SCRIPT DE CONSULTA                          --
--                                                                   --
-- Data Criacao ...........: 06/05/2018                              --
-- Autor(es) ..............: João Pedro Sconetto                     --
-- Banco de Dados .........: MySQL                                   --
-- Banco de Dados(nome) ...: bdEmpre                                 --
--                                                                   --
-- Data Ultima Alteracao ..: 13/10/2018                              --
--   => Adição dos usuários solicitados.                             --
--                                                                   --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 5 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE bdEmpre;

# Consulta CLIENTE
# Este select irá mostrar os dados do projeto, o valor de contrato, a data
# de celebração (início) do contrato, assim como listará todos os profissionais
# que estão alocados para esse contrato, mostrando sua especialidade (função).
# Para mostrar informações de outros projetos basta editar a oitava linha
# e colocar entre os símbolos de porcento (%) uma parte do nome do projeto,
# caso seja um projeto específico basta inserir o seu nome completo.
# Em casos de projeto com nomes iguais pode se adicionar uma linha que seria
# pt.idProjeto = <numero_do_projeto> para indicar pelo ID do projeto desejado.
select pt.idProjeto as NumeroDoProjeto,
pt.nomeProjeto as NomeDoProjeto,
pt.dataCelebracaoContrato as DataInicioContrato,
pt.valorContrato as ValorTotalContrato,
pf.nomeCompleto as NomeProfissionalAlocado,
pf.especialidade as EspecialiadadeProfissionalAlocado
from PROFISSIONAL as pf, CLIENTE as c, PROJETO as pt, TRABALHA as t
where pt.nomeProjeto like '%Sede%' and
pt.idProjeto = t.idProjeto_FK and
pf.matricula = t.matriculaProfissional_FK
group by pt.idProjeto, pf.matricula;

# Index CLIENTE
# Criação do índice do Nome do Projeto para agilizar a consulta do CLIENTE para
# que quando ele procurar pelos projetos a fim de obter as informações
# solicitadas a aplicação será mais performática.
CREATE INDEX projetoNomeIDX
ON PROJETO(nomeProjeto);

# View CLIENTE
# Criação da view do CLIENTE, dessa forma será possível ver as informações
# solicitadas pelo mesmo acerca do contrato, caso queria verificar de um
# contrato em específico, basta fazer o seguinte select com a view:
#
#    SELECT * FROM ProjetoClienteVIEW
#    WHERE NomeDoProjeto like '%Aplicativo%'; # Para ver do projeto 'Aplicativo"
#
# Ou inserir o ID do projeto solicitado:
#
#    SELECT * FROM ProjetoClienteVIEW
#    WHERE NumeroDoProjeto = 35;
#
# Bastando se conter nos dados propostos na view.
CREATE VIEW ProjetoClienteVIEW AS
select pt.idProjeto as NumeroDoProjeto,
pt.nomeProjeto as NomeDoProjeto,
pt.dataCelebracaoContrato as DataInicioContrato,
pt.valorContrato as ValorTotalContrato,
pf.nomeCompleto as NomeProfissionalAlocado,
pf.especialidade as EspecialiadadeProfissionalAlocado
from PROFISSIONAL as pf, CLIENTE as c, PROJETO as pt, TRABALHA as t
where pt.idProjeto = t.idProjeto_FK and
pf.matricula = t.matriculaProfissional_FK
group by pt.idProjeto, pf.matricula;

# Consulta PROFISSIONAL
# Este select irá mostrar os dados do projeto, o valor de contrato, quanto o
# profissional vai receber de remuneração, quem é o funcionário em questão e
# qual a sua atribuição (especialidade) naquele projeto.
# Para mostrar informações de outro Profissional bastar editar a nona linha
# e colcocar entre os símbolos de porcento (%) uma parte do seu nome, caso
# seja uma pessoa em específico basta inserir o seu nome completo.
select pt.idProjeto as NumeroDoProjeto,
pt.nomeProjeto as NomeDoProjeto,
pt.valorContrato as ValorTotalProjeto,
t.valorUnitarioProfissional as RemuneracaoProfissional,
c.nomeCliente as NomeCliente,
pf.nomeCompleto as FuncionarioAtribuido,
pf.especialidade as CargoFuncionario
from PROFISSIONAL as pf, CLIENTE as c, PROJETO as pt, TRABALHA as t
where pf.nomeCompleto like '%Ludmila%' and 
t.matriculaProfissional_FK = pf.matricula and
pt.idProjeto = t.idProjeto_FK and
c.numeroDocumento = pt.numeroDocumentoCliente_FK
group by pt.idProjeto, pf.matricula, c.nomeCliente, t.valorUnitarioProfissional;

# Index PROFISSIONAL
# Criação do índice do Nome do Profissional para agilizar a consulta do
# PROFISSINAL para que quando ele procurar por seu nome em projetos que ele
# está alocado a aplicação será mais performática.
CREATE INDEX ProfissionalNomeIDX
ON PROFISSIONAL(nomeCompleto);

