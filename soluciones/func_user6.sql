
ALTER FUNCTION dbo.func_user6(@id_venta int)
RETURNS nvarchar(25)
AS
BEGIN
	DECLARE @resul nvarchar(25)
	DECLARE @dias_pedido int, @dias_entrega int
	DECLARE @fecha_cancelacion datetime

	if exists(select * from dbo.VENTAS where id = @id_venta)
		begin
			select @dias_pedido = datediff(d, FechaPrimerContacto, fechaPedido),
				   @dias_entrega = datediff(d, fechaPedido, fechaEntrega),
				   @fecha_cancelacion = FechaCancelacion
			from dbo.VENTAS
			where id = @id_venta

			
			if @fecha_cancelacion is not NULL
				begin
					if @dias_pedido <= @dias_entrega
						set @resul = 'A revisar por Almacén'
					else
						set @resul = 'A revisar por Comercial'

				end
			else
				set @resul = 'cancelación'
	
		end
	else
		set @resul = ''

	return @resul

END
GO

