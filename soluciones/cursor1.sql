use Empresa

declare @nombreCategoria nvarchar(50)
declare @numFilas int
declare miCursor CURSOR 
local scroll static
FOR select [nombreCategoría] from dbo.categorias


open miCursor
set @numFilas = @@Cursor_rows
 
FETCH miCursor into @nombreCategoria

while (@@fetch_status = 0)
	begin
		print @nombreCategoria
		FETCH miCursor into @nombreCategoria
	end

print 'Número de filas total es: ' + convert(nvarchar(10), @numFilas)
close miCursor
deallocate miCursor
