-- Prueba con indices:
use Empresa_PRC;

begin try
create index idx_pedidos on Pedidos(idcliente, idempleado); 
end try
begin catch
	print error_number()
	print error_message()
	print error_line()
	print error_procedure()
end catch


-- Prueba de crear un indice con una función:
-- Un indice con el nombre del pais del pedido en mayúsculas:
begin try
--create index idx_pais on pedidos(lower([PaísDestinatario]));
print 'Crear el indice sobre una funcion aplicada a una columna da error';
end try
begin catch
	print error_number()
	print error_message()
	print error_line()
	print error_procedure()
end catch

-- Solución a lo del indice, crear una columna calculada:
alter table pedidos add pais as upper([PaísDestinatario]) persisted;
-- Con persisted 
