
-- SESION A


use Empresa_PRC;


-- bloqueo de lecturas (exclusivo X)
begin tran;
update dbo.testlock set valor = 'A2' where Id=1;


commit; -- despues de hacer la primera lectura desde la sesion B
