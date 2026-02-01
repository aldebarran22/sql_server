
CREATE TRIGGER dbo.trigger2
   ON  dbo.[Detalles de pedidos]
   AFTER INSERT
AS 
BEGIN
	-- Tenemos que actualizar la unidades en existencia de la tabla de productos:
	declare @cantidad int
	declare @idproducto int

	-- Capturar el idproducto y la cantidad insertada:
	select @cantidad = cantidad, @idproducto = idproducto from inserted 

	-- Actualizar en productos:
	update dbo.productos set unidadesEnExistencia = unidadesEnExistencia - @cantidad where idproducto = @idproducto
END
GO
