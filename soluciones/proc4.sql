
CREATE PROCEDURE dbo.proc4
	@idpedido int,
	@idproducto int,
	@cantidad int
AS
BEGIN
	declare @precio float
	declare @cantidadDisponible int

	if exists(select idpedido from dbo.[detalles de pedidos] where idpedido = @idpedido) and
		exists(select idproducto from dbo.productos where idproducto = @idproducto)
		begin
			select @precio = precioUnidad, @cantidadDisponible = UnidadesEnExistencia from dbo.Productos 
				where idproducto = @idproducto

			if @cantidad <= @cantidadDisponible 
				begin
					if exists(select * from dbo.[Detalles de pedidos] where idpedido = @idpedido AND idproducto = @idproducto)
						update dbo.[Detalles de pedidos] set cantidad = cantidad + @cantidad where idpedido = @idpedido and idproducto = @idproducto
					else
						insert into dbo.[Detalles de pedidos] (idpedido, idproducto, PrecioUnidad, Cantidad, Descuento)
							values (@idpedido, @idproducto, @precio, @cantidad, 0)
				end
			else
				print 'No hay cantidad suficiente'				
		end
	else
		print 'El idpedido y idproducto deben de existir'		
		
END
GO
