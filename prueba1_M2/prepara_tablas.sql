
use Empresa_PRC;

-- prueba de bloqueos:
create table dbo.testlocks(id int, valor varchar(20));

insert into dbo.testlocks values(1, 'a'),(2,'b');

select * from dbo.testlocks;