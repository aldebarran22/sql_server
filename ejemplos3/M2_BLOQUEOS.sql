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


SELECT 
    blocking_session_id AS Bloqueador,
    session_id AS Bloqueado,
    wait_type,
    wait_time,
    wait_resource
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;

