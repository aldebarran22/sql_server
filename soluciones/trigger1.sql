-- Trigger asociado al proc3_v2

create Trigger dbo.trigger1
on dbo.MOVIMIENTOS
AFTER INSERT
AS
	DECLARE @idcuenta int, @importe float

	-- Cargar las variables de la tabla inserted
	select @idcuenta = idcuenta, @importe = importe_movimiento from inserted

	update dbo.cuentas set saldo = saldo + @importe where idcuenta = @idcuenta
	
go