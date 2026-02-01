-- Calcular el importe total de un pedido.
CREATE FUNCTION dbo.func_user1
(
	@id_pedido int
)
RETURNS money
AS
BEGIN
	DECLARE @resultado money, @cargo money, @detalles money

	select @cargo = cargo from dbo.pedidos where idpedido = @id_pedido
	select @detalles = PrecioUnidad * Cantidad * (1- Descuento) from [Detalles de pedidos] where idpedido = @id_pedido
	set @resultado = @cargo + @detalles
	RETURN @resultado
END
GO

