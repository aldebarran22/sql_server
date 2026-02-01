use empresa;
SELECT     dbo.[Compañias de envios].IdCompañíaEnvíos, COUNT(dbo.[Compañias de envios].NombreCompañía) AS NumPedidos, 
                      CASE WHEN COUNT(dbo.[Compañias de envios].NombreCompañía) >= 150 AND COUNT(dbo.[Compañias de envios].NombreCompañía) 
                      <= 250 THEN 'Simple' WHEN COUNT(dbo.[Compañias de envios].NombreCompañía) > 250 AND COUNT(dbo.[Compañias de envios].NombreCompañía) 
                      <= 300 THEN 'Normal' WHEN COUNT(dbo.[Compañias de envios].NombreCompañía) > 300 AND COUNT(dbo.[Compañias de envios].NombreCompañía) 
                      <= 350 THEN 'Super' END AS Tipo
FROM         dbo.[Compañias de envios] LEFT OUTER JOIN
                      dbo.Pedidos ON dbo.[Compañias de envios].IdCompañíaEnvíos = dbo.Pedidos.FormaEnvío
GROUP BY dbo.[Compañias de envios].IdCompañíaEnvíos