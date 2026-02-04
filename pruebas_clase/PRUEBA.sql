use Empresa_PRC;
select * from clientes;

select c.[NombreCategoría] 
from Categorias c left join Productos p
on c.[IdCategoría] = p.[IdCategoría]
where p.IdCategoría is null and c.[NombreCategoría]='''Ocio''';

SELECT * from Productos p where p.IdProveedor=1;

use Empresa_PRC;
select TRY_CONVERT (int, 'hola');

DECLARE @fecha datetime, @fechaFormateada varchar(20)
-- Convertimos ahora una fecha a varchar y la formateamos
-- 3 => dd/mm/aa
SET @fecha = GETDATE()
SET @fechaFormateada = CONVERT(varchar(20), @fecha, 3)
SELECT @fechaFormateada

IF OBJECT_ID('dbo.pedidos') IS NOT NULL
PRINT 'La tabla existe';

select  OBJECT_ID('dbo.pedidos2');