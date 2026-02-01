-- Prueba del proc 3_v2

declare @id_cuenta_primera int
declare @id_cuenta_ultima int

declare @cuenta_primera nchar(10)
declare @cuenta_ultima nchar(10)
declare @cantidad int

declare @i int

-- Eliminar todos los movimientos:
delete from dbo.MOVIMIENTOS

-- capturar la primera cuenta
select top 1 @id_cuenta_primera = idcuenta, @cuenta_primera = numcuenta from dbo.CUENTAS order by idcuenta 

set @i = 1
while @i <= 6
	begin
		set @cantidad = @i * 100

		if @i % 2 = 0
			set @cantidad = -1 * @cantidad
			
		exec dbo.proc3_v2 @cantidad, '1/2/2010', @cuenta_primera
		set @i = @i + 1
	end


-- Capturar la última cuenta
select top 1 @id_cuenta_ultima = idcuenta, @cuenta_ultima = numcuenta from dbo.CUENTAS order by idcuenta desc 

set @i = 1
while @i <= 8
	begin
		set @cantidad = @i * 100

		if @i % 2 = 0
			set @cantidad = -1 * @cantidad
			
		exec dbo.proc3_v2 @cantidad, '1/2/2010', @cuenta_ultima
		set @i = @i + 1
	end