declare @pos1 int, @pos2 int
declare @nombre_completo nvarchar(80), @nombre nvarchar(25), @ape1 nvarchar(25), @ape2 nvarchar(25)

set @nombre_completo = 'Antonio Espin Herranz'

set @pos1 = charindex(' ', @nombre_completo, 1)
set @nombre = left(@nombre_completo, @pos1-1)
set @pos2 = charindex(' ', @nombre_completo, @pos1+1)
set @ape2 = right(@nombre_completo, len(@nombre_completo) - @pos2)
set @ape1 = substring(@nombre_completo, @pos1+1, @pos2 - @pos1 - 1)

print 'El nombre es:' + @nombre
print 'El primer apellido es:' + @ape1
print 'El segundo apellido es:' + @ape2