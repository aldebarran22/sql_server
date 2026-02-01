-- Código de la transaccion

declare @idpedido int
declare @idproducto int
declare @cantidad int

declare @precio float
declare @cantidadDisponible int

declare @err_detalles int
declare @err_productos int

-- Dar valores iniciciales a las variables:
set @idpedido = 10248
set @idproducto = 1
set @cantidad = 5

if exists(select idpedido from dbo.[detalles de pedidos] where idpedido = @idpedido) and
	exists(select idproducto from dbo.productos where idproducto = @idproducto)
	begin
		select @precio = precioUnidad, @cantidadDisponible = UnidadesEnExistencia from dbo.Productos 
			where idproducto = @idproducto

		if @cantidad <= @cantidadDisponible 
			begin
				-- Inicio de transacción.
				begin transaction

					if exists(select * from dbo.[Detalles de pedidos] where idpedido = @idpedido AND idproducto = @idproducto)
						begin
							update dbo.[Detalles de pedidos] set cantidad = cantidad + @cantidad where idpedido = @idpedido and idproducto = @idproducto
							set @err_detalles = @@error
						end

					else
						begin
							insert into dbo.[Detalles de pedidos] (idpedido, idproducto, PrecioUnidad, Cantidad, Descuento)
								values (@idpedido, @idproducto, @precio, @cantidad, 0)
							set @err_detalles = @@error
						end

					-- Actualizar la tabla de productos:
					update dbo.productos set unidadesEnExistencia = unidadesEnExistencia - @cantidad where idproducto = @idproducto 
					set @err_productos = @@error

				-- Fin de transacción.
				if @err_detalles = 0 and @err_productos = 0
					commit transaction
				else
					rollback transaction

			end
		else
			print 'No hay cantidad suficiente'				
	end
else
	print 'El idpedido y idproducto deben de existir'		
	
