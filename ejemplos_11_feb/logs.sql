
-- LOGS:

-- CONSULTAR: ERROR LOG
xp_readerrorlog;

-- DONDE SE ENCUENTRAN LOS FICHEROS 
EXEC xp_readerrorlog 0, 1, N'Logging SQL Server messages';
SELECT SERVERPROPERTY('ErrorLogFileName');

-- CONSULTAR EL LOG DESDE SQL:
EXEC xp_readerrorlog 0, 1;

--LOGS ANTERIORES:
EXEC xp_readerrorlog 0, 1;  -- log actual
EXEC xp_readerrorlog 1, 1;  -- log anterior
EXEC xp_readerrorlog 2, 1;  -- dos logs atrás

EXEC xp_readerrorlog 0, 2; 


CREATE TABLE #Log (
    LogDate DATETIME,
    ProcessInfo VARCHAR(50),
    Text VARCHAR(MAX)
);

INSERT INTO #Log
EXEC xp_readerrorlog 0, 1;

SELECT *
FROM #Log
WHERE Text LIKE '%error%';

-- ROTACION DE LOGS:
EXEC sp_cycle_errorlog;



select @@VERSION;

SELECT *
FROM sys.fn_xe_file_target_read_file(
    'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Log\system_health*.xel',
    'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Log\system_health*.xem',
    NULL,
    NULL
);

SELECT * 
FROM sys.dm_xe_sessions;

SELECT * 
FROM sys.dm_xe_session_targets;

SELECT 
    event_data = CONVERT(XML, event_data)
FROM sys.fn_xe_file_target_read_file(
    'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Log\system_health*.xel',
    NULL,
    NULL,
    NULL
)
WHERE object_name = 'xml_deadlock_report';


-- ACTIVAR / DESACTIVAR SYSTEM HEALTH: START / STOP
ALTER EVENT SESSION system_health ON SERVER STATE = STOP;


-- COMO ESTA?
SELECT name, startup_state, event_session_id
FROM sys.server_event_sessions
WHERE name = 'system_health';


-- DEFAULT TRACE:
SELECT value_in_use
FROM sys.configurations
WHERE name = 'default trace enabled';

-- VER DONDE ESTA EL ARCHIVO
SELECT * FROM fn_trace_getinfo(NULL);

-- VER EL CONTENIDO DEL ARCHIVO:
SELECT * FROM fn_trace_gettable('C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Log\log_44.trc', DEFAULT);

-- VER EVENTOS DE AUTOGROW:
SELECT 
    StartTime,
    DatabaseName,
    FileName,
    EventClass,
    Duration,
    IntegerData AS GrowthIn8KB,
    (IntegerData * 8) / 1024 AS GrowthMB
FROM fn_trace_gettable(
    (SELECT CAST(value AS NVARCHAR(4000)) 
     FROM sys.fn_trace_getinfo(NULL) WHERE property = 2),
    DEFAULT
)
WHERE EventClass IN (92, 93)   -- 92 = Data File Auto Grow, 93 = Log File Auto Grow
ORDER BY StartTime DESC;



-- TRANSACTION LOG:
DBCC SQLPERF(LOGSPACE);

DBCC LOGINFO;

DBCC SHRINKFILE ('Empresa_PRC', 1024);  -- reduce a 1 GB

