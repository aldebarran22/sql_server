

-- Ejemplo de un servidor vinculado al servidor local de mi instancia:
EXEC sp_addlinkedserver 
    @server = 'alias4',
    @srvproduct = '',
    @provider = 'SQLNCLI',
    @datasrc = '172.16.3.149'
EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'alias4',
    @useself = 'False',
    @rmtuser = 'david',
    @rmtpassword = '123456789';


-- Pruebas
SELECT * FROM alias4.master.sys.databases;

SELECT * FROM LocalAlias2.Empresa_PRC.dbo.clientes;

EXEC master.dbo.xp_enum_oledb_providers;


-- Para ejecutar EXEC AT: hay que habilitar RPC, y RPC_OUT
EXEC master.dbo.sp_serveroption 
    @server = 'LocalAlias2', 
    @optname = 'rpc', 
    @optvalue = 'true';

EXEC master.dbo.sp_serveroption 
    @server = 'LocalAlias2', 
    @optname = 'rpc out', 
    @optvalue = 'true';


EXECUTE ('use Empresa_PRC; CREATE TABLE dbo.Test (Id INT)') AT LocalAlias2;
EXECUTE ('use Empresa_PRC; select * from pedidos') AT LocalAlias2;



-- Ver informacion configurada:
EXEC master.dbo.sp_helpserver 'LocalAlias';

SELECT *
FROM OPENQUERY(LocalAlias, 'SELECT name, database_id FROM master.sys.databases');


-- COMPARATIVA:
SELECT *
FROM OPENQUERY(LocalAlias, 'SELECT * FROM Empresa_PRC.dbo.clientes');

EXECUTE ('use Empresa_PRC; select * from clientes') AT LocalAlias;

SELECT * FROM LocalAlias.Empresa_PRC.dbo.clientes;


