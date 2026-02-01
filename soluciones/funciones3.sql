
declare @i int, @j int
declare @saldo float
declare @cuenta nvarchar(20)
declare @letra nvarchar(5)

if exists(select * from dbo.CUENTAS)
	delete from dbo.CUENTAS

set @i = 1
while @i <= 10
	begin
		-- Generar el número de cuenta:
		set @j = 1
		set @cuenta = ''

		-- Las 4 letras aleatorias:
		while @j <= 4
			begin
				set @letra = char(65 + (round(rand() * 25, 0)))
				set @cuenta = @cuenta + @letra
				set @j = @j + 1
			end

		-- Los 6 digitos aleatorios
		set @j = 1
		while @j <= 6
			begin
				set @cuenta = @cuenta + convert(nvarchar(5), round(rand() * 9, 0))
				set @j = @j + 1
			end

		-- Generar el saldo:
		set @saldo = 1000 + round(rand() * 4000, 0)
		
		-- Grabar el registro:
		insert into dbo.CUENTAS(numcuenta, saldo) values (@cuenta, @saldo)
		set @i = @i + 1
	end
