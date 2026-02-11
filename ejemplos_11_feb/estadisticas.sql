-- ESTADISTICAS


/*
   1) CPU — Consultas que más CPU consumen
   */
SELECT TOP 20 
    total_worker_time/1000 AS CPU_ms,
    execution_count,
    total_worker_time/execution_count/1000 AS AvgCPU_ms,
    total_elapsed_time/1000 AS TotalTime_ms,
    query_hash
FROM sys.dm_exec_query_stats
ORDER BY total_worker_time DESC;



/*
   2) MEMORIA — Estado de la memoria del servidor
  */
SELECT 
    total_physical_memory_kb/1024 AS TotalMemory_MB,
    available_physical_memory_kb/1024 AS FreeMemory_MB,
    system_memory_state_desc
FROM sys.dm_os_sys_memory;


/* 
   3) BUFFER POOL — Memoria usada para caché de datos
  */

-- 1 pag -> 8kb: cada 128 paginas -> 1 mb
SELECT 
    (SELECT COUNT(*) FROM sys.dm_os_buffer_descriptors)/128 AS BufferPool_MB;


/* 
   4) I/O — Estadísticas de lectura/escritura por archivo
  */
SELECT 
    DB_NAME(database_id) AS DatabaseName,
    file_id,
    num_of_reads,
    num_of_writes,
    io_stall_read_ms,
    io_stall_write_ms,
    io_stall_read_ms / NULLIF(num_of_reads,0) AS ReadLatency_ms,
    io_stall_write_ms / NULLIF(num_of_writes,0) AS WriteLatency_ms
FROM sys.dm_io_virtual_file_stats(NULL, NULL);


/*
   5) ESPERAS — Qué está esperando SQL Server
    */
SELECT 
    wait_type,
    wait_time_ms,
    signal_wait_time_ms,
    waiting_tasks_count
FROM sys.dm_os_wait_stats
ORDER BY wait_time_ms DESC;


/*
   6) BLOQUEOS — Bloqueos actuales en el servidor
   */
SELECT * 
FROM sys.dm_tran_locks;


/*
   7) SESIONES ESPERANDO — Qué sesiones están bloqueadas
   */
SELECT 
    session_id,
    wait_type,
    wait_duration_ms,
    blocking_session_id,
    resource_description
FROM sys.dm_os_waiting_tasks;


/* 
   8) CONSULTAS PESADAS — Lecturas, CPU, tiempo
  */
SELECT TOP 20
    total_logical_reads AS TotalReads,
    total_worker_time AS TotalCPU,
    total_elapsed_time AS TotalTime,
    execution_count,
    query_hash
FROM sys.dm_exec_query_stats
ORDER BY total_logical_reads DESC;

-- Con SQL:
SELECT TOP 20 
    qs.total_logical_reads AS TotalReads,
    qs.total_worker_time AS TotalCPU,
    qs.total_elapsed_time AS TotalTime,
    qs.execution_count,
    qs.query_hash,
    SUBSTRING(st.text, 
              (qs.statement_start_offset/2) + 1,
              ((CASE qs.statement_end_offset 
                    WHEN -1 THEN DATALENGTH(st.text)
                    ELSE qs.statement_end_offset 
                END - qs.statement_start_offset)/2) + 1
    ) AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_logical_reads DESC;



/* 
   9) ÍNDICES — Fragmentación de índices
    */
SELECT 
    dbschemas.[name] AS SchemaName,
    dbtables.[name] AS TableName,
    dbindexes.[name] AS IndexName,
    indexstats.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') AS indexstats
JOIN sys.tables dbtables ON dbtables.[object_id] = indexstats.[object_id]
JOIN sys.schemas dbschemas ON dbtables.[schema_id] = dbschemas.[schema_id]
JOIN sys.indexes dbindexes ON dbindexes.[object_id] = indexstats.[object_id]
    AND indexstats.index_id = dbindexes.index_id
WHERE indexstats.avg_fragmentation_in_percent > 20
ORDER BY indexstats.avg_fragmentation_in_percent DESC;

-- Reorganizar indices y volver a ejecutar:
ALTER INDEX PK_Pedidos ON dbo.Pedidos REORGANIZE;




/*
   10) ÍNDICES — Uso de índices (cuáles no se usan)
   */
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    s.user_seeks,
    s.user_scans,
    s.user_lookups,
    s.user_updates
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats s
    ON i.object_id = s.object_id
    AND i.index_id = s.index_id
WHERE OBJECTPROPERTY(i.object_id, 'IsUserTable') = 1;


/* 
   11) LOG — Uso del Transaction Log
*/
DBCC SQLPERF(LOGSPACE);


/*
   12) LOG — VLFs (Virtual Log Files)
  */
DBCC LOGINFO;


/*
   13) LOG — Por qué no se trunca el log
  */
SELECT 
    name,
    recovery_model_desc,
    log_reuse_wait_desc
FROM sys.databases;


/*
   14) TEMPDB — Uso interno de TempDB
  */
SELECT 
    SUM(user_object_reserved_page_count)*8 AS UserObjects_KB,
    SUM(internal_object_reserved_page_count)*8 AS InternalObjects_KB,
    SUM(version_store_reserved_page_count)*8 AS VersionStore_KB,
    SUM(unallocated_extent_page_count)*8 AS FreeSpace_KB
FROM sys.dm_db_file_space_usage;


/* 
   15) CONEXIONES — Sesiones activas
   */
SELECT 
    session_id,
    login_name,
    host_name,
    program_name,
    status,
    cpu_time,
    memory_usage
FROM sys.dm_exec_sessions where status='running';


/*  16) CONEXIONES — Conexiones por aplicación
   */

-- Las conexiones que se ven a NULL pueden ser internas del propio SQL Server:
SELECT 
    program_name,
    COUNT(*) AS ConnectionCount
FROM sys.dm_exec_sessions
GROUP BY program_name;


/* 
   17) CONTADORES — Estadísticas globales del servidor
   */
SELECT 
    object_name,
    counter_name,
    cntr_value
FROM sys.dm_os_performance_counters order by 3 desc;

-- Mide el tiempo que puede estar una pagina en el buffer pool antes de ser expulsada
SELECT 
    counter_name,
    cntr_value AS PageLifeExpectancy
FROM sys.dm_os_performance_counters
WHERE counter_name = 'Page life expectancy';
