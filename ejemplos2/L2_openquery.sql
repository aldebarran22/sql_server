

-- Ejemplos de openquery: 

select * from openquery(ACCESSDB, 'select * from clientes');




-- Comprobar si el proveedor ACE esta habilitado para ejecutarse:
EXEC master.dbo.sp_MSset_oledb_prop 
    N'Microsoft.ACE.OLEDB.16.0', 
    N'AllowInProcess', 
    1;

EXEC master.dbo.sp_MSset_oledb_prop 
    N'Microsoft.ACE.OLEDB.16.0', 
    N'DynamicParameters', 
    1;
