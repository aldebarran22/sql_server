
-- SESION A

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


-- bloqueo de lecturas (exclusivo X)
begin tran;
update dbo.testlock
set valor = 'A-modificando'
where Id=1;
-- Sin commit ni rollback
