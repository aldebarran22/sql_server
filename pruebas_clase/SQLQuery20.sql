

create or alter procedure nuevo_producto(@nombre varchar(50), @nombre_proveedor varchar(30),
@nombre_categoria varchar(30), @precio money, @suspendido[bit]=0) as

declare
	@id_prod int;

	-- Valido de las 3 formas;
	--select @id_prod =  max(idproducto)+1 from productos;
	--set @id_prod = (select max(idproducto)+1 from productos);
	select @id_prod = (select max(idproducto)+1 from productos);

	insert into productos(IdProducto, NombreProducto, IdProveedor, IdCategoría, PrecioUnidad, Suspendido)
	select top 1 @id_prod, @nombre, pr.idProveedor, c.idcategoría, @precio, @suspendido
	from productos p 
	inner join Proveedores pr on p.IdProveedor = pr.IdProveedor
	inner join Categorias c on c.idcategoría = p.IdCategoría
	where pr.[NombreCompañía] = @nombre_proveedor and c.nombreCategoría = @nombre_categoria;
go