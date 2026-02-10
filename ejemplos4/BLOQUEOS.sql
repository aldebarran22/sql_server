use Empresa_PRC;

-- Ver los bloqueos:
-- LOS NUMEROS QUE APARECEN EN LAS PESTAÑAS SON LAS SESIONES:

SELECT 
    request_session_id AS Sesion,
    resource_type AS Recurso,
    resource_description AS Descripcion,
    request_mode AS Modo,
    request_status AS Estado
FROM sys.dm_tran_locks
ORDER BY request_session_id;



-- esta se ejecuta cuando tengamos un bloqueo
SELECT 
    blocking_session_id AS Bloqueador,
    session_id AS Bloqueado,
    wait_type,
    wait_time,
    wait_resource
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;


-- Ver la base de datos donde esta el bloqueo: de la anterior en número de la BD, primer numero del wait_resource 
-- id_databses = 8
select * from sys.databases where database_id = 8;

-- Ver el archivo: 1
SELECT name, physical_name FROM sys.database_files WHERE file_id = 1;

-- Ver el page_id = 704
DBCC TRACEON(3604);
DBCC PAGE(8, 1, 704, 3); -- BD: 8, FILE: 1, PAGE: 704
