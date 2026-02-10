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


-- EJEMPLOS SUPONIENDO QUE EL WAIT_RESOURCE ES: RID: 8:1:704:0

-- Ver la base de datos donde esta el bloqueo: de la anterior en número de la BD, primer numero del wait_resource 
-- id_databses = 8
select * from sys.databases where database_id = 8;

-- Ver el archivo: 1
SELECT name, physical_name FROM sys.database_files WHERE file_id = 1;

-- Ver el page_id = 704
DBCC TRACEON(3604);
DBCC PAGE(8, 1, 704, 3); -- BD: 8, FILE: 1, PAGE: 704

SELECT 
    OBJECT_NAME(p.object_id) AS Tabla,
    p.index_id,
    pa.allocated_page_page_id AS page_id,
    pa.allocated_page_file_id AS file_id
FROM sys.partitions AS p
JOIN sys.allocation_units AS au 
    ON p.hobt_id = au.container_id
JOIN sys.dm_db_database_page_allocations(8, NULL, NULL, NULL, 'DETAILED') AS pa
    ON au.allocation_unit_id = pa.allocation_unit_id
WHERE pa.allocated_page_page_id = 704
  AND pa.allocated_page_file_id = 1;




    -- Ver los trace flags activos en el servidor
    dbcc tracestatus(-1);


    SELECT 
    r.session_id,
    t.text AS SqlEjecutado,
    r.status,
    r.command,
    r.wait_type,
    r.wait_time,
    r.wait_resource
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) t
WHERE r.session_id = 109;   -- OJO EL NUMERO DE LA SESION BLOQUEADA, LO VEMOS EN LAS VENTANAS DE CONSULTA DEL SSMS