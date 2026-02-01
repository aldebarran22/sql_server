DECLARE @fecha datetime,	@fechaFormateada varchar(20)
-- Convertimos ahora una fecha a varchar y la formateamos
-- 3 => dd/mm/aa
SET @fecha = GETDATE()
SET @fechaFormateada = CONVERT(varchar(20), @fecha, 3) 
SELECT @fechaFormateada
