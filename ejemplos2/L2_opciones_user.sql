DBCC USEROPTIONS;


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


-- Siempre da igual, con char, probar ON / OFF
SET ANSI_PADDING OFF
DECLARE @x CHAR(10) = 'hola';
SELECT @x, LEN(@x);

-- No afecta a variables, si no, a las tablas:
SET ANSI_PADDING OFF;
DECLARE @v VARCHAR(10) = 'hola   ';
SELECT @v, DATALENGTH(@v);

-- ESTO SI AFECTA, ON / OFF VARIA DE 4 (off) A 7 (on)
SET ANSI_PADDING OFF;
CREATE TABLE T1 (v VARCHAR(10));
INSERT INTO T1 VALUES ('hola   ');
SELECT v, DATALENGTH(v) FROM T1;
DROP TABLE T1;

SET STATISTICS TIME OFF

SET ARITHABORT ON;
SELECT 1 / 0;
select 4 / 3;


EXEC master.dbo.xp_enum_oledb_providers;
