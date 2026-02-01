
CREATE PROCEDURE dbo.proc3_v2
@importe float,
	@fecha datetime,
	@cuenta nchar(10)
AS
BEGIN
	declare @idcuenta int
	declare @saldo_actual float

	if exists(select * from dbo.cuentas where numcuenta = @cuenta)
		begin
			-- capturar el id de la cuenta:
			select @idcuenta = idcuenta, @saldo_actual = saldo from dbo.CUENTAS where numcuenta = @cuenta

			if @saldo_actual + @importe > 0
				begin
					-- Grabamos el movimiento.
					insert into dbo.movimientos(idcuenta, importe_movimiento, fecha) 
						values (@idcuenta, @importe, @fecha) 

					-- NO Actualizamos el saldo de la cuenta, lo hará el Trigger:
					--update dbo.cuentas set saldo = saldo + @importe where idcuenta = @idcuenta
				end
			else
				print 'No se puede retirar dinero. Saldo disponible: ' + convert(nvarchar(20), @saldo_actual)
		end
	else
		print 'El número de cuenta no existe'	
END