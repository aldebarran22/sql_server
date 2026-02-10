-- session 1

BEGIN TRAN;
UPDATE dbo.testDeadlock SET Valor = 'A1' WHERE Id = 1;

-- No hacer commit

WAITFOR DELAY '00:00:05';  -- Espera para que la otra sesión entre
UPDATE dbo.testDeadlock SET Valor = 'A2' WHERE Id = 2;
