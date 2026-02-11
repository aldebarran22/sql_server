-- session 1

BEGIN TRAN;
UPDATE dbo.testdeadlock SET Valor = 'A1' WHERE Id = 1;

-- No hacer commit

-- Espera para que la otra sesión entre
WAITFOR DELAY '00:00:10';  
UPDATE dbo.testdeadlock SET Valor = 'A2' WHERE Id = 2;
