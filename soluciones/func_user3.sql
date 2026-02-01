
CREATE FUNCTION dbo.func_user3()
RETURNS @datos TABLE (
	-- Estructura de la tabla que devuelve:
	idproducto int,
	total_en_pedido int,
	existencias int,
	A_pedir int,
	Proveedor nvarchar(50)
) 
AS BEGIN
	-- Variables necesarias para la lógica de la funcion.
	DECLARE @idproducto int, @total_en_pedido int, @existencias int, @A_pedir int, @Proveedor nvarchar(50)

	-- Cursor con los datos:
	DECLARE CDATOS CURSOR 
	FOR
	select idproducto,  sum(cantidad) as total_en_pedido , 
	(select UnidadesEnExistencia from dbo.Productos where idproducto = dbo.[Detalles de pedidos].idproducto ) as existencias,
	sum(cantidad) - (select UnidadesEnExistencia from dbo.Productos where idproducto = dbo.[Detalles de pedidos].idproducto) as A_pedir,
	(select [NombreCompañía] from dbo.Proveedores inner join  dbo.Productos on dbo.Proveedores.idproveedor = dbo.Productos.idproveedor where idproducto = dbo.[Detalles de pedidos].idproducto ) as Proveedor
	from dbo.[Detalles de pedidos]
	group by idproducto
	order by idproducto

	-- Abrir el cursor:
	OPEN CDATOS

	-- Recorrer el cursor, mandando los valores a las variables:
	FETCH CDATOS INTO @idproducto, @total_en_pedido, @existencias, @A_pedir, @Proveedor 

	-- Recorremos el cursor
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			-- Insertamos la linea en la variable de salida
			INSERT INTO @datos(idproducto, total_en_pedido, existencias, A_pedir, Proveedor)
				VALUES(@idproducto, @total_en_pedido, @existencias, @A_pedir, @Proveedor)
		 
			-- Avanzar al siguiente registro:
			FETCH CDATOS INTO @idproducto, @total_en_pedido, @existencias, @A_pedir, @Proveedor 
		END
	
	-- Cerrar y liberar el cursor:
	CLOSE CDATOS
	DEALLOCATE CDATOS

	RETURN 	
END
GO
