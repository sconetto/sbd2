## Revisão SBD2

- **Esquema**: A descrição da organização dos dados de um BD

- **Instância**: Os dados armazenados em um BD, em um momento específico.

### Formas Normais

 1. **Primeira Forma Normal (1FN)** - Nesta forma os atributos precisam ser atômicos, o que significa que as tabelas não podem ter valores repetidos e nem atributos possuindo mais de um valor. Exemplo: CLIENTE = {ID + ENDEREÇO + TELEFONES}. Porém, uma pessoa poderá ter mais de um número de telefone, sendo assim o atributo "TELEFONES" é multivalorado. Para normalizar, é necessário:
	1. Identificar a chave primária e também a coluna que possui dados repetidos (nesse exemplo "TELEFONES") e removê-los;
	2. Construir uma outra tabela com o atributo em questão, no caso "TELEFONES". Mas não se esquecendo de fazer uma relação entre as duas tabelas: CLIENTE = {ID + ENDEREÇO} e TELEFONE (nova tabela) = {CLIENTE_ID (chave estrangeira) + TELEFONE}.

 2. **Segunda Forma Normal (2FN)** - Primeiramente, para estar na 2FN é preciso estar também na 1FN. 2FN define que os atributos normais, ou seja, os não chave, devem depender unicamente da chave primária da tabela. Assim como as colunas da tabela que não são dependentes dessa chave devem ser removidas da tabela principal e cria-se uma nova tabela utilizando esses dados. Exemplo: PROFESSOR_CURSO = {ID_PROF + ID_CURSO + SALARIO + DESCRICAO_CURSO} Como podemos observar, o atributo "DESCRICAO_CURSO" não depende unicamente da chave primária "ID_PROF", mas sim somente da chave "ID_CURSO". Para normalizar, é necessário:
    1. Identificar os dados não dependentes da chave primária (nesse exemplo "DESCRICAO_CURSO") e removê-los;
    2. Construir uma nova tabela com os dados em questão: PROFESSOR_CURSO = {ID_PROF + ID_CURSO + SALARIO} e CURSOS (nova tabela) = {ID_CURSO + DESCRICAO_CURSO}.

 3. **Terceira Forma Normal (3FN)** - Assim como para estar na 2FN é preciso estar na 1FN, para estar na 3FN é preciso estar também na 2FN. 3FN define que todos os atributos dessa tabela devem ser funcionalmente independentes uns dos outros, ao mesmo tempo que devem ser dependentes exclusivamente da chave primária da tabela. 3NF foi projetada para melhorar o desempenho de processamento dos banco de dados e minimizar os custos de armazenamento. Exemplo: FUNCIONARIO = {ID + NOME + VALOR_SALARIO + VALOR_FGTS}. Como sabemos o valor do FGTS é proporcional ao salário, logo o atributo normal "VALOR_FGTS" é dependente do também atributo normal "VALOR_SALARIO". Para normalizar, é necessário:
    1. Identificar os dados dependentes de outros (nesse exemplo "VALOR_FGTS");
    2. Removê-los da tabela. Esses atributos poderiam ser definitivamente excluídos -- e deixando para a camada de negócio a responsabilidade pelo seu cálculo -- ou até ser movidos para uma nova tabela e referenciar a principal ("FUNCIONARIO").

### Controle de Acesso

Geralmente é formado por três processos:

 1. **Autenticação**: Identifica quem acessa o sistema;
 	1. Identifica - Quem é o usuário que está solicitando acesso ao sistema;
 	2. Autentica - Verifica a identidade, verificando sua credencial (como por exemplo, a senha).
 
 2. **Autorização**: Determina o que um usuário autenticado pode fazer no sistema; 
 	1. Discricionário - Controle de acesso determinada pelo proprietário do recurso;
 	2. Obrigatório - Controle de acesso determinada pelo sistema e não pelo proprietário do recurso;
 	3. Baseado em Papéis - Abordagem que define os direitos e permissões baseado no papel (role).

 3. **Auditoria**: Diz o que o usuário fez usando o sistema.

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

### View

Uma visão (view), corresponde a um conjuto de tuplas resultantes de uma consulta armazenada sobre uma ou mais tabelas do SGBD.
A tabela (ou tabelas) na qual uma view é baseada é denominada TABELA BASE.

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

 Diferença entre view simples e complexa:

 |**Recurso**|**View Simples**|**View Complexa**|
 |---|---|---|
 |Número de Tabelas|Uma|Uma ou mais|
 |Contêm funções|Não|Sim|
 |Contêm grupos|Não|Sim|
 |Permite a execução de operações DML|Sim|Nem Sempre|

### Índices

Índice (Index) é uma referência associada a uma chave, que é utilizada para fins de otimização, permitindo uma localização mais rápida de um registro quando efetuada uma consulta. Em termos teóricos é uma estrutura que possibilita acesso a um item indexado desde que a busca tenha complexidade inferior a complexidade linear, podendo ser logarítmica ou constante.

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

 - Tipos básicos de Índices:
 	1. **Ordenados**: baseiam-se na ordenação de valores
 		1. **Denso**: Um registro de índice aparece para cada valor distinto da chave de procura no arquivo
 		2. **Esparso**: Um registro de índice é criado apenas para alguns dos valores do arquivo de dados
 	2. **Hash**: baseiam-se na distribuição uniforme dos valores determinados por uma função (função de hash)

### Transação e Concorrência

- Transação:

	Propriedades são conhecidas pelo acrônimo ACID:
	- A: Atomicidade
	- C: Consistência
	- I: Isolamento
	- D: Durabilidade

	Estado das transações:
	- Ativa: Permanece nesse estado enquanto está sendo executada a transação.
	- Efetivação Parcial: Após a execução da última declaração.
	- Falha: Descobre-se que a execução não poderá ser efetivada.
	- Abortada: Transação desfeita, reestabelecendo o BD ao início (para ser executada novamente deverá ser gerada uma nova transação).
	- Efetivada: Após a conclusão com sucesso.

	Diz-se que uma transação foi efetivada (commited) somente se ela entrar no estado de EFETIVADA.
	Diz-se que uma transação foi abortada (rolled back) somente se ela entrar no estado de ABORTADA.
	Uma transação é concluída se estiver no estado de EFETIVADA ou de ABORTADA.

- Concorrência:
	O processo de transações concorrentes agiliza a realização da tarefa desejada, mas também traz diversas complicações em relações a consistência dos dados no BD.
	Para permitir a concorrência eficiente, sem comprometer a consistência, é analisada a escala de execução (schedule) das transações envolvidas.
	Para garantir a serialização são usados vários esquemas de controle sobre a concorrência, sendo os mais comuns sintetizados a seguir:
	- Protocolo de Bloqueio: É um conjunto de regras que estabelece quando uma transação pode bloquear e desbloquear um item de dados do SGBD. Existe vários modos de bloqueio de dados, sendo os dois mais significativos:
		- Compartilhado (S): Se uma transação obteve um bloqueio compartilhado sobre um item de dados, ela só poderá ler o item, mas não escrevê-lo.
		- Exclusivo (X): Se uma transação obteve o bloqueio exclusivo sobre um item de dados, ela poderá ler e escrever nesse item.
	- Ordenação por Timestamp: Um método para determinação da ordem serializada é a seleção de uma ordenação entre transações em andamento. Transações mais antigas tem prioridade (timestamp maior) do que novas transações (timestamp menor).
	- Técnicas de Validação: Método é mais adequado em situações que a maioria das transações sejam somente de leitura, com baixas taxas de conflitos entre elas. A transação é ordenada por um timestamp e passa por um teste de validação para completar-se ou será revertida.
	- Esquemas de Multiversão: Tem por base a criação de uma nova versão do item de dado que será escrito.