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

--------------------------------------------------------------------------
alter table manutencao {
	add column veiculo_id NOT NULL 
}
ALTER TABLE vendas
ADD COLUMN metodo_pagamento metodo_pagamento;

delete from vendedor where id = 10;

SELECT * FROM vendas
SELECT * FROM manutencao
SELECT * FROM cliente

CREATE TYPE metodo_pagamento AS ENUM ('cartao', 'pix', 'boleto');

INSERT INTO cliente (nome, cpf, telefone, email, endereco) VALUES
('adrian', '000.000.000-01', '48 0000-0000', 'adrian@gmail.com', 'mata-atlantica'),
('alan', '111.000.000-02', '48 1111-1111', 'alan@gmail.com', 'bosque da mata'),
('geovanni', '000.111.000-03', '48 2222-2222', 'geovani@gmail.com', 'centro'),
('luiz', '000.000.111-04', '48 3333-3333', 'luizinho24@gmail.com', 'flora-flora'),
('rosane', '222.000.000-05', '48 4444-4444', 'roro@gmail.com', 'mata-floresta')

select * FROM vendedor

INSERT INTO vendedor (nome, cpf, telefone, email, data_contratacao) VALUES
('rosanilda', '22200011110', '48 56565656', 'roronildinha@gmail.com', '15/10/2015'),
('alane', '11122200007', '48 23232323', 'alanilda@gmail.com', '03/03/2021'),
('luiza insonsa', '22200011109', '48 45454545', 'luizinhoviadinho24@gmail.com', '25/11/2003'),
('geovannela', '20011122208', '48 34343434', 'geovanellafodona@gmail.com', '03/04/2021'),
('adriano', '10000011106', '48 12121212', 'adrianinfodao@gmail.com', '02/03/2020')

SELECT AVG(quilometragem) FROM veiculo
SELECT AVG(quilometragem) AS MEDIA_QUILOMETRAGEM FROM veiculo
--ROUND arredonda o numero de casas conforme solicitado
SELECT ROUND(AVG(quilometragem),2) FROM veiculo
SELECT SUM(preco_venda) FROM veiculo
--SUM soma os precos --WHERE filtrar conforme solicitado
SELECT ROUND(SUM(preco_venda),1) FROM veiculo WHERE cor = 'branco'

--BETWEEN filtra, e tras os resultados entre os espicificados
SELECT SUM(valor_total) FROM vendas WHERE data_venda BETWEEN '2024/11/15' AND '2025/11/15'

SELECT  * FROM vendas ORDER BY valor_total --Ordena
SELECT  * FROM vendas ORDER BY valor_total ASC --Ordena em forma crescente
SELECT  * FROM vendas ORDER BY valor_total DESC -- Ordena de forma decrescente

--LIKE Filtra pelo que voce pede 
SELECT * FROM cliente WHERE nome LIKE '%nho%'

SELECT * FROM cliente ORDER BY nome DESC

