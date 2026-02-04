-- Prueba con indices:
--===================
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

------------------------------------------------------------------------------------

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
-- =====================================================
begin try
	-- Crear una columna y luego asignar el indice:
	alter table pedidos add pais as upper([PaísDestinatario]) persisted;
	create index idx_pais on pedidos([pais]);
	-- Con persisted indicas que se calcule una vez y se guarde, si no ponemos persisted se calcula cada vez que se hace la consulta.
	-- Si hacemos un UPDATE el valor del indice se recalcula.
end try
begin catch
	print error_number()
	print error_message()
	print error_line()
	print error_procedure()
end catch

select idpedido, [PaísDestinatario],[pais] from pedidos;
update pedidos  set [PaísDestinatario]='Suiza' where IdPedido=10248;



-- consultar los indices:para el catálogo del sistema: sys
--=======================================================
-- sys.tables: lista de tablas
-- sys.columns: lista de columnas
-- sys.indexes: lista de índices
-- sys.objects: lista de todos los objetos
-- sys.views: lista de vistas
-- sys.procedures: procedimientos almacenados
-- sys.foreign_keys: claves foráneas

select * from sys.databases;


select * from sys.sysobjects;


select * from sys.sysobjects;

-- Se suele utilizar la función IOBJECT_ID('nombre de objeto')
select OBJECT_ID('Pedidos'); -- es como si fuera un Hash

select * from sys.indexes where object_id = OBJECT_ID('Pedidos');
-- TIPOS DE INDICE:
-- CLUSTERED SOLO 1 POR TABLA, RAPIDOS, MAS COSTOSAS LAS INSERCIONES SI ROMPEN EL ORDEN, ORDENA FISICAMENTE LOS DATOS: IDEAL PARA
-- PKs, COLUMNAS IDENTITY, GUID, UNA FECHA EN UN LOG.
--	CREATE CLUSTERED INDEX NOMBRE ON TABLA(COLUMNAS);

-- NONCLUSTERED ES SECUNDARIO, MUCHOS POR TABLA, NO CAMBIA EL ORDEN FISICO DE LOS DATOS:
--	CREATE NONCLUSTERED INDEX NOMBRE ON TABLA(COLUMNAS);
--  si no ponemos nada al crear el indice sera de tipo nonclustered!


------------------------------------------------------------------------------------