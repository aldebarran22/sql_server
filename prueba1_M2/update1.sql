use Empresa_PRC;

-- bloquear:
begin tran
update dbo.testlocks set valor='nuevo' where id=1;
-- commit
