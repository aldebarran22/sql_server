SELECT 
CASE transaction_isolation_level 
WHEN 0 THEN 'Unspecified' 
WHEN 1 THEN 'Read Uncommitted'
WHEN 2 THEN 'Read Committed' 
WHEN 3 THEN 'Repeatable Read' 
WHEN 4 THEN 'Serializable'
WHEN 5 THEN 'Snapshot' 
END AS isolation_level 
FROM sys.dm_exec_sessions 
WHERE session_id = @@SPID;


USE Empresa_PRC;

-- TABLA DE PRUEBAS:
CREATE TABLE dbo.TestLock (
    Id INT PRIMARY KEY,
    Valor VARCHAR(50)
);

INSERT INTO dbo.TestLock VALUES (1, 'Inicial');


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
WHERE blocking_session_id<> 0;

select * from sys.databases;

SELECT
OBJECT_NAME(p.object_id) AS Tabla,
p.index_id,
pa.allocated_page_page_id AS page_id,
pa.allocated_page_file_id AS file_id
FROM sys.partitions AS p
JOIN sys.allocation_units AS au
ON p.hobt_id = au.container_id
JOIN sys.dm_db_database_page_allocations(8, NULL, NULL, NULL, 'DETAILED') AS pa
ON au.allocation_unit_id = pa.allocation_unit_id;

WHERE pa.allocated_page_page_id= 704
AND pa.allocated_page_file_id= 1;


select object_name(18099105);


select * FROM sys.dm_tran_locks;

select * FROM sys.dm_exec_requests where database_id=8;

sp_who;
sp_lock;

select * from msdb.sys.procedures where name like '%who%';

DBCC TRACEON(3604);

select object_name(72057594048479232);

SELECT * FROM sys.dm_exec_requests WHERE session_id= 148;

select * from sys.dm_tran_session_transactions;

SELECT * FROM sys.dm_exec_requests WHERE session_id= 148;
SELECT text FROM sys.dm_exec_sql_text(0x020000007BD4C30DAAB3CF89E033C4830597769E0EDDE30A0000000000000000000000000000000000000000);--, sys.dm_exec_requests r where r.session_id=148;

select * from sys.dm_exec_requests;

