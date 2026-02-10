
use Empresa_PRC;


EXEC sp_configure 'max server memory (MB)';

SELECT 
    name,
    value_in_use AS ValorActual_MB,
    value AS ValorConfigurado_MB
FROM sys.configurations
WHERE name = 'max server memory (MB)';

select * from sys.configurations;


-- Ver la memoria utilizada por sql server:
SELECT 
    physical_memory_in_use_kb / 1024 AS MemoriaUsada_MB,
    locked_page_allocations_kb / 1024 AS LockedPages_MB,
    total_virtual_address_space_kb / 1024 AS Virtual_MB,
    process_physical_memory_low AS MemoriaBaja,
    process_virtual_memory_low AS VirtualBaja
FROM sys.dm_os_process_memory;


-- memoria total del sistema:
SELECT 
    total_physical_memory_kb / 1024 AS RAM_Total_MB,
    available_physical_memory_kb / 1024 AS RAM_Libre_MB
FROM sys.dm_os_sys_memory;


-- Tamaño del buffer Pool:
SELECT 
    COUNT(*) * 8 / 1024 AS BufferPool_MB
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767;  -- excluye ResourceDB

SELECT 
    COUNT(*)  AS numero_paginas_en_memoria
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767;  -- excluye ResourceDB


-- Ver que bd se esta llevando la memoria:
SELECT 
    DB_NAME(database_id) AS BaseDatos,
    COUNT(*) * 8 / 1024 AS BufferPool_MB
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767
GROUP BY database_id
ORDER BY BufferPool_MB DESC;


-- limpiar el buffer pool
DBCC DROPCLEANBUFFERS;

-- Para rendimiento:
CHECKPOINT;
DBCC DROPCLEANBUFFERS;

SELECT * FROM dbo.Pedidos;  -- lectura desde disco


SELECT 
    COUNT(*) * 8 / 1024 AS BufferPool_MB
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767;


-- Consultar:
SELECT 
    type AS Clerk,
    SUM(pages_kb) / 1024 AS MB
FROM sys.dm_os_memory_clerks
WHERE type IN (
    'CACHESTORE_SQLCP',   -- ad hoc
    'CACHESTORE_OBJCP',   -- stored procedures
    'CACHESTORE_PHDR',    -- parametrizados
    'CACHESTORE_XPROC'    -- extended procs
)
GROUP BY type
ORDER BY MB DESC;


-- Plan cache:
SELECT 
    type,
    SUM(pages_kb) / 1024 AS MB
FROM sys.dm_os_memory_clerks
WHERE type LIKE '%CACHE%'
GROUP BY type
ORDER BY MB DESC;

-- Ver el total:
SELECT 
    SUM(size_in_bytes) / 1024 / 1024 AS PlanCache_MB
FROM sys.dm_exec_cached_plans;

