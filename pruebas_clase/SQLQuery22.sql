

create or alter procedure crear_tabla(@nombreTabla varchar(40)) as
declare 
@sql nvarchar(255);

set @sql = 'create table '+@nombreTabla+' (id int, nombre varchar(20))';

 exec sp_executesql @sql;

go