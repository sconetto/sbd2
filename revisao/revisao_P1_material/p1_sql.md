Exemplo de um SQL (MySQL) para criação de usuários:

```sql
CREATE USER [IF NOT EXISTS] '<nome-do-usuario>'@'<local-do-db>' IDENTIFIED BY '<senha>'; -- Normalmente o local do DB é o localhost
GRANT <permissao> ON <nome-do-schema>.<nome-da-tabela> TO <nome-do-usuario>@<local-do-db>; -- O GRANT pode ser SELECT, DELETE, UPDATE, INSERT ou ALL PRIVILEGES
-- WITH GRANT OPTION  -- Casos essa opção seja indicada, o usuário em questão poderar liberar acesso para outros usuários
```

```sql
CREATE USER IF NOT EXISTS'administrador'@'localhost' IDENTIFIED BY 'administrador';
GRANT ALL PRIVILEGES ON aula3exer1.* TO 'administrador'@'localhost';
```

 Exemplo de um SQL (MySQL) para deleção de usuários:

```sql
DROP USER [IF EXISTS] '<nome-do-usuario>'@'<local-do-db>'; -- Deleta o usuário caso ele exista
```

```sql
DROP USER IF EXISTS 'administrador'@'localhost';
```

Exemplo de um SQL (MySQL) para criação de views:

```sql
CREATE VIEW [OR REPLACE] <nome-da-view> AS -- Nome da view como um select
	<select-com-atributos-tabelas-bases> -- Os atributos desse select
 	FROM <tabelas-base> -- As tabelas do select
 	WHERE <condicoes> -- Condições, caso tenha
 	GROUP BY <agrupamentos> -- Agrupamento, caso tenha
--  [WHIT CHECK OPTION] -- CHECK OPTION só permite updates em atributos visíveis
```

```sql
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
```

 Exemplo de um SQL (MySQL) para deleção de views:

```sql
DROP VIEW [IF EXISTS] <nome-da-view>
```

```sql
DROP VIEW IF EXISTS ProjetoClienteVIEW
```

 Exemplo de um SQL (MySQL) para seleção em views:

```sql
DESC <nome-da-view> -- Descreve a view montada
SELECT <atributos> FROM <nome-da-view> -- Seleciona dados das tabelas base da view
-- WHERE | GROUP BY -- É possível adicionar condições e agrupamentos em views, como em um select normal
```

```sql
SELECT * FROM ProjetoClienteVIEW
WHERE NumeroDoProjeto = 1
```

Exemplo de um SQL (MySQL) para criação de índices (index):

```sql
CREATE [UNIQUE] INDEX <nome-do-indice> -- UNIQUE faz com que cada índice seja único
ON <nome-da-tabela>(<atributos-da-tabela>) [ASC | DESC] -- Pode se definir a ordenação ascendente ou descendente do atributo
```

```sql
CREATE INDEX ProfissionalNomeIDX
ON PROFISSIONAL(nomeCompleto);
```

 Exemplo de um SQL (MySQL) para deleção de índices (index):

```sql
DROP INDEX <nome-do-indice> 
-- ON <nome-da-tabela> -- Pode se indicar a tabela específica caso os índices tenham nomes parecidos ou iguais para tabelas diferentes
```