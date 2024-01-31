-- apagando banco de dados
drop database dbVendas;

-- criando banco de dados
create database dbVendas;

use dbVendas;

create table tbEstado(
codEstado int,
sigla varchar(2),
primary key(codEstado)
);

create table tbEstilo(
codEstilo int,
nome varchar(50),
primary key (codEstilo)
);

create table tbUsuario(
codUsu int,
nome varchar(80),
email varchar(50),
senha varchar(20) ,
primary key (codUsu)
);

create table tbGrupo(
codGrupo int,
nome varchar (50),
primary key (codGrupo)
);

create table tbPermissao(
codPerm int,
nome varchar(50),
primary key (codPerm)
);

create table tbCidade(
codCid int,
nome varchar(50),
codEstado int,
primary key (codCid),
foreign key (codEstado) references tbEstado (codEstado)
);

create table tbCliente(
codCid int,
codCli int,
nome varchar(30),
tipoPessoa varchar(15),
cnpjCpf varchar(30),
telefone varchar(20),
email varchar(30),
logradouro varchar(30),
numero varchar(15),
complemento varchar(20),
cep varchar(15),
primary key (codCli),
foreign key (codCid) references tbCidade (codCid)
);

create table tbCerveja(
codCer int,
sku varchar(50),
nome varchar(80),
descricao text,
valor decimal(10.2),
teorAlcoolico decimal(10,2),
comissao decimal(10,2),
sabor varchar(50),
origem varchar(50),
quantidadeEstoque int,
foto varchar(100),
contentType varchar (100),
codEstilo int,
primary key (codCer),
foreign key (codEstilo) references tbEstilo (codEstilo)
);

create table tbVenda(
codVenda int,
dataCriacao datetime,
valorFrete decimal (10,2),
valorDesconto decimal(10,2),
Estatus varchar(30),
observavao varchar(200),
dataHoraEntrega datetime,
codCli int,
codUsu int,
primary key (codVenda),
foreign key (codUsu) references tbUsuario (codUsu),
foreign key (codCli) references tbCliente (codCli)
);

create table tbItemVenda(
codItemVenda int,
quantidade int,
valorUnitario decimal (10,2),
codCer int,
codVenda int,
foreign key (codCer) references tbCerveja (codCer),
foreign key (codVenda) references tbVenda (codVenda)
);

create table tbUsuarioGrupo(
codUsu int,
codGrupo int,
foreign key (codUsu) references tbUsuario (codUsu),
foreign key (codGrupo) references tbGrupo (codGrupo)
);


create table tbGrupoPermissao(
codGrupo int,
codPerm int,
foreign key (codGrupo) references tbGrupo (codGrupo),
foreign key (codPerm) references tbPermissao (codPerm)
);

show tables;


desc tbEstado;
desc tbEstilo;
desc tbUsuario;
desc tbGrupo;
desc tbPermissao;
desc tbCidade;
desc tbCerveja;
desc tbVenda;
desc tbItemVenda;
desc tbUsuarioGrupo;
desc tbGrupoPermissao;