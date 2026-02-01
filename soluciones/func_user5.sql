
CREATE FUNCTION dbo.func_user5(@codprofe int)
RETURNS float
AS
BEGIN
	DECLARE @sueldo_base float
	DECLARE @aumento float
	DECLARE @sueldo_final float

	if exists(select * from dbo.Profesores where CodProfe = @codprofe)
		begin
			select @sueldo_base = sueldo from dbo.Profesores where CodProfe = @codprofe
			
			if @sueldo_base > 1000 
				set @aumento = 1.05
			else
				set @aumento = 1.08

			set @sueldo_final = @sueldo_base * @aumento
		end
	else
		set @sueldo_final = -1

	RETURN @sueldo_final

END
GO

