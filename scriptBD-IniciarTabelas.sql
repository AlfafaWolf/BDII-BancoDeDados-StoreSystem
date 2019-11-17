/*
drop table Endereco cascade constraints;
drop table Empresa cascade constraints;
drop table Pessoa cascade constraints;
drop table Funcionario cascade constraints;
drop table Atendente cascade constraints;
drop table Vendedor cascade constraints;
drop table Cliente_PF cascade constraints;
drop table Venda cascade constraints;
drop table Venda_Varejo cascade constraints;
drop table Venda_Atacado cascade constraints;
drop table Alocacao cascade constraints;
drop table Produto cascade constraints;
drop table Item cascade constraints;
drop table Compra cascade constraints;
drop table Atendimento cascade constraints;
drop table Atendimento_Personalizado cascade constraints;
drop table Atendimento_Automatico cascade constraints;
*/

create table Endereco(
	id number primary key,
	Bairro varchar(50) not null,
	Logadouro varchar(50) not null,
	Cidade varchar(50) not null,
	Estado varchar(50) not null,
	Numero number(5) not null,
	CEP varchar(9) not null,
	Complemento varchar(70)
);

alter table Endereco add constraint uk_endreco unique (CEP, Numero);


create table Empresa(   
	id number primary key,   
	Nome varchar(50) not null,   
	Razao_Social varchar(50) not null,   
	CNPJ varchar(18) not null,   
	Telefone varchar(15) not null,   
	Email varchar(50) not null,    
	id_endereco number not null, 
	tipo_Empresa VARCHAR2(10) not null CHECK( tipo_Empresa IN ('clientepj', 'filial', 'fornecedor') )  
);

alter table Empresa add constraint fk_empresa_endereco foreign key (id_endereco) references Endereco (id);
alter table Empresa add constraint uk_empresa unique (CNPJ);


create table Pessoa(
	id number primary key,
	Nome varchar(50) not null,
	CPF varchar(11) not null,
	RG varchar(11) not null,
	Sexo varchar(10) not null,
	Telefone varchar(15) not null,
	Data_Nasc date not null,
	Email varchar(40) not null,
	id_endereco number not null,
	tipo_Pessoa VARCHAR2(11) not null CHECK( tipo_Pessoa IN ('funcionario', 'clientepf') ) 
);

alter table Pessoa add constraint fk_pessoa_endereco foreign key (id_endereco) references Endereco (id);
alter table Pessoa add constraint uk_pessoa unique (CPF);


create table Funcionario(
	Matricula varchar(20) not null,
	Data_Admissao date not null,
	Data_Demissao date,
	Salario number(8,2) not null,
	id_funcionario number primary key,
	tipo_Funcionario VARCHAR2(10) not null CHECK( tipo_Funcionario IN ('atendente', 'vendedor') ) 
);

alter table Funcionario add constraint fk_funcionario_pessoa foreign key (id_funcionario) references Pessoa (id);
alter table Funcionario add constraint uk_funcionario unique (Matricula);

create table Atendente(
	Ramal varchar(15) not null,
	id_atendente number primary key
);

alter table Atendente add constraint fk_atendente_pessoa foreign key (id_atendente) references Funcionario (id_funcionario);
/*alter table Atendente add constraint uk_atendente unique (id_atendente);*/

create table Vendedor(
	Reputacao number(2) not null,
	QtdVendas number(5) not null,
	id_Vendedor number primary key   
);

alter table Vendedor add constraint fk_vendedor_pessoa foreign key (id_Vendedor) references Funcionario (id_funcionario);


create table Cliente_PF(
	Usuario varchar(15) not null,
	Senha varchar(12) not null,
	id_clientePF number primary key,
	id_endereco number not null
);

alter table Cliente_PF add constraint fk_Cliente_PF_pessoa foreign key (id_clientePF) references Pessoa (id);
alter table Cliente_PF add constraint uk_Cliente_PF unique (Usuario);


create table Venda(
	id number primary key,
	DataVenda date not null,
	FormaPagamento varchar(30) not null,
	id_vendedor number not null,
	tipo_Venda varchar(10) not null CHECK ( tipo_Venda IN ('atacado', 'varejo') ) 
);

alter table Venda add constraint fk_Venda_vendedor foreign key (id_vendedor) references Vendedor (id_vendedor);
alter table Venda add constraint uk_Venda unique (DataVenda, id_vendedor);


create table Venda_Varejo(
	idVenda_Varejo number primary key,
	id_Venda number not null,
	id_Cliente_PF number not null
);

alter table Venda_Varejo add constraint fk_Venda_Varejo_Cliente_PF foreign key (id_Cliente_PF) references Cliente_PF (id_clientePF);


create table Venda_Atacado(
	idVenda_Atacado number primary key,
	id_Venda number not null,
	id_Empresa number not null
);

alter table Venda_Atacado add constraint fk_Venda_Atacado_Empresa foreign key (id_Empresa) references Empresa (id);


create table Alocacao(
	id number primary key,
	id_Empresa number not null,
	id_Vendedor number not null
);

alter table Alocacao add constraint fk_Alocacao_Empresa foreign key (id_Empresa) references Empresa (id);
alter table Alocacao add constraint fk_Alocacao_Vendedor foreign key (id_Vendedor) references Vendedor (id_vendedor);
alter table Alocacao add constraint uk_Alocacao unique (id_Empresa, id_Vendedor);

create table Produto(
	id number primary key,
	Nome varchar(50) not null,
	QtdEstoque number(10) not null,
	Descricao varchar(255),
	Modelo varchar(32) not null,
	Marca varchar(16) not null, 
	Categoria varchar(32) not null,
	PrecoUnitario number(6,2) not null
);

alter table Produto add constraint uk_Produto unique (modelo, marca);

create table Item(
	id number primary key,
	Qtd number(5) not null,
	/* ValorTotal number(6,2) not null, */
	id_Produto number not null,
	id_Venda number not null
);

alter table Item add constraint fk_Item_Produto foreign key (id_Produto) references Produto (id);
alter table Item add constraint fk_Item_Venda foreign key (id_Venda) references Venda (id);


create table Compra(
	id number primary key,
	QtdComprada number(5) not null,
	DataCompra date not null,
	FormaPagamento varchar(32),
	id_Produto number not null,
	id_Empresa number not null
);

alter table Compra add constraint fk_Compra_Empresa foreign key (id_Empresa) references Empresa (id);
alter table Compra add constraint fk_Compra_Produto foreign key (id_Produto) references Produto (id);


create table Atendimento(
	id number primary key,
	Categoria varchar(32),
	SatisfacaoCliente varchar(32),
	id_Cliente number not null,
	id_Endereco number not null,
	tipo_Atendimento varchar(10) not null CHECK ( tipo_Atendimento IN ('personalizado', 'automatico') ) 
);

alter table Atendimento add constraint fk_Atendimento_Cliente_PF foreign key (id_Cliente) references Cliente_PF (id_clientePF); 
alter table Atendimento add constraint fk_Atendimento_Cliente_PJ foreign key (id_Cliente) references Empresa (id);
alter table Atendimento add constraint fk_Atendimento_Endereco foreign key (id_Endereco) references Endereco (id);


create table Atendimento_Personalizado(
	id_Atendimento number primary key not null,
	Protocolo number(15),
	dataAtend date not null,
	ResumoOcorrencia varchar(45),
	Descricao varchar(150),
	Duracao number(5)
);

alter table Atendimento_Personalizado add constraint fk_Atendimento_Personalizado_Atendimento foreign key (id_Atendimento) references Atendimento (id);
alter table Atendimento_Personalizado add constraint uk_Atendimento_Personalizado unique (Protocolo);


create table Atendimento_Automatico(
	id number primary key,
	Topico varchar(30),
	Perguntas varchar(70) not null,
	Respostas varchar(120) not null,
	id_Atendimento number not null
);

alter table Atendimento_Automatico add constraint fk_Atendimento_Automatico_Atendimento foreign key (id_Atendimento) references Atendimento (id);
