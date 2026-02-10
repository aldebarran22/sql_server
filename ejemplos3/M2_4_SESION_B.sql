
-- SESION B


use Empresa_PRC;

-- ejemplo phantom read
set transaction isolation level read committed;


-- Intento de leer la tabla testlock:
select * from dbo.TestLock; -- se queda bloqueada hasta que la sesion A haga commit o rollback ---> READ COMMITTED

select * from dbo.TestLock;  -- espera a que se haga commit en la sesion A

