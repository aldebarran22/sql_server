declare @nombre_completo nvarchar(60), @nombre nvarchar(20), @ape1 nvarchar(20), @ape2 nvarchar(20)

set @nombre_completo = 'Antonio Espin Herranz'
exec dbo.proc1 @nombre_completo, @nombre output, @ape1 output, @ape2 output

print 'El nombre es:' + @nombre
print 'El primer apellido es:' + @ape1
print 'El segundo apellido es:' + @ape2

