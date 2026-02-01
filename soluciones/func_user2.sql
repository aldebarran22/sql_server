--Comprueba si existe un Socio en la Base de datos.
-- Devuelve 
CREATE FUNCTION dbo.func_user2
(
	@login nvarchar(10), @pass nvarchar(10)
)
RETURNS int
AS
BEGIN

	DECLARE @resultado int

	if exists(select id from dbo.Socios where login = @login) 
		if exists(select id from dbo.socios where login = @login and password = @pass)
			set @resultado = 0
		else
			set @resultado = 1	
	else
		set @resultado = 2
	
	RETURN @resultado

END
GO

