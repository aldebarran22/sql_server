BEGIN TRY
    SELECT CAST('ABC' AS INT);
END TRY
BEGIN CATCH
select error_number();
/*
    SELECT 
        ERROR_NUMBER() AS Numero,
        ERROR_MESSAGE() AS Mensaje,
        ERROR_LINE() AS Linea;
    */
END CATCH;

select fecha=getdate();