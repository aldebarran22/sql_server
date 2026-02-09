
-- 
set xact_abort off;

use Empresa_PRC;

-- Codigo principal:
declare @a int;
declare @b int;

begin try
	set @a = 1;
	set @b = 0;

	exec dbo.proceso2 @a, @b;
end try

begin catch
	print 'ERROR: ' + error_message();
	print 'PROCEDURE: ' + error_procedure();
	print 'SEVERITY: ' + convert(varchar(20), error_severity());
end catch;

-- Codigo principal:
declare @a int;
declare @b int;

set @a = 1;
set @b = 0;

exec dbo.proceso2 @a, @b;
