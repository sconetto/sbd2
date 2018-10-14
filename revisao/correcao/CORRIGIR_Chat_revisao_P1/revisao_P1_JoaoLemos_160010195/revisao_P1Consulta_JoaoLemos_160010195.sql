use bdEmpre;

-- Consulta 1
select projeto.dtContrato, profissional.nome from projeto join trabalha join profissional where profissional.matricula = trabalha.matricula and trabalha.idProjeto = projeto.idProjeto;

-- Consulta 2
select projeto.valorContrato, projeto.valorProfissional, cliente.nome from cliente join projeto where projeto.documentos = cliente.documentos;

-- View
create view ajuda_ao_cliente(data_inicio, nome_profissionais) as select projeto.dtContrato, profissional.nome from projeto join trabalha join profissional where profissional.matricula = trabalha.matricula and trabalha.idProjeto = projeto.idProjeto;

-- Índice das consultas
create index nome_profissional_IDX on profissional(nome);