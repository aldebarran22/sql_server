SELECT TOP (1000) [IdProducto]
      ,[NombreProducto]
      ,[IdProveedor]
      ,[IdCategoría]
      ,[CantidadPorUnidad]
      ,[PrecioUnidad]
      ,[UnidadesEnExistencia]
      ,[UnidadesEnPedido]
      ,[NivelNuevoPedido]
      ,[Suspendido]
  FROM [Empresa_PRC].[dbo].[Productos]


  delete from Productos where IdProducto >= 100;