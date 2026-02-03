BEGIN TRY
SELECT CAST('ABC' AS INT); -- Error de conversión
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS NumeroError,
ERROR_MESSAGE() AS Mensaje,
ERROR_LINE() AS Linea,
ERROR_PROCEDURE() AS Procedimiento;
END CATCH;

select @@connections;