create database alquilercoches
go


use alquilercoches;
go

use master;
go


ALTER DATABASE alquilercoches
MODIFY NAME = AlquilerCoches;
go

use AlquilerCoches;
go

create table ClienteDemo(
	IdCliente int primary key,
	Nombre varchar(80),
	DNI char (8) unique
);


alter table ClienteDemo
add DNI char(8) NULL;
go

drop table ClienteDemo
go

insert into ClienteDemo (IdCliente, Nombre, DNI)
values(1, 'Ana', '12345678')
go

insert into ClienteDemo (IdCliente, Nombre, DNI)
values(2, 'Juan', '22345678')
go

select * from ClienteDemo

update ClienteDemo
set IdCliente=1
where Nombre='Ana';
go

alter table ClienteDemo
add DepartInicial char(2) null
default 'LI';
go

insert into ClienteDemo (IdCliente, Nombre, DNI)
values(3, 'Lucas', '32345678')
go


update ClienteDemo
set DepartInicial='SL'
where IdCliente=2;
go

create table Agencia(
	idAgencia int primary key identity not null,
	Agencia varchar(100)
)

select * from Agencia;
go

insert into Agencia (Agencia)
values('Los Andes')
go

insert into Agencia (Agencia)
values('Los Pinos')
go

