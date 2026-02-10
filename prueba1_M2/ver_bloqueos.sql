
SELECT
request_session_id AS Sesion,
resource_type AS Recurso,
resource_description AS Descripcion,
request_mode AS Modo,
request_status AS Estado
FROM sys.dm_tran_locks
ORDER BY request_session_id;

-- ver los bloqueos:
SELECT
blocking_session_id AS Bloqueador,
session_id AS Bloqueado,
wait_type,
wait_time,
wait_resource
FROM sys.dm_exec_requests
WHERE blocking_session_id<> 0;

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
WHERE r.session_id = 147;

select * from sys.dm_exec_requests where status='suspended';
