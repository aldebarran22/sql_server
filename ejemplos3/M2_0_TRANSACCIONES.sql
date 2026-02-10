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
