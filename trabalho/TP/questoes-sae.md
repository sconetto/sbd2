# Questões SAE - Trabalho TI-BD

## Bancos de Dados NoSQL

### Verdadeiro ou Falso
1. História NoSQL
Enunciado: O termo NoSQL surgiu no final dos anos 90, a sua primeira aparição se deu no projeto de banco de dados open-source de Carlo Strozzi. O nome foi dado pois a tecnologia desenvolvida por Strozzi utilizava shell scripts ao invés de SQL como query language.
Resposta: Verdadeiro

Comentário para acerto: Correto. Apesar da tecnologia não ter relação com os bancos de dados NoSQL o termo surgiu primeiramente do projeto de Strozzi por não utilizar o SQL.
Comentário para erro: Errado. Apesar da tecnologia não ter relação com os bancos de dados NoSQL o termo surgiu primeiramente do projeto de Strozzi por não utilizar o SQL.

Dificuldade: Fácil
Categoria: Revisão
Disciplina: SBD2


2. Bancos Chave-Valor
Enunciado: O banco de dados chave-valor tem esse nome pois em sua concepção de armazenamento ele utiliza uma grande tabela hash com chaves e valores. Eles são otimizados para cargas de trabalhos de aplicativos de gravação pesada, como rede socias, jogos, compartilhamento de mídia, entre outros.
Resposta: Falso

Comentário para acerto: Correto, bancos de dados chave-valor não são otimizados para aplicativos de gravação pesada.
Comentário para erro: Banco de dados chave-valor trabalham com tabelas hash para armazenar seus dados, mas são otimizados para aplicativos de leitura pesada.

Dificuldade: Média
Categoria: Fixação
Disciplina: SBD2


### Múltipla Escolha
1. Teorema de CAP/Brewer
Enunciado: Em bancos de dados NoSQL há uma perda de consistência devido a priorização de alguns pontos ao invés de outros relacionados ao Teorema de CAP (também chamado de Teorema de Brewer). Entre as opções abaixos qual não é uma garantia prevista no Teorema CAP/Brewer?
Opção 1: Consistência
Opção 2: Disponibilidade
Opção 3: Partição Tolerante a Falhas
Opção 4: Durabilidade

Resposta correta: D

Comentário 1: O teorema de CAP/Brewer prevê garantias de consistência
Comentário 2: O teorema de CAP/Brewer prevê garantias de disponibilidade
Comentário 3: O teorema de CAP/Brewer prevê garantias de partição tolerante a falhas
Comentário 4: Durabilidade é uma atributo previsto em transações ACID e não no Teorema de CAP/Brewer 

Dificuldade: Difícil
Categoria: Fixação
Disciplina: SBD2


2. Aplicações NoSQL
Enunciado: Bancos de dados NoSQL têm crescido ultimamente como solução para diversos tipos de aplicações, mas segunda várias literaturas algumas aplicações tem despontado com o uso de NoSQL. Na lista citada abaixo qual é uma das mais reconhidas aplicações de bancos NoSQL? 
Opção 1: Gerenciamento Pessoal
Opção 2: Big Data
Opção 3: Aplicações Geográficas
Opção 4: Blogs

Resposta correta: B

Comentário 1: Pode ser usado bancos NoSQL, mas não é uma aplicação largamente conhecida e sugerida
Comentário 2: Big Data é uma das principais aplicações de NoSQL
Comentário 3: Sistemas gerenciadores de dados geográficos são mais cotados para essa aplicação
Comentário 4: Pode ser usado bancos NoSQL, mas não é uma aplicação largamente conhecida e sugerida

Dificuldade: Fácil
Categoria: Fixação
Disciplina: SBD2


### Escolhas Múltiplas
1. Tipos NoSQL
Enunciado: Nos bancos de dados NoSQL há várias abordagens quando se trata a sua classificação, isso se dá ao fato de existir vários tipos de BDs NoSQL, que manipulam os dados cada um em sua maneira específica. Entre as classificações listadas abaixo, quais NÃO fazem parte dos bancos de dados NoSQL?
Opção 1: Armazenamento Chave-Valor       - E
Opção 2: Armazenamento Objeto Relacional - C
Opção 3: Armazenamento de Tuplas         - E
Opção 4: Armazenamento de Coluna Ampla   - E

Comentário Certo: Correto. A tecnologia de banco de dados Objeto Relacional se refere a um outro tipo de banco de dados.
Comentário Errado: A tecnologia de armazenamento de objetos relacionais é a única a qual não pertence ao leque da tecnologia de banco de dados NoSQL

Dificuldade: Difícil
Categoria: Fixação
Disciplina: SBD2


2. Tecnologias NoSQL
Enunciado: Existem vários bancos de dados NoSQL disponíveis atualmente, sendo fruto de uma grande comunidade open-source que a cada dia cria e evolui mais as ferramentas deste tipo de tecnologia. Quais dos bancos de dados abaixo NÃO são bancos de dados NoSQL? 
Opção 1: Neo4j      - E
Opção 2: Cassandra  - E
Opção 3: MySQL      - C
Opção 4: MongoDB    - E

Comentário Certo: Correto. Entre as tecnologias citadas apenas o MySQL não faz parte dos bancos de dados NoSQL.
Comentário Errado: Errado. Entre as tecnologias citadas apenas o MySQL não faz parte dos bancos de dados NoSQL.

Dificuldade: Média
Categoria: Revisão
Disciplina: SBD2


### Lacuna
1. Otimização de bancos colunares
Enunciado: Existem diversos tipos de bancos de dados NoSQL, sendo um deles os bancos de dados de colunas. Ele têm recursos que aumentam o desempenho de um tipo de consulta, o que reduz drasticamente os requisitos gerais de entrada-saída e diminui a quantidade de dados que você precisa carregar do disco. Responda a seguir qual é esse tipo de consulta no qual os bancos NoSQL de colunas são otimizados.
Frase: O armazenamento orientado a colunas para tabelas do banco de dados é um fator importante no desempenho de consulta #.
Resposta correta: analítica
Resposta alternativa: analise
Diferencia entre minúscula/maiúscula?: Não

Comentário Certo: Correto. Afeta o desempenho de consulta analítica do banco.
Comentário Errado: Errado. O texto se refere ao desempeno de consulta analítica do banco de dados de colunas.

Dificuldade: Média
Categoria: Revisão
Disciplina: SBD2


2. Transações
Enunciado: Uma das grandes desvantagens dos bancos de dados é o fato de sua consistência ser mais comprometida em comparação com outros tipos de bancos de dados, onde normlamente é favorecido a disponibilidade, a tolerância a partição e a velocidade do BD. Há uma outra desvantagem relacionada a consistência e as transações do banco de dados que está presente em bancos NoSQL.
Frase: A desvantagem citada acima é a ausência de transações # nos bancos de dados NoSQL.
Resposta correta: ACID
Resposta alternativa: acid
Diferencia entre minúscula/maiúscula?: Não

Comentário Certo: Correto. Bancos de dados NoSQL carecem de transações ACID, apesar de existir alguns que foram construídos para manter os princípios do ACID. 
Comentário Errado: Grande parte dos bancos NoSQL carecem de transações ACID, este que é uma desvantagem quando comparado a outros bancos de dados.

Dificuldade: Difícil
Categoria: Fixação
Disciplina: SBD2


## Bancos de Dados Geográficos

### Verdadeiro ou Falso
1. Sobreposição em SIGs
Enunciado: A sobreposição de um ou mais mapas é um recurso interessante quando se busca apresentar e comparar diferentes dados e informações, referentes a uma mesma localidade, em um único mapa. Logo, a sobreposição de mapas é uma forma de sobrepor um mapa a outro para obter informações comparadas.
Resposta: Verdadeiro 

Comentário para acerto: Correto, a sobreposição de mapas é uma forma de sobrepor mapas para obter informações e é bastante utilizado em SIGs. 
Comentário para erro: Errado, a sobreposição de mapas é uma forma de sobrepor mapas para obter informações e é bastante utilizado em SIGs.

Dificuldade: Fácil
Categoria: Fixação
Disciplina: SBD2


2. Estrutura dos dados no SIG
Enunciado: A estrutura dos dados espaciais se divide em veotriais e matriciais. Sendo a primeira delas usada para representar coordenadas das fronteiras de cada entidade através de apenas vetores.
Resposta: Falso

Comentário para acerto: Correto, há também a representação através de pontos, linhas e áreas (polígonos).
Comentário para erro: Ela representa também através de pontos, linhas e áreas (polígonos).

Dificuldade: Médio
Categoria: Fixação
Disciplina: SBD2


### Múltipla Escolha
1. Questões de importância para o SIG
Enunciado: Os SIGs (Sistemas de Informação Geográfica) permitem compatibilizar a informação proveniente de diversas fontes, como informação de sensores espaciais (detecção remota/sensoriamento remoto), informação recolhida com GPS ou obtida com os métodos tradicionais da Topografia. Entre as questões em que um SIG pode ter um papel importante quais abaixo listadas NÃO faz parte das principais?
Opção 1: Localização
Opção 2: Rotas
Opção 3: Armazenamento
Opção 4: Material jornalístico

Resposta correta: C

Comentário 1: Localização é um fator importante de um SIG.
Comentário 2: Rotas tem grande importâncias em SIGs modernos.
Comentário 3: Armazenamento tem relevância para dados de um SIG mas não desempenha importância em questões geográficas.
Comentário 4: Material jornalístico têm sido amplamente usados em SIGs para ampliar e aprofundar corberturas.

Dificuldade: Difícil
Categoria: Revisão
Disciplina: SBD2


2. Objetivos do SIG
Enunciado: Bancos de dados geográficos (e os Sistemas de Informação Geográficas - SIG) foram construídos para auxiliar armazemanto, visualização desses mesmos dados. Quais das funções abaixo NÃO faz parte do objetivo dos bancos de dados geográficos.
Opção 1: Manipular grandes volumes de dados.
Opção 2: Manipular dados estruturados.
Opção 3: Manipular dados complexos.
Opção 4: Manipular mapas e imagens de satélite.

Resposta correta: B

Comentário 1: Um dos objetivos do SIG é manipular grandes volumes de dados geográficos.
Comentário 2: Manipular dados estruturados não é um dos principais objetivos do SIG.
Comentário 3: Um dos objetivos do SIG é manipular dados geográficos complexos.
Comentário 4: Um dos objetivos do SIG é manipular dados como mapas e imagens de satélite.

Dificuldade: Médio 
Categoria: Revisão
Disciplina: SBD2


### Escolhas Múltiplas
1. Padrões de Dados Geográficos
Enunciado: Na tentativa de chegar a uma padronização dos citados tipos de dados, existe o Open Geospatial Consortium. O objetivo é forçar os desenvolvedores de software de SIG e Geoprocessamento adotarem padrões. Atualmente, possui algumas especificações, quais dos listados abaixo fazem parte dos padrões definidos pela OGC? 
Opção 1: SFS - Simple Features - SQL      - C
Opção 2: WMS - Web Map Service            - C
Opção 3: WCS - Web Coverage Service       - C
Opção 4: GML - Geography Markup Language  - C

Comentário Certo: Correto, todos listados acima são padrões definidos pela OGC.
Comentário Errado: Todos listados são padrões definidos pela OGC.

Dificuldade: Médio
Categoria: Fixação
Disciplina: SBD2


2. Representação de dados geográficos
Enunciado: Em bancos de dados geográficos algo importante a ser considerado é a representação dos dados a aserem armazenados nesse tipo de banco. Desse aspceto há alguns conceitos para a representação, entre eles temos:
Opção 1: Geometria Matricial   - C
Opção 2: Objeto Espacial       - C
Opção 3: Geometria Topológica  - E
Opção 4: Consulta Geográfica   - E

Comentário Certo: Correto. Geometria matricial busca representar os dados em forma de matriz e objetos espaciais se tratam de objetos com atributos espaciais.
Comentário Errado: Errado. Somente geometria matricial e objeto espacial são representações de dados geográficos.

Dificuldade: Médio
Categoria: Fixação
Disciplina: SBD2


### Lacuna
1. Arquitetura dos SIG
Enunciado: Bancos de dados geográficos possuem arquiteturas e modelos de dados específicos. As arquiteturas, que são mecanismos de estruturação da informação nesse tipo de banco de dados, são duas. Preencha a lacuna a seguir com o nome da arquitetura correta.
Frase: As arquiteturas presentes nos bancos de dados geográficos são a integrada e a #
Resposta correta: Dual
Resposta alternativa: dual
Diferencia entre minúscula/maiúscula?: Não 

Comentário Certo: Correto, os banco de dados geográficos contam com a arquitetura integrada e a dual.
Comentário Errado: Errado, os banco de dados geográficos contam com a arquitetura integrada e a dual.

Dificuldade: Fácil
Categoria: Fixação
Disciplina: SBD2


2. Tipo de dados em SIGs
Enunciado: Bancos de dados geográficos possuem arquiteturas e modelos de dados específicos. As arquiteturas, que são mecanismos de estruturação da informação nesse tipo de banco de dados, são duas. Acerca da arquitetura integrada em um SGBD relacional preencha a lacuna com o tipo correto do campo usado.
Frase: A arquitetura integrada baseada em um SGBD relacional utiliza campos longos, chamados de #, para armazenar a componente espacial do dado.
Resposta correta: blob
Resposta alternativa: blobs
Diferencia entre minúscula/maiúscula?: Não 

Comentário Certo: Correto, os campos são os BLOBs.
Comentário Errado: Errado, os campos utilizados são os BLOBs.

Dificuldade: Difícil
Categoria: Revisão
Disciplina: SBD2