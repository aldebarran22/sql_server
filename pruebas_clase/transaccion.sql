

-- Gestión de una TX con try / catch
declare @n int;

set @n = 100;
begin try
	begin transaction
	    select * from Productos where IdProducto=1;
		update productos set  PrecioUnidad = PrecioUnidad * 1.2 where idproducto = 1
	
		insert into productos (idproducto, nombreProducto, idproveedor, idcategoría, 
		precioUnidad, Suspendido) values(1, 'Pepsi', 1,1,2.5, 0);

		commit transaction;
		print 'TX confirmada';
		 select * from Productos where IdProducto=1;
end try

begin catch
	print error_message();
	rollback transaction;
	print 'Hacemos rollback';

end catch