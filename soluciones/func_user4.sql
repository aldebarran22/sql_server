
CREATE FUNCTION dbo.func_user4(@codprofe int)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @sueldo_final float
	DECLARE @sueldo_base float

	if exists(select * from dbo.Profesores where CodProfe = @codprofe)
		begin
			select @sueldo_base = sueldo from dbo.Profesores where CodProfe = @codprofe
			set @sueldo_final = @sueldo_base * 12 + 500
		end
	else
			set @sueldo_final = -1
		
	RETURN @sueldo_final
END
GO

