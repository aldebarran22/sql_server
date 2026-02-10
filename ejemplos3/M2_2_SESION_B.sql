
-- SESION B

/*
SQL Server usa bloqueos (locks) para garantizar la consistencia:

S (Shared)  Lectura

U (Update)  Lectura previa a actualización

X (Exclusive)  Escritura

IS/IX/SIX  Locks de intención

Sch-M  Modificación de esquema

Sch-S  Lectura de esquema
*/


use Empresa_PRC;

-- ejemplo dirty read (read uncommitted)
set transaction isolation level read uncommitted;


-- Intento de leer la tabla testlock:
select * from dbo.TestLock where id=1; -- se queda bloqueada hasta que la sesion A haga commit o rollback ---> READ COMMITTED

