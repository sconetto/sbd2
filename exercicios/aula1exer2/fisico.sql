/* aula1exer2Logico_JoaoPedroSconetto_14-0145940: */

CREATE TABLE Funcionario (
    nome varchar(200),
    cpf bigint PRIMARY KEY,
    id int,
    senha varchar(500)
);

CREATE TABLE Gerente (
    id int,
    formacao_escolar varchar(35),
    email varchar(150),
    FK_Funcionario_cpf bigint,
    PRIMARY KEY (email, FK_Funcionario_cpf)
);

CREATE TABLE Empregado (
    id int,
    matricula bigint,
    FK_numeros_telefone_numeros_telefone_PK int,
    FK_Funcionario_cpf bigint,
    FK_Endereco_id int,
    PRIMARY KEY (matricula, FK_Funcionario_cpf)
);

CREATE TABLE Venda (
    data_venda datetime,
    preco_total float(10,2),
    id int,
    PRIMARY KEY (data_venda, id)
);

CREATE TABLE Endereco (
    id int PRIMARY KEY,
    bairro varchar(100),
    cep varchar(8),
    endereco varchar(500),
    numero varchar(10),
    complemento varchar(200),
    cidade varchar(50),
    estado varchar(2)
);

CREATE TABLE Produto (
    id int PRIMARY KEY,
    descricao varchar(300),
    area varchar(100),
    preco_unitario float(10,2)
);

CREATE TABLE numeros_telefone (
    numeros_telefone_PK int NOT NULL PRIMARY KEY,
    numeros_telefone varchar(15)
);

CREATE TABLE Realiza (
    FK_Venda_data_venda datetime,
    FK_Venda_id int,
    FK_Empregado_matricula bigint,
    FK_Empregado_FK_Funcionario_cpf bigint
);

CREATE TABLE Possui (
    FK_Produto_id int,
    FK_Venda_data_venda datetime,
    FK_Venda_id int,
    quantidade_produto int
);

CREATE TABLE Supervisiona (
    FK_Empregado_matricula bigint,
    FK_Empregado_FK_Funcionario_cpf bigint,
    FK_Gerente_email varchar(150),
    FK_Gerente_FK_Funcionario_cpf bigint,
    area_empregado varchar(100)
);
 
ALTER TABLE Gerente ADD CONSTRAINT FK_Gerente_1
    FOREIGN KEY (FK_Funcionario_cpf)
    REFERENCES Funcionario (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Empregado ADD CONSTRAINT FK_Empregado_1
    FOREIGN KEY (FK_numeros_telefone_numeros_telefone_PK)
    REFERENCES numeros_telefone (numeros_telefone_PK)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE Empregado ADD CONSTRAINT FK_Empregado_2
    FOREIGN KEY (FK_Funcionario_cpf)
    REFERENCES Funcionario (cpf)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Empregado ADD CONSTRAINT FK_Empregado_3
    FOREIGN KEY (FK_Endereco_id)
    REFERENCES Endereco (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_0
    FOREIGN KEY (FK_Venda_data_venda, FK_Venda_id)
    REFERENCES Venda (data_venda, id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (FK_Empregado_matricula, FK_Empregado_FK_Funcionario_cpf)
    REFERENCES Empregado (matricula, FK_Funcionario_cpf)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_0
    FOREIGN KEY (FK_Produto_id)
    REFERENCES Produto (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (FK_Venda_data_venda, FK_Venda_id)
    REFERENCES Venda (data_venda, id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Supervisiona ADD CONSTRAINT FK_Supervisiona_0
    FOREIGN KEY (FK_Empregado_matricula, FK_Empregado_FK_Funcionario_cpf)
    REFERENCES Empregado (matricula, FK_Funcionario_cpf)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Supervisiona ADD CONSTRAINT FK_Supervisiona_1
    FOREIGN KEY (FK_Gerente_email, FK_Gerente_FK_Funcionario_cpf)
    REFERENCES Gerente (email, FK_Funcionario_cpf)
    ON DELETE RESTRICT ON UPDATE RESTRICT;