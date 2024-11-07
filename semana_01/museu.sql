create type tipo_obra as enum ('pintura', 'escultura');

create table obra_de_arte (
	id serial primary key,
	titulo varchar(25) not null,
	descricao varchar(50) not null,
	ano_criacao integer,
	tipo tipo_obra not null
);
 

create table artista (
	id serial primary key,
	nome varchar(20) not null,
	data_nascimento date not null,
	descricao varchar(50) not null
);

create table exposicao (
	id serial primary key,
	titulo varchar(25) not null,
	data_inicio date not null,
	data_termino date not null,
	local varchar(50) not null
);

create table visitantes (
	id serial primary key,
	nome varchar(20) not null,
	email varchar(100) unique not null
);


select * from usuarios

drop table usuarios


-- insert into usuarios (nome, email)
-- values
-- ('breinin', 'josezin190@gmail.com')

-- update usuarios set where id = 1, ativo = 1

-- delete from usuarios where id = 1

-- drop table usuarios

-- insert into usuarios values (default, 'breinin', 'josezifsfdfgddn190@gmail.comgdf')

-- select * from usuarios

-- alter table usuarios add column ativo boolean default true


create table visita (
	id SERIAL PRIMARY KEY,
	data_visita DATE NOT NULL,
	exposicao_id INTEGER NOT NULL,
	visitantes_id INTEGER NOT NULL,
	FOREIGN KEY (exposicao_id) REFERENCES exposicao(id) ON DELETE CASCADE,
	FOREIGN KEY (visitantes_id) REFERENCES visitantes(id) ON DELETE CASCADE
)

select * FROM visita;

select * FROM visitantes;

insert into visitantes (nome, email) values ('Breno', 'breno222@gmail.com');
insert into visitantes (nome, email) values ('Brendo', 'brendo222@gmail.com');
insert into visitantes (nome, email) values ('Brenin', 'brenin222@gmail.com');

select * from exposicao;

insert into exposicao (titulo, data_inicio, data_termino, local) values ('exposicao 01', '2024-10-10', '2024-10-13', 'adec');
insert into exposicao (titulo, data_inicio, data_termino, local) values ('exposicao 02', '2024-10-11', '2024-10-14', 'marginal br101');
insert into exposicao (titulo, data_inicio, data_termino, local) values ('exposicao 03', '2024-10-12', '2024-10-15', 'galpao ruimdnex');

select * from visita;

insert into visita (data_visita, exposicao_id, visitantes_id) values ('2024-10-10', 1, 3);
insert into visita (data_visita, exposicao_id, visitantes_id) values ('2024-10-15', 2, 3);
insert into visita (data_visita, exposicao_id, visitantes_id) values ('2024-10-11', 1, 1);
insert into visita (data_visita, exposicao_id, visitantes_id) values ('2024-10-13', 1, 2);

delete from visita where id = 2;

delete from obra_de_arte where id = 2;

create table obra_arte_exposicao (
	id serial primary key,
	obra_arte_id integer not null,
	exposicao_id integer not null
)

select * from obra_arte_exposicao;


alter table obra_arte_exposicao
add constraint fk_obra_arte_id_key
foreign key (obra_arte_id) references obra_de_arte(id);

alter table obra_arte_exposicao
add constraint fk_exposicao_id_key
foreign key (exposicao_id) references exposicao(id);

select * from obra_de_arte;

insert into obra_de_arte (titulo, descricao, ano_criacao, tipo) values ('monalisa', 'mulher ociosa me olhando', '1900', 'pintura');
insert into obra_de_arte (titulo, descricao, ano_criacao, tipo) values ('pezao', 'pe maior que a cabeca', '1940', 'pintura');
insert into obra_de_arte (titulo, descricao, ano_criacao, tipo) values ('monalisa da shopee', 'olhando estranho', '1956', 'escultura');

select * from obra_arte_exposicao;

insert into obra_arte_exposicao (obra_arte_id, exposicao_id) values (4, 3);
insert into obra_arte_exposicao (obra_arte_id, exposicao_id) values (4, 1);
insert into obra_arte_exposicao (obra_arte_id, exposicao_id) values (1, 3);
insert into obra_arte_exposicao (obra_arte_id, exposicao_id) values (3, 1);
insert into obra_arte_exposicao (obra_arte_id, exposicao_id) values (1, 1);

delete from obra_arte_exposicao where id = 6;
delete from obra_arte_exposicao where id = 7;
delete from obra_arte_exposicao where id = 8;
delete from obra_arte_exposicao where id = 9;
delete from obra_arte_exposicao where id = 10;

/******************************************************************************************/

create table obra_arte_artista (
	id serial primary key,
	id_artista integer not null,
	obra_arte_id integer not null,
	foreign key (id_artista) references artista(id)
);

alter table obra_arte_artista
add constraint fk_obra_de_arte foreign key(obra_arte_id) references obra_de_arte(id); /* Adiciona chave estrangeira */

select * from obra_arte_artista;

select * from obra_de_arte;

select * from artista;

insert into artista (nome, data_nascimento, descricao)
values('junior', '1930-02-13', 'pintor de muro');
insert into artista (nome, data_nascimento, descricao)
values('juninho', '1978-12-29', 'pintor de parede');
insert into artista (nome, data_nascimento, descricao)
values('juniao', '1925-09-10', 'rebocador de muro');
insert into artista (nome, data_nascimento, descricao)
values('Luiz', '2003-04-03', 'rebocador de vasos');

update artista set nome = 'brenin' where id = 1;

insert into obra_arte_artista (id_artista, obra_arte_id) values (3, 3);
insert into obra_arte_artista (id_artista, obra_arte_id) values (3, 4);
insert into obra_arte_artista (id_artista, obra_arte_id) values (3, 1);
insert into obra_arte_artista (id_artista, obra_arte_id) values (1, 4);
insert into obra_arte_artista (id_artista, obra_arte_id) values (2, 1);
insert into obra_arte_artista (id_artista, obra_arte_id) values (1, 3);

select count (*) total_obras_arte from obra_de_arte; /* tras o numero de itens na tabela */

select * from obra_de_arte
join obra_arte_exposicao on obra_de_arte.id = obra_arte_exposicao.obra_arte_id
join exposicao ON obra_arte_exposicao.exposicao_id = exposicao_id

select * from obra_de_arte
join obra_de_arte on obra_de_arte.id = obra_de_arte.obra_arte_id
join visitantes ON obra_arte_exposicao.exposicao_id = exposicao_id




