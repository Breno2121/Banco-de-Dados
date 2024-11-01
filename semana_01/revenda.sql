create table veiculo (
	id serial primary key,
	chassi integer not null,
	modelo varchar not null,
	ano_fabricacao integer not null,
	cor varchar,
	quilometragem integer,
	preco decimal,
	fabricante_id serial,
	foreign key (fabricante_id) references fabricante(id)
)

create table fabricante (
	id serial primary key,
	nome varchar,
	pais_origem varchar,
	ano_fundacao integer
)

create table manutencao (
	id serial primary key, 
	data_servico timestamp,
	descricao varchar,
	custo float
)

create table vendas (
	id serial primary key,
	data_venda timestamp,
	valor_total float,
	metodo_pagamento varchar,
	veiculo_id integer not null,
	vendedor_id integer not null,
	cliente_id integer not null,
	foreign key (veiculo_id) references veiculo(id),
	foreign key (vendedor_id) references vendedor(id),
	foreign key (cliente_id) references cliente(id)
)

create table vendedor (
	id serial primary key,
	nome varchar,
	cpf integer,
	telefone varchar,
	email varchar,
	data_contratacao timestamp
)

create table cliente (
	id serial primary key,
	nome varchar,
	cpf varchar,
	telefone varchar,
	email varchar,
	endereco varchar
)

select * from cliente

select * from fabricante

select * from manutencao

select * from veiculo

select * from vendas

select * from vendedor

-----------------------------------------------------------------------------------------

select min (preco_venda) as menor_Valor, max (preco_venda) as maior_Valor from veiculo 
select avg (preco_venda) from veiculo
select sum (preco_venda) from veiculo
select count (id) from veiculo

-- asc do menor para o maior
-- limit quantidade da busca
-- offset apartir de qual
select from veiculo order by preco_venda asc limit 3 offset 3

-- apaga tabela
drop table veiculo