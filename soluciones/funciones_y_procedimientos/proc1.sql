CREATE PROCEDURE dbo.proc1 
	@nombre_completo nvarchar(60),
	@nombre nvarchar(20)='' output,
	@ape1 nvarchar(20)='' output,
	@ape2 nvarchar(20)='' output
AS
BEGIN
	declare @pos1 int, @pos2 int

	set @pos1 = charindex(' ', @nombre_completo, 1)
	if (@pos1 <> 0)
		begin
			set @nombre = left(@nombre_completo, @pos1-1)

			-- Localizar el 2 blanco:
			set @pos2 = charindex(' ', @nombre_completo, @pos1+1)

			if (@pos2 <> 0)
				begin
					set @ape2 = right(@nombre_completo, len(@nombre_completo) - @pos2)
					set @ape1 = substring(@nombre_completo, @pos1+1, @pos2 - @pos1 - 1)
				end
		end
END
GO
