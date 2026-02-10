
-- session B

BEGIN TRAN;
UPDATE dbo.testDeadlock SET Valor = 'B1' WHERE Id = 2;

-- no hacer commit

WAITFOR DELAY '00:00:05';
UPDATE dbo.testDeadlock SET Valor = 'B2' WHERE Id = 1;
