USE bdEmpre;

create user cliente identified by 'senha123';
create user profissional identified by 'senha123';

grant select on bdEmpre.projeto to cliente;
grant select on bdEmpre.trabalha to cliente;
grant select on bdEmpre.profissional to cliente;

grant select on bdEmpre.cliente to profissional;
grant select on bdEmpre.profissional to profissional;
