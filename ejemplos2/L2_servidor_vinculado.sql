

-- Ejemplo de un servidor vinculado al servidor local de mi instancia:
EXEC sp_addlinkedserver 
    @server = 'LocalAlias',
    @srvproduct = '',
    @provider = 'SQLNCLI',
    @datasrc = 'localhost\SQLEXPRESS';

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'LocalAlias',
    @useself = 'True',
    @locallogin = NULL,
    @rmtuser = NULL,
    @rmtpassword = NULL;


-- Pruebas
SELECT * FROM LocalAlias.master.sys.databases;

SELECT * FROM LocalAlias.Empresa_PRC.dbo.clientes;


-- Para ejecutar EXEC AT: hay que habilitar RPC, y RPC_OUT
EXEC master.dbo.sp_serveroption 
    @server = 'LocalAlias', 
    @optname = 'rpc', 
    @optvalue = 'true';

EXEC master.dbo.sp_serveroption 
    @server = 'LocalAlias', 
    @optname = 'rpc out', 
    @optvalue = 'true';


EXECUTE ('use Empresa_PRC; CREATE TABLE dbo.Test (Id INT)') AT LocalAlias;
EXECUTE ('use Empresa_PRC; select * from pedidos') AT LocalAlias;



-- Ver informacion configurada:
EXEC master.dbo.sp_helpserver 'LocalAlias';

SELECT *
FROM OPENQUERY(LocalAlias, 'SELECT name, database_id FROM master.sys.databases');


-- COMPARATIVA:
SELECT *
FROM OPENQUERY(LocalAlias, 'SELECT * FROM Empresa_PRC.dbo.clientes');

EXECUTE ('use Empresa_PRC; select * from clientes') AT LocalAlias;

SELECT * FROM LocalAlias.Empresa_PRC.dbo.clientes;


