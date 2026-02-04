

create or alter view vista_productos
as (
select [IdProducto],[NombreProducto],[IdProveedor],[IdCategoría],Suspendido
from productos where IdCategoría = 1);