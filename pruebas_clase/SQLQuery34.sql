

-- prueba trigger actualizar existencias de un producto:

insert into [Detalles de pedidos] values(10248, 2, 20, 7, 0);

select * from productos where IdProducto = 2;