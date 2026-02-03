

select * from drsdb.dbo.C_PAIS;

SELECT newid()+ 'una clave';

select @@connections;

select @@SERVERNAME;

select @@TRANCOUNT;

select @@version;

declare @miFecha datetime
set @miFecha = getdate()
print @miFecha;

Select replace('abcdefg', 'cd','xx');

select datename(m, getdate());

select eomonth('12/05/2026', -1);

SELECT DATEADD(DAY, 1, EOMONTH(GETDATE(), -1));

select ceiling(1.1), floor(3.9999);

select @@servername;

