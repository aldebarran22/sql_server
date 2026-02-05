CREATE OR ALTER PROCEDURE dbo.ExecShell
    @cmd NVARCHAR(4000)
AS
BEGIN
    -- Desactivar la información d enumero de filas afectado
    SET NOCOUNT ON;

    --  Crear una variable de tipo tabla
    -- Solo existe durante la ejecución del procedure
    DECLARE @output TABLE (line NVARCHAR(4000));

    INSERT INTO @output
    EXEC xp_cmdshell @cmd;

    SELECT * FROM @output;
END;
GO
