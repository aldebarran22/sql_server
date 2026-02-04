
use Empresa_PRC;
-- COLLATION:

-- tablas con mayúsculas / minúsculas: porque fallan si las ponemos en minúsculas:
-- Con que collation se ha importado?
select name, collation_name from sys.databases;

-- Ver el collation real de la BD: ejecutar dentro de la base de datos:
SELECT DATABASEPROPERTYEX(DB_NAME(), 'Collation') AS Collation;

-- OJO con el collation si contiene: CI -> Case Insensitive
-- Si viene CS --> es Case sensitive

-- Para cambiar el collation de la Base de datos:
-- ALTER DATABASE nombre_base_datos COLLATE Modern_Spanish_CI_AS;



----------------------------------------------------------------------------------------------------------------


-- WITH:
-- Solo dura una sentencia, no crea ni tabla, ni nada, es simplemente un valor de sustitución, NO OCUPA ESPACIO
-- NO SE PUEDE VOLVER A UTILIZAR.

with pais_alemania as (select * from pedidos where [PaísDestinatario] = 'Alemania')
select count(*) from pais_alemania;
 --select sum(cargo) from pais_alemania;  --ERROR YA NO EXISTE!


----------------------------------------------------------------------------------------------------------------

-- TABLAS TEMPORALES LOCALES:

-- SQL SERVER: ¡NO SOPORTA LA SINTAXIS: CREATE TABLE #NOMBRE_TABLA AS (SELECT ..) !

-- Una tabla temporal: # 
-- Solo dura la sesión

create table #PedidosAlemania (
	idpedido int,
	pais nvarchar(15),
	cargo float
);
insert into #PedidosAlemania select idpedido,[PaísDestinatario], cargo from pedidos where [PaísDestinatario] = 'Alemania';

select count(*) from #PedidosAlemania;
select sum(cargo) from #PedidosAlemania;


------------------------------------------------------------------


-- TABLAS TEMPORALES GLOBALES:

-- Una tabla temporal global: ##
-- create table ##OtraTabla (....);
-- Se destruyen cuando  nadie las está utilizando!


----------------------------------------------------------


-- VARIABLES DE TIPO TABLA:

DECLARE @MiTabla TABLE (
	id int,
	nombre varchar(10)
);

insert into @MiTabla values(1, 'Juan');
insert into @MiTabla values(2, 'Ana');
insert into @MiTabla values(3, 'Eva');

select * from @MiTabla;


--------------------------------------------------------------

-- TABLAS DERIVADAS: Las subconsultas que están dentro de otra consulta.



--------------------------------------------------------------

-- LEFT JOIN vs *=
select c.[NombreCategoría] 
from Categorias c left join Productos p
on c.[IdCategoría] = p.[IdCategoría]
where p.IdCategoría is null and c.[NombreCategoría]='''Ocio''';

update categorias set NombreCategoría = '''Ocio''' where NombreCategoría='Ocio';

/* DA ERROR!
select c.[NombreCategoría] 
from Categorias c, Productos p
where c.[IdCategoría] *= p.[IdCategoría];
*/


-----------------------------------------------------------------
-- PLAN DE EJECUCION DE LA CONSULTA: CONTROL + L o EL ICONO, MARCAR ANTES LA CONSULTA