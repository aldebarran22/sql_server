
-- Pruebas con openrowset:

exec sp_configure 'show advanced options', 1;
reconfigure with override;
go

exec sp_configure 'Ad Hoc Distributed Queries', 1;
reconfigure with override;
go

select * from openrowset(
'MSDASQL', 
'Driver={MySQL ODBC 9.6 ANSI Driver};Server=localhost;Database=empresa3;User=root;Password=antonio;',
'select * from clientes'
);


-- Para comprobar si estan activados:
EXEC sp_configure 'Ad Hoc Distributed Queries';

-- Comprobar si estamos ejecutando como Administrador
SELECT IS_SRVROLEMEMBER('sysadmin');


-- Habilitar en SQL Server, el driver de MySQL:
EXEC sp_MSset_oledb_prop 'MSDASQL', N'AllowInProcess', 1;
EXEC sp_MSset_oledb_prop 'MSDASQL', N'DynamicParameters', 1;


-- Ver los drivers que tiene activos SQL Server:
EXEC master.dbo.xp_enum_oledb_providers;



SELECT *
FROM OPENROWSET(BULK 'C:\antonio2\iris.csv',
FORMAT='CSV',PARSER_VERSION='2.0')
WITH (SepalLength float,SepalWidth float,PetalLength float,PetalWidth float,Name varchar(100)) AS t;



