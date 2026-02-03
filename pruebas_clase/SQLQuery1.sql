select c.NombreProducto, [p.NombreCategoría] from Categorias c
inner join Productos p on [p.IdCategoría] = [c.IdCategoría];

select idcategoría from categorias;

select * from clientes;

select * from productos;

select p.NombreProducto, c.NombreCategoría from Categorias c, Productos p 
where p.IdCategoría = c.IdCategoría;


select p.NombreProducto, c.NombreCategoría from Categorias c
inner join  Productos p 
on p.IdCategoría = c.IdCategoría;

insert into categorias values((select max(idcategoría)+1 from categorias),'Ocio','Viajes');

select c.NombreCategoría from Categorias c
left join Productos p 
on p.IdCategoría = c.IdCategoría where p.IdCategoría is null;

select c.NombreCategoría from PRODUCTOS p
right join  Categorias c
on p.IdCategoría = c.IdCategoría where p.IdCategoría is null;

select NombreCategoría from Categorias 
where IdCategoría not in (select IdCategoría from productos);

select p.NombreProducto, c.NombreCategoría from categorias c, productos p 
where  p.NombreProducto is null;


select c.NombreContacto, e.nombre, p.cargo
from pedidos p
inner join clientes c on c.IdCliente = p.IdCliente
inner join empleados e on e.IdEmpleado = p.IdEmpleado
where p.cargo between 30 and 100
order by 3 desc;

/*  */

select pais, total from (
select  [PaísDestinatario] as pais, 
(sum(cargo)/(select sum(cargo) from pedidos)*100) as total 
from pedidos
group by [PaísDestinatario])
where total > 50
order by 2 desc;

with paises as (select  [PaísDestinatario] as pais, 
(sum(cargo)/(select sum(cargo) from pedidos)*100) as total 
from pedidos
group by [PaísDestinatario])
select * from paises where total > 5;


select top 10 cargo from pedidos order by 1 desc;

UPDATE pedidos
SET cargo = cargo * 1.05
OUTPUT inserted.IdPedido, inserted.cargo
where cargo > 5000


select getdate();

select ERROR_NUMBER();

select @@error;


select p.nombreproducto, c.nombrecategoría
from productos p, categorias c;

select p.nombreproducto, c.nombrecategoría
from productos p cross join categorias c;







