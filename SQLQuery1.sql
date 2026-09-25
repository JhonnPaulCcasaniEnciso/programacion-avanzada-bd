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

Parte 4: 

USE AdministracionEP01;
GO

-- ============================================================================
-- ACTIVIDAD 4: Subconsultas y Contraste de Alternativas
-- Caso de Uso: Clientes con compras de productos en Stock Crítico (< 15)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- OPCIÓN A: Utilizando Subconsulta con IN
-- Propósito: Obtener el listado de clientes cuyo ClienteID pertenezca al 
-- conjunto de IDs obtenido mediante una subconsulta que filtra productos con poco stock.
-- ----------------------------------------------------------------------------
SELECT 
    c.ClienteID,
    c.DNI,
    c.NombreCompleto,
    c.Telefono
FROM 
    Clientes c
WHERE 
    c.ClienteID IN (
        SELECT v.ClienteID
        FROM Ventas v
        INNER JOIN DetalleVentas dv ON v.VentaID = dv.VentaID
        INNER JOIN Productos p ON dv.ProductoID = p.ProductoID
        WHERE p.Stock < 15
    );
GO

-- ----------------------------------------------------------------------------
-- OPCIÓN B: Utilizando Subconsulta Correlacionada con EXISTS
-- Propósito: Obtener el mismo listado evaluando la existencia de al menos
-- una venta ligada al cliente que contenga un producto con stock crítico.
-- ----------------------------------------------------------------------------
SELECT 
    c.ClienteID,
    c.DNI,
    c.NombreCompleto,
    c.Telefono
FROM 
    Clientes c
WHERE 
    EXISTS (
        SELECT 1
        FROM Ventas v
        INNER JOIN DetalleVentas dv ON v.VentaID = dv.VentaID
        INNER JOIN Productos p ON dv.ProductoID = p.ProductoID
        WHERE v.ClienteID = c.ClienteID
          AND p.Stock < 15
    );
GO
