
-- Prueba de la función que calcula el importe total de un pedido.

declare @id_pedido int

set @id_pedido = 10248

print 'El importe del pedido ' + convert(nvarchar(30), @id_pedido) + ' es ' + convert(nvarchar(30),dbo.func_user1(@id_pedido))
