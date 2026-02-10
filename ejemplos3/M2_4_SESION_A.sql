
-- SESION A


use Empresa_PRC;



begin tran;
insert into dbo.testlock values(3, 'nuevo2');


commit; -- despues de hacer la primera lectura desde la sesion B
