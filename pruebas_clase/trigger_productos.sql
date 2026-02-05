

-- crear un trigger que actualice las existencias de la tabla
-- productos cuando  se inserte un nuevo detalle de pedido:

create or alter trigger actualizar_existencias 
on "detalles de pedidos"
after insert as
	update productos set UnidadesEnExistencia = UnidadesEnExistencia - inserted.cantidad
	from productos p inner join inserted on p.idproducto = inserted.idproducto
	where p.IdProducto = inserted.idproducto;

go