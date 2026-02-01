
CREATE TRIGGER dbo.trigger3
   ON  dbo.[Detalles de pedidos]
   AFTER UPDATE
AS 
BEGIN
	-- Tenemos que actualizar la unidades en existencia de la tabla de productos:
	declare @cantidad_nueva int, @cantidad_antigua int, @cantidad int
	declare @idproducto int

	-- Capturar el idproducto y la cantidad insertada:
	select @cantidad_nueva = cantidad, @idproducto = idproducto from inserted 

	-- Capturar la cantidad antigua:
	select @cantidad_antigua = cantidad, @idproducto = idproducto from deleted 


	-- Actualizar en productos:
	set @cantidad = @cantidad_nueva - @cantidad_antigua
	update dbo.productos set unidadesEnExistencia = unidadesEnExistencia - @cantidad where idproducto = @idproducto

END
GO
