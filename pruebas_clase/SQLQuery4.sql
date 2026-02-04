
use Empresa_PRC;

select dbo.OPERACIONES(10,20, 30);

use Empresa_PRC;
select pais, cargo+1 from pedidos
order by 2;

select * from dbo.pedidosPorPais('Alemania');

select CONCAT(nombre, ' ', apellidos) from empleados;

use Academia_PRC;

select nombreAlum + ' ' + telefono from alumnos;
select concat(nombreAlum , ' ' , telefono) from alumnos;