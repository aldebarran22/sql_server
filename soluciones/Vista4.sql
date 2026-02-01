use Ventas;

select case when (grouping(dbo.vendedores.nombre)=1) then 'Total' else isnull(dbo.vendedores.nombre,'Desconocido') end as Vendedor, 
	   case when (grouping(dbo.productos.producto)=1) then 'Total' else isnull(dbo.productos.producto, 'Desconocido') end As Producto, 
		count(dbo.productos.id) as total 
	from (dbo.vendedores inner join dbo.ventas on dbo.ventas.idvendedor = dbo.vendedores.id) inner join
		 dbo.productos on dbo.ventas.idproducto = dbo.productos.id
	group by dbo.vendedores.nombre, dbo.productos.producto
	with cube
