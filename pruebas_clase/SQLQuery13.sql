

insert into vista_productos([IdProducto],[NombreProducto],[IdProveedor],[IdCategoría],suspendido) 
values(100, 'Pepsi',1,1,0);


select * from productos order by IdProducto desc;

exec nuevo_producto 'pepsi 6', 'Exotic Liquids', 'Bebidas', 2.5,1;