SELECT TOP (1000) [IdCompañíaEnvíos]
      ,[NombreCompañía]
      ,[Teléfono]
  FROM [Empresa_PRC].[dbo].[Compañias de envios]


  select [NombreCompañía], count(p.idpedido) as cuenta,
  case
    when count(p.idpedido) between 1 and 250 then 'SIMPLE'
     when count(p.idpedido) between 251 and 300 then 'SUPER'
     when count(p.idpedido) > 300 then 'VIP'
  end as tipo
  from [dbo].[Compañias de envios] c
  inner join [dbo].[Pedidos] p 
  on c.[IdCompañíaEnvíos] = [FormaEnvío]
  group by [NombreCompañía];