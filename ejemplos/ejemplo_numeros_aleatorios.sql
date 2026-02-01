-- Prueba generar numeros aleatorios
declare @counter smallint
set @counter = 1
while @counter <= 5
	begin
		select rand() random_number
		set @counter = @counter + 1
	end
go