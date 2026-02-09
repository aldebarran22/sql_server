
-- Pruebas con openrowset:

exec sp_configure 'show advanced options', 1;
reconfigure with override;
go

exec sp_configure 'Ad Hoc Distributed Queries', 1;
reconfigure with override;
go

select * from openrowset(
'MSDASQL', 
'Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=empresa3;User=root;Password=antonio;',
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


-- Comprobar si esta activo el driver:
SELECT *
FROM OPENROWSET(
    'MSDASQL',
    'Driver={MySQL ODBC 8.0 ANSI Driver};',
    'SELECT 1'
);



