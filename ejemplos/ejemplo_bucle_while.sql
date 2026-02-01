-- Prueba de un bucle while

declare @i int
set @i = 0

while @i < 10 
begin
	print @i
	set @i = @i + 1

end