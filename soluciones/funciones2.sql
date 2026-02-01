
-- Generar un calendario a partir de un mes y un año:

declare @mes int, @año int
declare @dia int
declare @cadfecha nvarchar(20)


set @mes = 2
set @año = 2008

set @dia = 1

while @dia <= 31
	begin
		set @cadfecha = cast(@dia as nvarchar(5)) + '/' + cast(@mes as nvarchar(5)) + '/' + cast(@año as nvarchar(5))
		if isdate(@cadfecha)=1
			begin
				print @cadfecha
			end

		set @dia = @dia + 1
	end


			