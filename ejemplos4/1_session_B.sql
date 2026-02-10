
-- session B

BEGIN TRAN;
UPDATE dbo.testdeadlock SET Valor = 'B1' WHERE Id = 2;

-- no hacer commit

WAITFOR DELAY '00:00:10';
UPDATE dbo.testdeadlock SET Valor = 'B2' WHERE Id = 1;
